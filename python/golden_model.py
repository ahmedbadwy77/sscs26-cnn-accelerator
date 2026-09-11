from pathlib import Path


PIXEL_BITS = 8
MAX_PIXEL = 255

PROJECT_DIRECTORY = Path(__file__).resolve().parent.parent
EXPECTED_DIRECTORY = PROJECT_DIRECTORY / "expected_outputs"

CONFIGURATIONS = [
    (3, 8, 0),
    (3, 32, 0),
    (3, 32, 1),
    (3, 64, 0),
    (4, 32, 0),
    (5, 32, 0),
    (7, 32, 0),
]

MULTI_KERNEL_COUNTS = [1, 2, 3]

BURST_LENGTHS = [1100, 600, 600, 600]


def clog2(value):
    return (value - 1).bit_length()


def to_signed(byte_value):
    return byte_value - 256 if byte_value >= 128 else byte_value


def output_width(kernel_size):
    return 2 * PIXEL_BITS + clog2(kernel_size * kernel_size)


EXTRA_PIPELINE_STAGES = 1

def pipeline_latency(kernel_size):
    return kernel_size * kernel_size + EXTRA_PIPELINE_STAGES

def fill_cycles(kernel_size, width):
    return (kernel_size - 1) * width + (kernel_size - 1)


def step_lfsr(value):
    return (
        ((value << 1) & 0xFF)
        |
        (
            ((value >> 7) & 1)
            ^ ((value >> 5) & 1)
            ^ ((value >> 4) & 1)
            ^ ((value >> 3) & 1)
        )
    )


def generate_delta_kernel(kernel_size):
    kernel = [0] * (kernel_size * kernel_size)
    kernel[-1] = 1
    return kernel


def generate_lfsr_kernel(seed, kernel_size):
    kernel = []
    lfsr_value = seed

    for _ in range(kernel_size * kernel_size):
        kernel.append(lfsr_value)
        lfsr_value = step_lfsr(lfsr_value)

    return kernel


def generate_corner_kernel(kernel_size):
    pattern = [0x7F, 0x80, 0xFF, 0x00]

    return [
        pattern[index % 4]
        for index in range(kernel_size * kernel_size)
    ]


def generate_multi_kernels(kernel_size, num_kernels):
    kernels = [
        generate_delta_kernel(kernel_size)
    ]

    if num_kernels >= 2:
        kernels.append(
            generate_lfsr_kernel(
                0xB7,
                kernel_size
            )
        )

    if num_kernels >= 3:
        kernels.append(
            generate_corner_kernel(kernel_size)
        )

    return kernels[:num_kernels]


def generate_ramp_pixels(length):
    return [
        (index % 251) + 1
        for index in range(1, length + 1)
    ]


def generate_lfsr_pixels(length, initial_lfsr):
    pixels = []
    lfsr_value = initial_lfsr

    for _ in range(length):
        pixels.append(lfsr_value)
        lfsr_value = step_lfsr(lfsr_value)

    return pixels, lfsr_value


def burst_stream_outputs(
    image,
    kernel_bytes,
    width,
    kernel_size,
    burst_length,
    relu
):
    fill = fill_cycles(kernel_size, width)

    output_count = max(
        0,
        burst_length
        - fill
        - pipeline_latency(kernel_size)
    )

    outputs = []

    for output_index in range(output_count):
        anchor_index = fill + output_index - 1

        anchor_row = anchor_index // width
        anchor_col = anchor_index % width

        total = 0

        for kernel_index in range(kernel_size * kernel_size):
            kernel_row = kernel_index // kernel_size
            kernel_col = kernel_index % kernel_size

            image_row = (
                anchor_row
                - (kernel_size - 1)
                + kernel_row
            )

            image_col = (
                anchor_col
                - (kernel_size - 1)
                + kernel_col
            )

            image_index = image_row * width + image_col

            if 0 <= image_index < min(burst_length, len(image)):
                pixel_value = image[image_index]
            else:
                pixel_value = 0

            total += (
                to_signed(kernel_bytes[kernel_index])
                * pixel_value
            )

        if relu and total < 0:
            total = 0

        outputs.append(total)

    return outputs


def interleave_kernel_outputs(kernel_outputs):
    outputs = []

    output_count = len(kernel_outputs[0])

    for output_index in range(output_count):
        for kernel_index in range(len(kernel_outputs)):
            outputs.append(
                kernel_outputs[kernel_index][output_index]
            )

    return outputs


def generate_parallel_burst_outputs(
    image,
    kernels,
    width,
    kernel_size,
    burst_length,
    relu
):
    kernel_outputs = []

    for kernel in kernels:
        kernel_outputs.append(
            burst_stream_outputs(
                image,
                kernel,
                width,
                kernel_size,
                burst_length,
                relu
            )
        )

    return interleave_kernel_outputs(
        kernel_outputs
    )


def generate_all_outputs(
    kernel_size,
    width,
    relu,
    num_kernels
):
    kernels = generate_multi_kernels(
        kernel_size,
        num_kernels
    )

    outputs = []

    burst_a_pixels = generate_ramp_pixels(
        BURST_LENGTHS[0]
    )

    outputs.extend(
        generate_parallel_burst_outputs(
            burst_a_pixels,
            kernels,
            width,
            kernel_size,
            BURST_LENGTHS[0],
            relu
        )
    )

    kernel_b = generate_lfsr_kernel(
        0xB7,
        kernel_size
    )

    lfsr_after_kernel_b = 0xB7

    for _ in range(kernel_size * kernel_size):
        lfsr_after_kernel_b = step_lfsr(
            lfsr_after_kernel_b
        )

    burst_b_pixels, lfsr_after_burst_b = (
        generate_lfsr_pixels(
            BURST_LENGTHS[1],
            lfsr_after_kernel_b
        )
    )

    outputs.extend(
        generate_parallel_burst_outputs(
            burst_b_pixels,
            kernels,
            width,
            kernel_size,
            BURST_LENGTHS[1],
            relu
        )
    )

    burst_c_pixels, lfsr_after_burst_c = (
        generate_lfsr_pixels(
            BURST_LENGTHS[2],
            lfsr_after_burst_b
        )
    )

    outputs.extend(
        generate_parallel_burst_outputs(
            burst_c_pixels,
            kernels,
            width,
            kernel_size,
            BURST_LENGTHS[2],
            relu
        )
    )

    burst_d_pixels, _ = generate_lfsr_pixels(
        BURST_LENGTHS[3],
        lfsr_after_burst_c
    )

    outputs.extend(
        generate_parallel_burst_outputs(
            burst_d_pixels,
            kernels,
            width,
            kernel_size,
            BURST_LENGTHS[3],
            relu
        )
    )

    return outputs


def expected_output_count(
    kernel_size,
    width,
    num_kernels
):
    outputs_per_kernel = sum(
        max(
            0,
            burst_length
            - fill_cycles(kernel_size, width)
            - pipeline_latency(kernel_size)
        )
        for burst_length in BURST_LENGTHS
    )

    return num_kernels * outputs_per_kernel


def generate_expected_file(
    kernel_size,
    width,
    relu,
    num_kernels
):
    outputs = generate_all_outputs(
        kernel_size,
        width,
        relu,
        num_kernels
    )

    expected_count = expected_output_count(
        kernel_size,
        width,
        num_kernels
    )

    if len(outputs) != expected_count:
        raise RuntimeError(
            f"Output count mismatch for "
            f"N={kernel_size} W={width} "
            f"ReLU={relu} NUM_KERNELS={num_kernels}: "
            f"generated={len(outputs)} "
            f"expected={expected_count}"
        )

    filename = (
        f"expected_out_{kernel_size}x{width}"
        f"_relu{relu}_k{num_kernels}.txt"
    )

    output_path = EXPECTED_DIRECTORY / filename

    with output_path.open("w", encoding="utf-8") as expected_file:
        for value in outputs:
            expected_file.write(f"{value}\n")

    return output_path, len(outputs)


def run_self_tests():
    failures = []

    signed_checks = {
        0: 0,
        1: 1,
        127: 127,
        128: -128,
        255: -1,
        200: -56
    }

    signed_ok = all(
        to_signed(byte_value) == expected_value
        for byte_value, expected_value in signed_checks.items()
    )

    delta_image = generate_ramp_pixels(1100)
    delta_kernel = generate_delta_kernel(3)

    delta_outputs = burst_stream_outputs(
        delta_image,
        delta_kernel,
        32,
        3,
        1100,
        False
    )

    fill = fill_cycles(3, 32)

    expected_delta = [
        delta_image[fill + index - 1]
        for index in range(len(delta_outputs))
    ]

    delta_ok = (
        delta_outputs == expected_delta
        and len(delta_outputs) == 1024
    )

    multi_kernel_ok = True

    for kernel_size in (3, 4, 5, 7):
        for width in (8, 32, 64):
            for num_kernels in (1, 2, 3):
                outputs = generate_all_outputs(
                    kernel_size,
                    width,
                    False,
                    num_kernels
                )

                expected_count = expected_output_count(
                    kernel_size,
                    width,
                    num_kernels
                )

                if len(outputs) != expected_count:
                    multi_kernel_ok = False

    relu_kernel = [128] * 9

    negative_outputs = burst_stream_outputs(
        generate_ramp_pixels(1100),
        relu_kernel,
        32,
        3,
        1100,
        False
    )

    relu_outputs = burst_stream_outputs(
        generate_ramp_pixels(1100),
        relu_kernel,
        32,
        3,
        1100,
        True
    )

    relu_ok = (
        any(value < 0 for value in negative_outputs)
        and all(value == 0 for value in relu_outputs)
    )

    overflow_ok = all(
        kernel_size * kernel_size * MAX_PIXEL * 128
        < 2 ** (output_width(kernel_size) - 1)
        for kernel_size in range(3, 8)
    )

    print(
        "TEST 1  signed kernel interpretation .......... "
        + ("PASS" if signed_ok else "FAIL")
    )

    print(
        "TEST 2  delta raster law ...................... "
        + ("PASS" if delta_ok else "FAIL")
    )

    print(
        "TEST 3  parallel kernels K=1..3 .............. "
        + ("PASS" if multi_kernel_ok else "FAIL")
    )

    print(
        "TEST 4  ReLU saturation ....................... "
        + ("PASS" if relu_ok else "FAIL")
    )

    print(
        "TEST 5  no-overflow bound, N=3..7 ............. "
        + ("PASS" if overflow_ok else "FAIL")
    )

    if not signed_ok:
        failures.append("signed kernel interpretation")

    if not delta_ok:
        failures.append("delta raster law")

    if not multi_kernel_ok:
        failures.append("parallel multi-kernel output count")

    if not relu_ok:
        failures.append("ReLU saturation")

    if not overflow_ok:
        failures.append("overflow bound")

    if failures:
        print(
            "SELF-TEST: FAILURES: "
            + "; ".join(failures)
        )
        return False

    print("SELF-TEST: ALL PASS")
    return True


def main():
    if not run_self_tests():
        print("PYTHON GOLDEN GENERATION: FAIL")
        return

    EXPECTED_DIRECTORY.mkdir(
        parents=True,
        exist_ok=True
    )

    total_files = 0
    total_outputs = 0

    for kernel_size, width, relu in CONFIGURATIONS:
        for num_kernels in MULTI_KERNEL_COUNTS:
            output_path, output_count = generate_expected_file(
                kernel_size,
                width,
                relu,
                num_kernels
            )

            total_files += 1
            total_outputs += output_count

            print(
                f"GENERATED: {output_path} "
                f"({output_count} outputs)"
            )

    print()
    print(f"GENERATED FILES: {total_files}")
    print(
        f"TOTAL EXPECTED OUTPUT VALUES: {total_outputs}"
    )
    print(
        "PYTHON GOLDEN FILES GENERATED SUCCESSFULLY"
    )


if __name__ == "__main__":
    main()

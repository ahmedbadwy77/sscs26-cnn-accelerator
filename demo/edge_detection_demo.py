"""Edge-detection demonstration for the streaming CNN convolution accelerator.

The competition core performs signed N-by-N convolution with runtime-programmable
8-bit coefficients. Loading the classic Sobel operators turns the SAME datapath
into a 3x3 edge detector - no RTL changes are required.

This script produces, for a deterministic 32x32 test image:
  - the input image (one 0..255 pixel value per line)
  - expected RTL outputs for Sobel Gx and Gy (valid padding, stride 1 -> 30x30)
  - the same gradients with the ReLU clamp applied (RELU_EN=1 behavior)

Fixed-point contract is identical to the accelerator:
  pixel 8-bit unsigned, kernel 8-bit signed, products 17-bit signed,
  full-precision accumulation in 20 bits (no truncation/rounding/saturation).
Worst-case |accumulation| for Sobel = 8*255 = 2040 << 2^19, so the 20-bit
output cannot overflow - consistent with the core's bit-width analysis.

Run:  python edge_detection_demo.py
"""

from pathlib import Path

HERE = Path(__file__).resolve().parent
IMG_W = 32
N = 3

SOBEL_GX = [-1, 0, 1, -2, 0, 2, -1, 0, 1]   # row-major, row 0 first
SOBEL_GY = [-1, -2, -1, 0, 0, 0, 1, 2, 1]


def make_test_image():
    """Deterministic 32x32 grayscale scene: bright rectangle on a horizontal
    ramp plus a diagonal step, so both operators see real edges."""
    px = []
    for y in range(IMG_W):
        row = []
        for x in range(IMG_W):
            v = 4 * x // 8 + 2          # gentle horizontal ramp: 2..30
            if 8 <= x < 24 and 8 <= y < 20:
                v = 220                 # bright block -> strong vertical edges
            if x - y == 26:
                v = 255                 # diagonal step on the right side
            row.append(max(0, min(255, v)))
        px.append(row)
    return px


def to_signed_byte(v):
    """8-bit two's-complement storage semantics, matching kernel_coeff_memory."""
    v &= 0xFF
    return v - 256 if v >= 128 else v


def conv3x3_valid(img, kernel):
    """Signed valid-padding stride-1 3x3 convolution, full-precision accumulation.

    Coefficient j multiplies the window tap sharing its (row, col) offset -
    the same positional mapping the RTL uses between kernels_flat and window_flat.
    """
    out = []
    for y in range(IMG_W - N + 1):
        for x in range(IMG_W - N + 1):
            acc = 0
            for ky in range(N):
                for kx in range(N):
                    acc += to_signed_byte(kernel[ky * N + kx]) * img[y + ky][x + kx]
            out.append(acc)
    return out


def relu(v):
    return 0 if v < 0 else v


def main():
    img = make_test_image()

    img_path = HERE / "test_image_32x32.txt"
    img_path.write_text(
        "\n".join(str(v) for row in img for v in row) + "\n",
        encoding="utf-8", newline="\n",
    )

    gx = conv3x3_valid(img, SOBEL_GX)
    gy = conv3x3_valid(img, SOBEL_GY)
    gx_relu = [relu(v) for v in gx]
    gy_relu = [relu(v) for v in gy]

    outputs = {
        "expected_sobel_gx.txt": gx,
        "expected_sobel_gy.txt": gy,
        "expected_sobel_gx_relu.txt": gx_relu,
        "expected_sobel_gy_relu.txt": gy_relu,
    }
    for name, values in outputs.items():
        p = HERE / name
        p.write_text(
            "\n".join(str(v) for v in values) + "\n",
            encoding="utf-8", newline="\n",
        )
        print(f"GENERATED: {p.name} ({len(values)} outputs, range {min(values)}..{max(values)})")

    print(f"Input image: {img_path.name} ({IMG_W * IMG_W} pixels)")
    print("Valid-padding stride-1 convolution -> 30x30 = 900 outputs per operator")
    print("EDGE DETECTION DEMO FILES GENERATED SUCCESSFULLY")


if __name__ == "__main__":
    main()

import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from pathlib import Path

HERE = Path(__file__).resolve().parent

# Layout-aware paths - works with both folder structures:
#   reorganized: demo/data/, demo/expected/, output -> docs/images/
#   flat:        demo/*.txt,          output -> images/
DATA_DIR = HERE / "data" if (HERE / "data").is_dir() else HERE
EXPECTED_DIR = HERE / "expected" if (HERE / "expected").is_dir() else HERE
DOCS_DIR = HERE.parent / "docs"
IMAGES_DIR = (DOCS_DIR / "images") if DOCS_DIR.is_dir() else (HERE.parent / "images")
IMAGES_DIR.mkdir(parents=True, exist_ok=True)


def txt_to_png(txt_path, size, out_filename, title):
    with open(txt_path, "r") as f:
        data = [float(line.strip()) for line in f if line.strip()]

    img_array = np.array(data).reshape((size, size))

    plt.figure(figsize=(3, 3))
    plt.imshow(img_array, cmap="gray")
    plt.title(title, fontsize=10, fontweight="bold")
    plt.axis("off")
    out_path = IMAGES_DIR / out_filename
    plt.savefig(out_path, bbox_inches="tight", pad_inches=0.1, dpi=150)
    plt.close()
    print(f"Saved: {out_path}")


if __name__ == "__main__":
    print("Generating demo images...")

    txt_to_png(DATA_DIR / "test_image_32x32.txt", 32,
               "test_image_preview.png", "Original Image (32x32)")

    txt_to_png(EXPECTED_DIR / "expected_sobel_gx_relu.txt", 30,
               "sobel_gx_preview.png", "Sobel Gx + ReLU (30x30)")
    txt_to_png(EXPECTED_DIR / "expected_sobel_gy_relu.txt", 30,
               "sobel_gy_preview.png", "Sobel Gy + ReLU (30x30)")

    print("Done!")

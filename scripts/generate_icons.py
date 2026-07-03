"""One-off script to derive favicon/app-icons from the company logo.
Run manually with: python scripts/generate_icons.py
"""
from PIL import Image

SRC = "assets/images/alessandro_luciano_logo.png"
BG = (253, 250, 235, 255)  # sampled cream background of the source logo

def bbox_of_mark(im, tolerance=18):
    im = im.convert("RGBA")
    px = im.load()
    w, h = im.size
    min_x, min_y, max_x, max_y = w, h, 0, 0
    for y in range(0, h, 2):
        for x in range(0, w, 2):
            r, g, b, a = px[x, y]
            if abs(r - BG[0]) > tolerance or abs(g - BG[1]) > tolerance or abs(b - BG[2]) > tolerance:
                min_x, min_y = min(min_x, x), min(min_y, y)
                max_x, max_y = max(max_x, x), max(max_y, y)
    return min_x, min_y, max_x, max_y

def make_square(im, mark_ratio):
    """Crop tightly to the mark, then paste centered onto a square cream
    canvas where the mark occupies `mark_ratio` of the canvas size."""
    l, t, r, b = bbox_of_mark(im)
    mark = im.crop((l, t, r, b))
    mw, mh = mark.size
    side = max(mw, mh) / mark_ratio
    canvas = Image.new("RGBA", (int(side), int(side)), BG)
    offset = (int((side - mw) / 2), int((side - mh) / 2))
    canvas.paste(mark, offset, mark)
    return canvas

def save_sized(square, size, path):
    square.resize((size, size), Image.LANCZOS).save(path)

def main():
    im = Image.open(SRC)

    standard = make_square(im, mark_ratio=0.86)
    save_sized(standard, 32, "web/favicon.png")
    save_sized(standard, 192, "web/icons/Icon-192.png")
    save_sized(standard, 512, "web/icons/Icon-512.png")
    save_sized(standard, 192, "web/icons/Icon-192-maskable-source.png")  # debug

    maskable = make_square(im, mark_ratio=0.62)
    save_sized(maskable, 192, "web/icons/Icon-maskable-192.png")
    save_sized(maskable, 512, "web/icons/Icon-maskable-512.png")

    print("Done.")

if __name__ == "__main__":
    main()

from PIL import Image, ImageOps

def add_border(input_image, output_image, border):
    img = Image.open(input_image)

    if isinstance(border, int) or isinstance(border, tuple):
        bimg = ImageOps.expand(img, border=border)
    else:
        raise RuntimeError('Border is not an integer or tuple!')

    bimg.save(output_image)

if __name__ == '__main__':
    pic = "{}{}".format(i, ".png")
    for i in range(80):
        add_border(pic, pic, border=2)
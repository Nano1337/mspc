from PIL import Image
import os

def create_gif(image_folder, output_file):
    images = []
    for filename in sorted(os.listdir(image_folder)):
        if filename.endswith('.png') or filename.endswith('.jpg'):
            image_path = os.path.join(image_folder, filename)
            img = Image.open(image_path)
            images.append(img)
    
    images[0].save(output_file, save_all=True, append_images=images[1:], duration=200, loop=0) # 30 fps = duration 33

if __name__ == '__main__':
    input_folder = r'/home/public/clinicalColorAdapt_blueWLC/testA'
    # input_folder = r'/home/yinh4/MSPC/data/dsWLC_test/testB'
    output_folder = r'/home/yinh4/MSPC/gifs'
    output_file = os.path.join(output_folder, 'blueWLC_input.gif')
    create_gif(input_folder, output_file)

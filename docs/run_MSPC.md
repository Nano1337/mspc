if the conda environment doesn't exist, create it using the following command:
```bash
conda env create --name mspc --file environment.yml
```

Then, activate the conda environment using the following command:
```bash
conda activate mspc
```

### Training MSPC

Ensure data is 128x128 in resolution. Make a copy of the [run_gcpert_alpha_1.8_template.sh](../run_gcpert_alpha_1.8_template.sh) script and modify the file name as well as parameters for name and dataroot. The dataroot should point to the directory containing subfolders in the format of trainA, trainB, testA, testB, which can be all unpaired data. 

To train the model, run the following command:
```bash
sh ./run_gcpert_alpha_1.8_name.sh # modify to name of script
```

### Testing MSPC

To test the model, modify the values in [run_gcpert_alpha_n_eval.sh](../run_gcpert_alpha_n_eval.sh) and run the following command:
```bash
sh ./run_gcpert_alpha_n_eval.sh # modify to name of script
```

The generated output frames can be found in subfolder of the results directory. The name of the nested subfolder is the name of the model with the directory 'fakeB' containing the generated frames. Given these frames, you can use the [create_gif.py](../util/create_gif.py) script to create a gif of the generated frames. To compare the generated frames to the ground truth, you can sync the gif of input with other gifs using the documentation found in [USE_COLAB.md](../gifs/USE_COLAB.md). 

### Known Issues
During testing, errors for model loading may occur. This is due to the way that the model checkpoint is reloaded in the testing script as the model checkpoint path is automatically generated using several config parameters. To resolve this issue, please carefully debug the model checkpoint path and ensure that the path is correct.
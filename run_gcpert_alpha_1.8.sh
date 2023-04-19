#! /bin/bash

# run python3 -m visdom.server -p 8098 first to start visdom server for visualizations then run this script

name='gcpert_alpha_1.8'
pert_threshold=1.8 ###scale of perturbation 
lambda_blank=50.0  ###constraint coefficient of perturbation
identity=10.0
direction='AtoB'

dataroot='/home/yinh4/Decent/datasets/dsWLC'
batch_size=4 # best result with batch_size=1
load_size=144
crop_size=128 # double check resolution of dataset
model=maxgcpert3_gan
bounded=unbounded
netG=resnet_9blocks
netD=basic

python train.py --name $name --dataroot $dataroot --model $model --gan_mode lsgan \
--bounded $bounded --grid_size 2 --pert_threshold $pert_threshold --lambda_blank $lambda_blank \
--pool_size 50 --no_dropout --load_size $load_size --crop_size $crop_size \
--netG $netG --netD $netD --batch_size $batch_size --identity $identity \
--direction $direction --use_wandb --gpu_ids 3;
#python test.py --dataroot $dataroot --model $model --eval \
#--bounded $bounded --grid_size 2 --pert_threshold $pert_threshold --lambda_blank $lambda_blank \
#--no_dropout --load_size $load_size --crop_size $crop_size \
#--netG $netG --netD $netD --batch_size $batch_size --identity $identity \
#--direction $direction
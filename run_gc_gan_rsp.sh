#! /bin/bash

name='gc_gan_rsp'

direction='AtoB'

dataroot='/home/yinh4/Decent/datasets/dsWLC'
batch_size=4
load_size=144
crop_size=128
netG=resnet_9blocks
netD=basic

python train.py --dataroot $dataroot --name $name \
--model gc_gan --gan_mode lsgan --pool_size 50 --no_dropout --load_size $load_size --crop_size $crop_size \
--netG $netG --netD $netD --batch_size $batch_size \
--identity 0.5 --rsp \
--direction $direction;
# python test.py --dataroot $dataroot --eval \
# --model gc_gan --no_dropout --load_size $load_size --crop_size $crop_size \
# --netG $netG --netD $netD --batch_size $batch_size \
# --identity 0.5 --geometry rot \
# --direction $direction

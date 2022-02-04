#!/bin/bash

# dont hack anyone password without premission... thx

echo "you need hashcat for this script. do you have it? (y or n)"
read IA
# IA means installation answer

if [ "$IA" != "${IA#[Yy]}"]; then
           echo "moving on..."
           sleep 0.50
           echo "enter attack mode"
else
           echo "installing hashcat..."
           sudo apt-get update && sudo apt-get install hashcat
           exit
fi

read AMODE

if [ "$AMODE" != "${AMODE[0, 1, 3, 6, 7]}" ]; then
# note: this is only a basic hashcat attack. not the hybrid stuff.
              echo "enter hash type"
else
              echo "invalid attack mode"
              sleep 1
              echo "do you want to run hashcat -h (Y or n)"
              read A
              if [ "$A" != "${A[Yy]}"]; then
              hashcat -h
              exit
      else
              echo "exiting..."
              exit
      fi
fi

read HTYPE

echo "enter hash file or just raw hash (NOTE: dont use ~ for home directory use /home/'username')"
read HFILE

echo "enter password list"
read PASLIST

echo "this is your command: hashcat -a $AMODE -m $HTYPE $HFILE $PASLIST . do you wish to run it (Y or n)"
read A2

if [ "$A2" != "${A2#[Yy]}" ]; then
           echo "ok"
           sleep 1
           echo "do you want to run with sudo (Y or n)"
else
           echo "ok..."
           sleep 0.50
           echo "BYE!"
           exit
fi

read SUPERUSER

if [ "$SUPERUSER" != "${SUPERUSER#[Yy]}" ]; then
           echo "running your command now"
           sudo hashcat -a $AMODE -m $HTYPE $HFILE $PASLIST
else
           echo "running your command now"
           hashcat -a $AMODE -m $HTYPE $HFILE $PASLIST
fi

# finished in 33 mins with 68 lines

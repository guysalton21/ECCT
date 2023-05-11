#!/bin/bash


pip install -r requirements.txt

# the trap code is designed to send a stop (SIGTERM) signal to child processes, 
# thus allowing python code to catch the signal and execute a callback
trap 'trap " " SIGTERM; kill 0; wait' SIGTERM
python Main.py --gpu=0 --N_dec=6 --d_model=32 --code_type=POLAR --code_n=64 --code_k=32 &
wait

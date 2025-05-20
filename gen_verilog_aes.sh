#!/usr/bin/env sh

export PRJ=$PWD

cd $PRJ/config && python gcm_config.py --mode 256 --size L --pipe 0

cd $PRJ/src/gen_rtl/

mkdir -p verilog

ghdl -i --std=08 --work=aes_gcm --workdir=verilog -Pbuild ../*.vhd *.vhd

ghdl -m --std=08 --ieee=synopsys --work=aes_gcm --workdir=verilog top_aes_gcm

ghdl synth -v --std=08 --ieee=synopsys --work=aes_gcm --workdir=verilog -Pbuild --out=verilog top_aes_gcm > top_aes_gcm.v

cd $PRJ/verilog-tb

python gcm_testbench.py -m 256 -p 0 -s L -g


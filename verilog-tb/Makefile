TOPLEVEL_LANG ?= verilog
PWD=$(shell pwd)
SRCDIR=$(PWD)/../src/gen_rtl/

SIM ?= icarus

ifeq ($(WAVE_ON),true)
PLUSARGS+=--wave=$(DUMP_FILENAME)
endif

#DUT
VERILOG_SOURCES += $(SRCDIR)/top_aes_gcm.v
TOPLEVEL = top_aes_gcm

GPI_IMPL := vpi

export TOPLEVEL_LANG
MODULE=gcm_test

include $(shell cocotb-config --makefiles)/Makefile.sim

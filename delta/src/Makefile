# Makefile; see License.txt for copyright and terms of use

# Makefile for delta/src.
# Daniel S. Wilkerson dsw@cs.berkeley.edu

BINDIR := ../bin
CC := gcc
CFLAGS := -Wall
# CFLAGS += -g
FLEX := flex
.SUFFIXES:
.PHONY: all dist_build clean

all: $(BINDIR)/topformflat

dist_build: topformflat.c

clean:; rm -f topformflat.c $(BINDIR)/topformflat

$(BINDIR)/topformflat: $(BINDIR)/%: %.c
	$(CC) $(CFLAGS) -o $@ $(*F).c

topformflat.c: %.c: %.l
	$(FLEX) -o$(*F).c $<

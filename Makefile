#
#   Copyright (C) 2021-2022 ABZ Conference <https://abz-conf.org>
#   All rights reserved.
#
#   Developed by: Philipp Paulweber et al.
#                 <https://github.com/abz-conf/abz-conf.logo/graphs/contributors>
#
#   This file is part of abz-conf.logo.
#
#   TODO
#

OBJ = obj

KIND  = icon
KIND += favicon
KIND += logo
KIND += rect
KIND += badge
KIND += banner
KIND += banner_rsbm

SOURCES = $(KIND:%=src/%.svg)

SIZE  = 32
SIZE += 48
SIZE += 64
SIZE += 128
SIZE += 256
SIZE += 512
SIZE += 1024

EXPORT  = $(SIZE:%=$(OBJ)/icon/%.png)        $(OBJ)/icon.pdf
EXPORT += $(SIZE:%=$(OBJ)/favicon/%.png)     $(OBJ)/favicon.pdf
EXPORT += $(SIZE:%=$(OBJ)/logo/%.png)        $(OBJ)/logo.pdf
EXPORT += $(SIZE:%=$(OBJ)/rect/%.png)        $(OBJ)/rect.pdf
EXPORT += $(SIZE:%=$(OBJ)/badge/%.png)       $(OBJ)/badge.pdf
EXPORT += $(SIZE:%=$(OBJ)/banner/%.png)      $(OBJ)/banner.pdf

EXPORT += obj/headline.png

default: $(EXPORT)

%.png: $(SOURCES)
	@mkdir -p `dirname $@`
	@echo
	@echo $@
	@inkscape -C -h `basename $@ .png` --export-filename $@ src/`basename \`dirname $@\``.svg

%.pdf: $(SOURCES)
	@mkdir -p `dirname $@`
	@echo
	@echo $@
	@inkscape --export-filename $@ src/`basename $@ .pdf`.svg

obj/headline.png: $(OBJ)/rect/64.png
	cp -f $< $@

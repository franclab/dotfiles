#!/bin/sh

for f in ./*.svg
do
	inkscape $f --export-pdf=$f.pdf
	sleep 5
done



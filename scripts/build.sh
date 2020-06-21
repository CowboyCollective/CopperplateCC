#!/bin/sh


set -e

echo "Generating TrueType Fonts"
fontmake  -o ttf --output-dir ../fonts/ttf2/ -u ../sources/UFO/Heavy.ufo ../sources/UFO/Bold.ufo

echo "Hot Fixes"
gftools fix-dsig -f ../fonts/ttf2/*.ttf

mkdir -p ../fonts/ttf

ttfautohint -n ../fonts/ttf2/Heavy.ttf ../fonts/ttf/CopperplateCC-Heavy.ttf
ttfautohint -n ../fonts/ttf2/Bold.ttf ../fonts/ttf/CopperplateCC-Bold.ttf

gftools fix-hinting ../fonts/ttf/CopperplateCC-Heavy.ttf
gftools fix-hinting ../fonts/ttf/CopperplateCC-Bold.ttf

echo "Cleaning Directory Up"
rm ../fonts/ttf/*.ttf

mv ../fonts/ttf/CopperplateCC-Heavy.ttf.fix ../fonts/ttf/CopperplateCC-Heavy.ttf
mv ../fonts/ttf/CopperplateCC-Bold.ttf.fix ../fonts/ttf/CopperplateCC-Bold.ttf

rm ../fonts/ttf2/*.ttf
rmdir ../fonts/ttf2

echo "Generating OpenType Fonts"
fontmake  -o otf --output-dir ../fonts/otf/ -u ../sources/UFO/Heavy.ufo ../sources/UFO/Bold.ufo

echo "Hot Fixes"
mv ../fonts/otf/Heavy.otf ../fonts/otf/CopperplateCC-Heavy.otf
mv ../fonts/otf/Bold.otf ../fonts/otf/CopperplateCC-Bold.otf

echo "All Done!"

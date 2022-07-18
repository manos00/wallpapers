#!/bin/bash

# NOTE: this script should be run from the wallpapers root directory.

jpgs=("*.jpg")
pngs=("*.png")

nb_note="""
## N.B.

I did not create any of these wallpapers. I did tweak the colors, clean-up noise,
and resize most of them. If you are the original creator and would like for me
to remove your work, please let me know."""

png_to_jpg() {
   for file in ${pngs[@]}
   do
   if [[ ! -f ${file%.*}.jpg ]]; then mogrify -format jpg $file; fi
   done
}

generate_file() {
    echo "<!-- markdownlint-disable MD026 -->"
    echo "# wallpapers"
    echo "$nb_note"

    for filename in ${jpgs[@]}; do
        printf "\n## $filename\n\n![$filename]($filename)\n"
    done
}

if command -v mogrify; then
    png_to_jpg
fi

rm README.md; generate_file >> README.md

exit 0

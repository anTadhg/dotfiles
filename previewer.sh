#!/bin/sh

case "$(file -Lb --mime-type "$1")" in
    image/*) chafa -f sixel --animate off -s "$2"x"$3" --polite on "$1" 
      ;;
    audio/*) exiftool "$1" 
      ;;
   # video/*)  
   #   CACHE="$HOME/.cache}/lf/thumb.$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$1")" | sha256sum | cut -d' ' -f1)"
   #   [ ! -f "$CACHE" ] && ffmpegthumbnailer -i "$1" -o "$CACHE" -s 0
   #   chafa -f sixel -s "$2"x"$3" --polite on "$CACHEjpg"
   #   ;;
   # application/pdf)
   #   CACHE="$HOME/.cache}/lf/thumb.$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$1")" | sha256sum | cut -d' ' -f1)"
   #   [ ! -f "$CACHE.jpg" ] && pdftoppm -jpeg -f 1 -singlefile "$1" "$CACHE"
   #   chafa -f sixel  --polite on "$CACHE.jpg"
   #   ;;
    text/html) lynx -display-charset=utf-8 -dump "$1" 
      ;;
    text/*) bat -pf "$1" 
      ;;
esac

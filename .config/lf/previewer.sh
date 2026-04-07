#!/bin/sh

# depends on Chafa, ffmpegthumbnailer, pdftoppm

case "$(file -Lb --mime-type "$1")" in
    image/*) 
      chafa -f sixel --animate off -s "$2"x"$3" --polite on "$1" 
      ;;
    application/octet-stream)
      ;;
    audio/*) 
      exiftool "$1" 
      ;;
    video/*)  
      CACHE="$HOME/.cache/lf/thumb.$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$1")" | sha256sum | cut -d' ' -f1)"
      [ ! -f "$CACHE" ] && ffmpegthumbnailer -i "$1" -o "$CACHE.jpg" -s 0
      chafa -f sixel --animate off -s "$2"x"$3" --polite on "${CACHE}.jpg"
      ;;
    application/pdf) 
      CACHE="$HOME/.cache/lf/thumb.$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$1")" | sha256sum | cut -d' ' -f1)"
      [ ! -f "$CACHE" ] && pdftoppm -jpeg -f 1 -singlefile "$1" "${CACHE}"
      chafa -f sixel --animate off -s "$2"x"$3" --polite on "${CACHE}.jpg"
    ;;
    text/html)
      lynx -display-charset=utf-8 -dump "$1" 
      ;;
    application/x-subrip)
      bat -fn --wrap auto --terminal-width "$2" "$1"
      ;;
    application/json)
      bat -fn --wrap auto --terminal-width "$2" "$1"
      ;;
    application/javascript)
      bat -fn --wrap auto --terminal-width "$2" "$1"
      ;;
    text/*)
      bat -fn --wrap auto --terminal-width "$2" "$1"
      ;;
esac

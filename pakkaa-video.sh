#!/bin/sh
# Pakkaa videon web-kelpoiseksi (1080p H.264 MP4) macOS:n omalla
# avconvert-työkalulla. Käyttö:
#   ./pakkaa-video.sh lähde.mov videot/video1.mp4
set -e
if [ $# -ne 2 ]; then
  echo "Käyttö: $0 <lähdevideo> <kohde.mp4>"
  exit 1
fi
valiaikainen="$(mktemp -t video).m4v"
avconvert --preset Preset1920x1080 --source "$1" --output "$valiaikainen" --replace
mv "$valiaikainen" "$2"
echo "Valmis: $2 ($(du -h "$2" | cut -f1))"

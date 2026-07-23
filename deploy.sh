#!/bin/bash
# Deploy the Astro site to /var/www/aegisrd.
#
# IMPORTANT: /var/www/aegisrd/downloads/ holds ~330MB of release binaries
# (AegisTrans mac/win/linux). They are NOT in the repo — they are too large for
# git and are served straight off the VPS. rsync --delete would wipe them on
# every deploy, which is exactly what happened on 2026-07-22 and left three
# 404 download links on the live site. The exclude below is what prevents that.
# Do not remove it unless the binaries move to external hosting.
set -e
cd "$(dirname "$0")"

echo "--- build ---"
npm run build

echo "--- deploy (preserving downloads/) ---"
rsync -a --delete --exclude 'downloads/' dist/ /var/www/aegisrd/
chown -R ubuntu:ubuntu /var/www/aegisrd

echo "--- verify ---"
for p in / /aegistrans/ /downloads/AegisTrans-linux.AppImage; do
  printf "  %-45s %s\n" "$p" "$(curl -sk -m 10 -o /dev/null -w '%{http_code}' --resolve aegisrd.com:443:127.0.0.1 https://aegisrd.com$p)"
done
echo "done"

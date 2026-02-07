#!/bin/bash
set -e

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${script_dir}/.."

mkdir -p /tmp/alfred-uuid

cp workflow/icon.png /tmp/alfred-uuid
cp workflow/info.plist /tmp/alfred-uuid

version=$(cat workflow/version)
sed -i '' "s/VERSION_PLACEHOLDER/$version/g" /tmp/alfred-uuid/info.plist

cd /tmp/alfred-uuid

zip -r archive.zip *

cd "${script_dir}"/..
mv /tmp/alfred-uuid/archive.zip uuid.alfredworkflow

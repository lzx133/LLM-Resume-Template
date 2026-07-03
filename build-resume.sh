#!/usr/bin/env bash
set -euo pipefail

image="llm-resume-template:local"
target="${1:-resume-autonomous-driving.tex}"

docker build --progress=plain -t "$image" .
docker run --rm \
  --user "$(id -u):$(id -g)" \
  --volume "$PWD:/work" \
  --env TEXINPUTS=/work/fontawesome5//: \
  --env HOME=/tmp \
  "$image" \
  latexmk -xelatex -interaction=nonstopmode -halt-on-error "$target"

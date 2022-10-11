#!/bin/bash
for i in {255..0}; do
  if [ $(($i % 5)) == 0 ]; then
    g=$((255 - $i))
    echo "- P[r:i,c:i]($i,$g,255)"
  fi
done

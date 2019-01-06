#!/bin/sh

git pull
cd scripts/
chmod +x generate.sh
./generate.sh
## Generation
cd ..
git add .
git commit -m "Update"
git push
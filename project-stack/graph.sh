#!/bin/bash

export AWS_PROFILE=kk-org;
export AWS_REGION=us-east-1;

# go to all terraform modules and generate graph
for dir in `find "./modules" -not -path '*/.*' -type d`; do
  cd $dir
  
  [[ -e main.tf ]] && (
    echo $PWD; 
    rover -genImage
  )

  cd - > /dev/null
done

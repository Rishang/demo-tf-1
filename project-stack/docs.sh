#!/bin/bash

# Script to generate terraform docs

function _generate_docs() {
  for dir in `find . -not -path '*/.*' -type d`; do
    cd $dir
    [[ -e variables.tf ]] && (echo `pwd`; terraform-docs markdown . > README.md)
    cd - > /dev/null
  done
}

if [[ `which terraform-docs` ]];then
  _generate_docs
else
  echo "INFO: terraform-docs not available"
fi
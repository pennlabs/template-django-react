#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: ./init.sh <name of project> <name of github repo>"
    exit 1
fi

find . -type f -exec sed -i "s/project_name/$1/g" {} \;
find . -type f -exec sed -i "s/github-project/$2/g" {} \;

mv README.md.template README.md

mkdir backend
mkdir frontend

django-admin startproject --template=https://github.com/pennlabs/template-django/archive/master.zip --extension=py,cfg,yaml --name=Dockerfile $1 backend

rm -r backend/circleci
rm -rf backend/k8s
rm backend/.gitignore
rm backend/LICENSE
rm backend/README.md

rm init.sh

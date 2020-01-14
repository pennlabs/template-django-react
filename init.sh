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

# Remove unnecessary backend files
rm -r backend/circleci
rm -rf backend/k8s
rm backend/.gitignore
rm backend/LICENSE
rm backend/README.md

# Prefix backend routes with api/
sed -i "s/\/static\//\/api\/static\//g" backend/$1/settings/base.py
sed -i "/^if settings.DEBUG:/i urlpatterns = \[path(\"api\/\", include(urlpatterns))\]\n" backend/$1/urls.py
sed -i "s/\/static=/\/api\/static=/g" backend/setup.cfg

rm init.sh

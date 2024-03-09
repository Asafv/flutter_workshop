#!/bin/bash
echo "building multi-module project dependencies"
echo "Do you want to get UI modules as well? (y/n)?"
read uiModules

for file in $(find . -name "pubspec.yaml")
do
    dir=$(dirname $file)
        if [[ "$dir" == *"ui"* ]]; then
        if [[ "$uiModules" == "y" ]]; then
            echo ""
            echo "getting dependencies for $dir"
            (cd "$dir" && flutter pub get)
        else
            echo ""
            echo "Skipping UI module: $dir"
        fi
    else
        echo ""
        echo "getting dependencies for $dir"
        (cd "$dir" && flutter pub get)
    fi
done   
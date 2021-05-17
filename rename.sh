#!/bin/sh

for f in *.md
do
    if [ ${#f} = 11 ]; then
        new_name=$(grep "^# " $f | head -n1)
        new_name=${new_name#\# }
        #grep '#\[\[' *.md
        mv $f "${new_name#\# }.md"
        sed -ie "s/${f%.md}/${new_name}/g" *.md
        sed -ie 's/]]#/]]/g' *.md
        sed -ie 's/#\[\[/[[/g' *.md
    fi
done

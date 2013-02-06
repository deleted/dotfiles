#!/bin/zsh +x

###
# Install symlinks to the files in this repo into the current user's $HOME
###

REPO_DIR=$(pwd);
DEST_DIR=/tmp/home

# Don't link this script or the .git subdirectory
excludes=(
    "\.git.*"
    "install\.zsh"
)
# OR-together the subpatterns
exclude_pattern="\(${(j:\|:)excludes}\)"
echo EXCLUDE: $exclude_pattern

for file in $( find -type f $REPO_DIR |grep -v "$exclude_pattern" );
do;
    #echo sed -e \"s:$REPO_DIR::\"
    relpath=`echo $file | sed -e "s:$REPO_DIR::" `
    linkpath=$DEST_DIR$relpath
    echo "$file --> $linkpath"

    # Make the directory if it doesn't exist.
    if [[ ! -d `dirname $linkpath` ]]; then
       mkdir -p `dirname $linkpath`
    fi

    # if the file already exists, make an underscore-prefixed backup of it
    if [[ -e $linkpath && ! -d $linkpath ]]; then
        echo "FILE EXISTS.  BACKING UP: $linkpath"
        cp $linkpath `dirname $linkpath`/_`basename $linkpath`
    fi

    # if $file is a regular file, create the symlink
    [[ -f $file ]] && ln -f -s $file $linkpath
done;


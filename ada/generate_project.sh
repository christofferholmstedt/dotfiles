#!/bin/bash

usage()
{
cat << EOF
    usage: $0 -m NAME_MAIN -p NAME_PROJECT

    OPTIONS:
    -h Shows this message
    -m Main file name (and main procedure name)
    -p Project Name
EOF
}

NAME_MAIN=
NAME_PROJECT=

# Some basics at the follwing page
# http://rsalveti.wordpress.com/2007/04/03/bash-parsing-arguments-with-getopts/
while getopts “hm:p:” OPTION
do
case $OPTION in
         h)
             usage
             exit 1
             ;;
         m)
             NAME_MAIN=$OPTARG
             ;;
         p)
             NAME_PROJECT=$OPTARG
             ;;
         ?)
             usage
             exit
             ;;
     esac
done

if [[ -z $NAME_MAIN ]] || [[ -z $NAME_PROJECT ]]
then
    usage
     exit 1
fi

mkdir -pv "$NAME_PROJECT/src"
mkdir -pv "$NAME_PROJECT/obj"


### Source file main .adb file.
NAME_MAIN_LOWERCASE=$(echo "$NAME_MAIN" | tr '[:upper:]' '[:lower:]')

cat > ./$NAME_PROJECT/src/$NAME_MAIN_LOWERCASE.adb <<EOF
procedure $NAME_MAIN is

begin
    -- Insert code here.
    null;
end $NAME_MAIN;
EOF

echo "Created source file at $NAME_PROJECT/src/$NAME_MAIN_LOWERCASE.adb"

### Project file.
NAME_PROJECT_LOWERCASE=$(echo "$NAME_PROJECT" | tr '[:upper:]' '[:lower:]')

cat > ./$NAME_PROJECT_LOWERCASE/$NAME_PROJECT_LOWERCASE.gpr <<EOF
project $NAME_PROJECT is
    for Source_Dirs use ("src");
    for Object_Dir use "obj";
    for Main use ("$NAME_MAIN_LOWERCASE.adb");
end $NAME_PROJECT;
EOF

echo "Created source file at $NAME_PROJECT_LOWERCASE/$NAME_PROJECT_LOWERCASE.gpr"

#!/bin/bash

usage()
{
cat << EOF
    usage: $0 -m NAME_MAIN -e PACKGE -d DIRECTORY -p NAME_PROJECT

    -m Main -e Simple_Package -d exercise -p Exercise

    OPTIONS:
    -h Shows this message
    -d Directory name
    -e Package name
    -m Main file name (and main procedure name)
    -p Project Name
EOF
}

NAME_MAIN=
NAME_PROJECT=
NAME_DIRECTORY=
NAME_PACKAGE=


# Some basics at the follwing page
# http://rsalveti.wordpress.com/2007/04/03/bash-parsing-arguments-with-getopts/
while getopts “he:d:m:p:” OPTION
do
case $OPTION in
         h)
             usage
             exit 1
             ;;
         m)
             NAME_MAIN=$OPTARG
             ;;
         e)
             NAME_PACKAGE=$OPTARG
             ;;
         d)
             NAME_DIRECTORY=$OPTARG
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

if [[ -z $NAME_MAIN ]] || [[ -z $NAME_PROJECT ]] || [[ -z $NAME_DIRECTORY ]]
then
    usage
     exit 1
fi

NAME_DIRECTORY_LOWERCASE=$(echo "$NAME_DIRECTORY" | tr '[:upper:]' '[:lower:]')

mkdir -pv "$NAME_DIRECTORY_LOWERCASE/src"
mkdir -pv "$NAME_DIRECTORY_LOWERCASE/obj"


NAME_MAIN_LOWERCASE=$(echo "$NAME_MAIN" | tr '[:upper:]' '[:lower:]')

### Source file main .adb file.
cat > ./$NAME_DIRECTORY_LOWERCASE/src/$NAME_MAIN_LOWERCASE.adb <<EOF
with $NAME_PACKAGE;

procedure $NAME_MAIN is

begin
    -- Insert code here.
    null;
end $NAME_MAIN;
EOF

echo "Created source file at $NAME_DIRECTORY_LOWERCASE/src/$NAME_MAIN_LOWERCASE.adb"

### Source file package .adb/.ads files.

cat > ./$NAME_DIRECTORY_LOWERCASE/src/$NAME_PACKAGE.adb <<EOF
package body $NAME_PACKAGE is

    procedure $NAME_MAIN(F: out Float) is

    begin
        -- Insert code here.
        null;
    end $NAME_MAIN;

end $NAME_PACKAGE;
EOF

echo "Created source file at $NAME_DIRECTORY_LOWERCASE/src/$NAME_PACKAGE.adb"

cat > ./$NAME_DIRECTORY_LOWERCASE/src/$NAME_PACKAGE.ads <<EOF
package $NAME_PACKAGE is

    procedure $NAME_MAIN(F: out Float);

end $NAME_PACKAGE;
EOF

echo "Created source file at $NAME_DIRECTORY_LOWERCASE/src/$NAME_PACKAGE.ads"

### Project file.

cat > ./$NAME_DIRECTORY_LOWERCASE/$NAME_PROJECT_LOWERCASE.gpr <<EOF
project $NAME_PROJECT is
    for Source_Dirs use ("src");
    for Object_Dir use "obj";
    for Main use ("$NAME_MAIN_LOWERCASE.adb");

    package Compiler is
       for Local_Configuration_Pragmas use "project_pragmas";
    end Compiler;

end $NAME_PROJECT;
EOF

echo "Created source file at $NAME_DIRECTORY_LOWERCASE/$NAME_PROJECT_LOWERCASE.gpr"

### Makefile.
# TAB=`echo -e "\t"`

printf ".PHONY: clean" >> ./$NAME_DIRECTORY_LOWERCASE/Makefile
printf "\n.PHONY: all" >> ./$NAME_DIRECTORY_LOWERCASE/Makefile

printf "\n\nubuntu: all" >> ./$NAME_DIRECTORY_LOWERCASE/Makefile

printf "\n\nravenscar: clean" >> ./$NAME_DIRECTORY_LOWERCASE/Makefile
printf "\n\techo \"pragma Profile(Ravenscar);\" > project_pragmas" >> ./$NAME_DIRECTORY_LOWERCASE/Makefile
printf "\n\tgnatmake -d -p -P $NAME_PROJECT_LOWERCASE.gpr" >> ./$NAME_DIRECTORY_LOWERCASE/Makefile

printf "\n\nrestricted: clean" >> ./$NAME_DIRECTORY_LOWERCASE/Makefile
printf "\n\techo \"pragma Profile(Restricted);\" > project_pragmas" >> ./$NAME_DIRECTORY_LOWERCASE/Makefile
printf "\n\tgnatmake -d -p -P $NAME_PROJECT_LOWERCASE.gpr" >> ./$NAME_DIRECTORY_LOWERCASE/Makefile

printf "\n\nall: clean" >> ./$NAME_DIRECTORY_LOWERCASE/Makefile
printf "\n\techo \"\" > project_pragmas" >> ./$NAME_DIRECTORY_LOWERCASE/Makefile
printf "\n\tgnatmake -d -p -P $NAME_DIRECTORY_LOWERCASE.gpr" >> ./$NAME_DIRECTORY_LOWERCASE/Makefile
printf "\n\nclean:" >> ./$NAME_DIRECTORY_LOWERCASE/Makefile
printf "\n\trm -rf obj/*.o" >> ./$NAME_DIRECTORY_LOWERCASE/Makefile
printf "\n\trm -rf obj/*.ali" >> ./$NAME_DIRECTORY_LOWERCASE/Makefile
printf "\n\trm -rf obj/$NAME_MAIN_LOWERCASE" >> ./$NAME_DIRECTORY_LOWERCASE/Makefile

echo "Created Makefile at $NAME_DIRECTORY_LOWERCASE/Makefile"

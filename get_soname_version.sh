#!/bin/sh

# small helper script to learn about library sonames
# adapted from upstream's configure script

# Avoid locale weirdness, besides we really just want to translate ASCII.
toupper(){
    echo "$@" | tr abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ
}

get_version(){
    lcname=${1}
    name=$(toupper $lcname)
    file=$lcname/version.h
    eval $(awk "/#define ${name}_VERSION_M/ { print \$2 \"=\" \$3 }" "$file")
    eval ${name}_VERSION=\$${name}_VERSION_MAJOR.\$${name}_VERSION_MINOR.\$${name}_VERSION_MICRO
    eval echo "${lcname}_VERSION=\$${name}_VERSION"
    eval echo "${lcname}_VERSION_MAJOR=\$${name}_VERSION_MAJOR"
    eval echo "${lcname}_VERSION_MINOR=\$${name}_VERSION_MINOR"
}

get_version "$1"


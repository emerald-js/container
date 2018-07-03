#!/usr/bin/env bash
cd "$(dirname $0)";

yellow='\e[33m'
green='\e[32m'
clear='\e[0m'

test -d lib || mkdir lib

for input in index.coffee src{/**,}/*.coffee
do
    output="$(sed 's/src/lib/;s/\.coffee$/\.js/' <<< "${input}")"

    echo -e "${yellow}>${clear} ${green}${input}${clear} to ${green}${output}${clear}";
    coffee -tMo "${output}" "${input}"
done

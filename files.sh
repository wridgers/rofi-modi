#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ $# -eq 0 ]
then
    if [ -e ${__dir}/.files.db ]
    then
        cat ${__dir}/.files.db
    else
        find ~ -type f | grep -v -f ${__dir}/ignore_paths
    fi
else
    PATH=$@
    /usr/bin/emacsclient -n ${PATH}
fi

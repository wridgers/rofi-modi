#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# BAD
rm -f ${__dir}/.directories.db
rm -f ${__dir}/.files.db

# BAD
${__dir}/directories.sh > ${__dir}/.directories_new.db
${__dir}/files.sh > ${__dir}/.files_new.db

# BAD
mv ${__dir}/.directories_new.db ${__dir}/.directories.db
mv ${__dir}/.files_new.db ${__dir}/.files.db

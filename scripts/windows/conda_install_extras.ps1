# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.


# Installs Extra Conda Packages needed for windows only. 
$conda_env = conda info --json | ConvertFrom-Json

if( $conda_env.active_prefix_name -eq "base"){
    Write-Output("Not in an active conda env. abort")
    return -1
}

$conda_folder = $conda_env.active_prefix

conda install -y m2w64-gcc=5.3.0
conda install -y llvm=14.0.6 llvmdev=14.0.6 lld=14.0.6

# Cmake refuses to auto-detect llvm-mt, even though it detects clang-cl. 
# Given they are cli-compatible, just copy it :) 
Copy-Item $conda_folder\Library\bin\llvm-mt.exe $conda_folder\Library\bin\mt.exe

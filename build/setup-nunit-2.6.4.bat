@echo off

pushd %~dp0

if not exist "dependencies" (mkdir "dependencies")
cd dependencies

set nunit_url="https://github.com/nunit/nunitv2/releases/download/2.6.4/NUnit-2.6.4.zip"
set nunit_file="NUnit-2.6.4.zip"
set nunit_dir="nunit-2.6.4"

if not exist %nunit_file% (wget --no-check-certificate %nunit_url%)

if not exist %nunit_dir% (
    7z x -r -o%nunit_dir% %nunit_file%
)

popd

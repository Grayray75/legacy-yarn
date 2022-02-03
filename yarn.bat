@echo off
SETLOCAL

set mc_versions=1.3.2 1.4.7 1.5.1 1.5.2 1.6.4 1.7.10 1.8.9 1.9.4 1.10.2 1.11.2 1.12.2 1.13.2
echo Available MC versions: %mc_versions%

if [%1] == [] (
    goto versionselect
) else (
    set version=%1
    goto versionvalidation
)

:versionselect
set /p version="Enter the version you want to edit: "

:versionvalidation
set valid="F"
for %%i in (%mc_versions%) do (
    if %%i == %version% set valid="T"
)

if %valid% == "F" (
    echo '%version%' is an invalid MC version!
    goto versionselect
)

ENDLOCAL & (
    set MC_VERSION=%version%
)
echo Starting Gradle with MC version %MC_VERSION%...
./gradlew.bat yarn

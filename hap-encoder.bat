@echo off
setlocal enabledelayedexpansion

:: Configure input/output folders (customize as needed)
set "input_dir=.\input"
set "output_dir=.\output_hap"

if not exist "%output_dir%" mkdir "%output_dir%"

for %%a in (%input_dir%\*.mov) do (
    echo Processing "%%~nxa"
    ffmpeg -i "%%a" -vcodec hap -format hap_q -y "%output_dir%\%%~na_HAP.mov"
    echo Finished encoding "%%~na"
)

echo All files encoded to HAP.
pause
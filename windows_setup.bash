#!/bin/bash
#
# 🪟 Windows SSH Setup
# 🔐 SSH configuration script for Windows systems
@echo off
setlocal enabledelayedexpansion

echo Setting up MediKoGPT SSH Setup Tool for Windows...

:: Create scripts directory
echo Creating scripts directory...
if not exist "%USERPROFILE%\scripts" mkdir "%USERPROFILE%\scripts"

:: Copy the script
echo Copying setup script...
copy setup_ssh.sh "%USERPROFILE%\scripts\"

:: Create batch files
echo Creating batch files...

:: setup_ssh.bat
echo @echo off > "%USERPROFILE%\scripts\setup_ssh.bat"
echo bash %%USERPROFILE%%\scripts\setup_ssh.sh %%* >> "%USERPROFILE%\scripts\setup_ssh.bat"

:: git_setup_global.bat
echo @echo off > "%USERPROFILE%\scripts\git_setup_global.bat"
echo setup_ssh 2 >> "%USERPROFILE%\scripts\git_setup_global.bat"

:: git_setup_urls.bat
echo @echo off > "%USERPROFILE%\scripts\git_setup_urls.bat"
echo setup_ssh 3 >> "%USERPROFILE%\scripts\git_setup_urls.bat"

:: git_show_config.bat
echo @echo off > "%USERPROFILE%\scripts\git_show_config.bat"
echo setup_ssh 4 >> "%USERPROFILE%\scripts\git_show_config.bat"

:: Add to PATH
echo Adding scripts directory to PATH...
setx PATH "%PATH%;%USERPROFILE%\scripts"

echo.
echo Setup complete! You can now use the following commands:
echo   setup_ssh - Run the full setup script
echo   git_setup_global - Configure Git global settings
echo   git_setup_urls - Configure Git repository URLs
echo   git_show_config - Show current configuration
echo.
echo To start using the tool, run:
echo   setup_ssh
echo.
echo Note: You may need to restart your terminal for the PATH changes to take effect. 

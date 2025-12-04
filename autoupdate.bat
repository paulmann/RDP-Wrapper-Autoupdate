@echo off
setlocal enabledelayedexpansion

REM ============================================================================
REM Enhanced RDP Wrapper Management Script v3.5.0
REM Author: Mikhail Deynekin <m@deynekin.com>
REM Repository: https://github.com/paulmann/RDP-Wrapper-Autoupdate/
REM ============================================================================
REM Professional RDP Wrapper installation and management tool
REM Supports automatic configuration discovery and intelligent updates
REM ============================================================================

REM -------------------------------------------
REM Configuration Section
REM -------------------------------------------
set "SCRIPT_PATH=%~dp0"
set "SCRIPT_NAME=%~nx0"
set "LOG_FILE=%SCRIPT_PATH%rdp_wrapper_autoupdate.log"
set "RDPWRAP_DIR=%ProgramFiles%\RDP Wrapper"
set "RDPWRAP_DIR_X86=%ProgramFiles(x86)%\RDP Wrapper"
set "RDPWINST="
set "RDPWRAP_INI="
set "TEMP_INI=%TEMP%\rdpwrap_temp.ini"
set "NEW_INI=%TEMP%\rdpwrap_new.ini"
set "MAX_RETRIES=3"
set "CONNECTION_TIMEOUT=15"
set "SCRIPT_MODE=unknown"

REM Repository Configuration - 43 repositories categorized by reliability
set "REPO_COUNT=43"

REM ===== CATEGORY PRIMARY ===== (Priority 1 - Most reliable)
set "REPO[1].NAME=sebaxakerhtc"
set "REPO[1].URL=https://raw.githubusercontent.com/sebaxakerhtc/rdpwrap.ini/master/rdpwrap.ini"
set "REPO[1].PRIORITY=1"
set "REPO[1].ACTIVE=1"

set "REPO[2].NAME=asmtron"
set "REPO[2].URL=https://raw.githubusercontent.com/asmtron/rdpwrap/master/res/rdpwrap.ini"
set "REPO[2].PRIORITY=1"
set "REPO[2].ACTIVE=1"

set "REPO[3].NAME=affinityv"
set "REPO[3].URL=https://raw.githubusercontent.com/affinityv/INI-RDPWRAP/master/rdpwrap.ini"
set "REPO[3].PRIORITY=1"
set "REPO[3].ACTIVE=1"

set "REPO[4].NAME=DrDrrae"
set "REPO[4].URL=https://raw.githubusercontent.com/DrDrrae/rdpwrap/master/res/rdpwrap.ini"
set "REPO[4].PRIORITY=1"
set "REPO[4].ACTIVE=1"

set "REPO[5].NAME=apolope"
set "REPO[5].URL=https://raw.githubusercontent.com/apolope/rdpwrap/master/res/rdpwrap.ini"
set "REPO[5].PRIORITY=1"
set "REPO[5].ACTIVE=1"

REM ===== CATEGORY SECONDARY ===== (Priority 2 - Active community)
set "REPO[6].NAME=UMU618"
set "REPO[6].URL=https://raw.githubusercontent.com/UMU618/rdpwrap.ini/main/rdpwrap.ini"
set "REPO[6].PRIORITY=2"
set "REPO[6].ACTIVE=1"

set "REPO[7].NAME=SniperThrilla"
set "REPO[7].URL=https://raw.githubusercontent.com/SniperThrilla/rdpwrap/main/rdpwrap.ini"
set "REPO[7].PRIORITY=2"
set "REPO[7].ACTIVE=1"

set "REPO[8].NAME=LCW0NJUPT"
set "REPO[8].URL=https://raw.githubusercontent.com/LCW0NJUPT/rdpwrap-autoupdate/master/rdpwrap.ini"
set "REPO[8].PRIORITY=2"
set "REPO[8].ACTIVE=1"

set "REPO[9].NAME=XSR1"
set "REPO[9].URL=https://raw.githubusercontent.com/XSR1/rdpwrap/main/rdpwrap.ini"
set "REPO[9].PRIORITY=2"
set "REPO[9].ACTIVE=1"

set "REPO[10].NAME=saurav-biswas"
set "REPO[10].URL=https://raw.githubusercontent.com/saurav-biswas/rdpwrap-1/patch-1/res/rdpwrap.ini"
set "REPO[10].PRIORITY=2"
set "REPO[10].ACTIVE=1"

REM ===== CATEGORY TERTIARY ===== (Priority 3 - Updated regularly)
set "REPO[11].NAME=fatukah"
set "REPO[11].URL=https://raw.githubusercontent.com/fatukah/rdpwrap/main/rdpwrap.ini"
set "REPO[11].PRIORITY=3"
set "REPO[11].ACTIVE=1"

set "REPO[12].NAME=infowayrs"
set "REPO[12].URL=https://raw.githubusercontent.com/infowayrs/INI-RDPWRAP/master/rdpwrap.ini"
set "REPO[12].PRIORITY=3"
set "REPO[12].ACTIVE=1"

set "REPO[13].NAME=smallerxie"
set "REPO[13].URL=https://raw.githubusercontent.com/smallerxie/rdpwrap-ini-dll/master/rdpwrap.ini"
set "REPO[13].PRIORITY=3"
set "REPO[13].ACTIVE=1"

set "REPO[14].NAME=MarkusLuan"
set "REPO[14].URL=https://raw.githubusercontent.com/MarkusLuan/rdpwrap_update/master/rdpwrap.ini"
set "REPO[14].PRIORITY=3"
set "REPO[14].ACTIVE=1"

set "REPO[15].NAME=tstaudte"
set "REPO[15].URL=https://raw.githubusercontent.com/tstaudte/rdpwrap/main/rdpwrap.ini"
set "REPO[15].PRIORITY=3"
set "REPO[15].ACTIVE=1"

REM ===== CATEGORY LEGACY ===== (Priority 4 - Verification needed)
set "REPO[16].NAME=fre4kyC0de"
set "REPO[16].URL=https://raw.githubusercontent.com/fre4kyC0de/rdpwrap/master/rdpwrap.ini"
set "REPO[16].PRIORITY=4"
set "REPO[16].ACTIVE=1"

set "REPO[17].NAME=karloskar"
set "REPO[17].URL=https://raw.githubusercontent.com/karloskar/rcs-rdpwrap/master/rdpwrap.ini"
set "REPO[17].PRIORITY=4"
set "REPO[17].ACTIVE=1"

set "REPO[18].NAME=mamiksik"
set "REPO[18].URL=https://raw.githubusercontent.com/mamiksik/rdpwrap/master/rdpwrap.ini"
set "REPO[18].PRIORITY=4"
set "REPO[18].ACTIVE=1"

set "REPO[19].NAME=ANYK3Y"
set "REPO[19].URL=https://raw.githubusercontent.com/ANYK3Y/rdpwrap/master/rdpwrap.ini"
set "REPO[19].PRIORITY=4"
set "REPO[19].ACTIVE=1"

set "REPO[20].NAME=0xatom"
set "REPO[20].URL=https://raw.githubusercontent.com/0xatom/rdpwrap/master/rdpwrap.ini"
set "REPO[20].PRIORITY=4"
set "REPO[20].ACTIVE=1"

set "REPO[21].NAME=rdpwrap-org"
set "REPO[21].URL=https://raw.githubusercontent.com/rdpwrap/rdpwrap/master/res/rdpwrap.ini"
set "REPO[21].PRIORITY=4"
set "REPO[21].ACTIVE=1"

set "REPO[22].NAME=andyacer"
set "REPO[22].URL=https://raw.githubusercontent.com/andyacer/rdpwrap/master/rdpwrap.ini"
set "REPO[22].PRIORITY=4"
set "REPO[22].ACTIVE=1"

set "REPO[23].NAME=CyberAndrii"
set "REPO[23].URL=https://raw.githubusercontent.com/CyberAndrii/rdpwrap/master/rdpwrap.ini"
set "REPO[23].PRIORITY=4"
set "REPO[23].ACTIVE=1"

set "REPO[24].NAME=dzmdmd"
set "REPO[24].URL=https://raw.githubusercontent.com/dzmdmd/rdpwrap/master/rdpwrap.ini"
set "REPO[24].PRIORITY=4"
set "REPO[24].ACTIVE=1"

set "REPO[25].NAME=immense"
set "REPO[25].URL=https://raw.githubusercontent.com/immense/rdpwrap/master/rdpwrap.ini"
set "REPO[25].PRIORITY=4"
set "REPO[25].ACTIVE=1"

set "REPO[26].NAME=jetspiking"
set "REPO[26].URL=https://raw.githubusercontent.com/jetspiking/rdpwrap/master/rdpwrap.ini"
set "REPO[26].PRIORITY=4"
set "REPO[26].ACTIVE=1"

set "REPO[27].NAME=kkkgo"
set "REPO[27].URL=https://raw.githubusercontent.com/kkkgo/rdpwrap/master/rdpwrap.ini"
set "REPO[27].PRIORITY=4"
set "REPO[27].ACTIVE=1"

set "REPO[28].NAME=maximusvalor"
set "REPO[28].URL=https://raw.githubusercontent.com/maximusvalor/rdpwrap/master/rdpwrap.ini"
set "REPO[28].PRIORITY=4"
set "REPO[28].ACTIVE=1"

set "REPO[29].NAME=nomosher"
set "REPO[29].URL=https://raw.githubusercontent.com/nomosher/rdpwrap/master/rdpwrap.ini"
set "REPO[29].PRIORITY=4"
set "REPO[29].ACTIVE=1"

set "REPO[30].NAME=rasta-mouse"
set "REPO[30].URL=https://raw.githubusercontent.com/rasta-mouse/rdpwrap/master/rdpwrap.ini"
set "REPO[30].PRIORITY=4"
set "REPO[30].ACTIVE=1"

set "REPO[31].NAME=sailor67-master"
set "REPO[31].URL=https://raw.githubusercontent.com/sailor67/rdpwrap/master/rdpwrap.ini"
set "REPO[31].PRIORITY=4"
set "REPO[31].ACTIVE=1"

set "REPO[32].NAME=sailor67-res"
set "REPO[32].URL=https://raw.githubusercontent.com/sailor67/rdpwrap/master/res/rdpwrap.ini"
set "REPO[32].PRIORITY=4"
set "REPO[32].ACTIVE=1"

set "REPO[33].NAME=snakefoot"
set "REPO[33].URL=https://raw.githubusercontent.com/snakefoot/rdpwrap/master/rdpwrap.ini"
set "REPO[33].PRIORITY=4"
set "REPO[33].ACTIVE=1"

set "REPO[34].NAME=vcla"
set "REPO[34].URL=https://raw.githubusercontent.com/vcla/rdpwrap/master/rdpwrap.ini"
set "REPO[34].PRIORITY=4"
set "REPO[34].ACTIVE=1"

set "REPO[35].NAME=williamwilling"
set "REPO[35].URL=https://raw.githubusercontent.com/williamwilling/rdpwrap/master/rdpwrap.ini"
set "REPO[35].PRIORITY=4"
set "REPO[35].ACTIVE=1"

set "REPO[36].NAME=xushuduo"
set "REPO[36].URL=https://raw.githubusercontent.com/xushuduo/rdpwrap/master/rdpwrap.ini"
set "REPO[36].PRIORITY=4"
set "REPO[36].ACTIVE=1"

set "REPO[37].NAME=yui0"
set "REPO[37].URL=https://raw.githubusercontent.com/yui0/rdpwrap/master/rdpwrap.ini"
set "REPO[37].PRIORITY=4"
set "REPO[37].ACTIVE=1"

set "REPO[38].NAME=z3APA3A"
set "REPO[38].URL=https://raw.githubusercontent.com/z3APA3A/rdpwrap/master/rdpwrap.ini"
set "REPO[38].PRIORITY=4"
set "REPO[38].ACTIVE=1"

set "REPO[39].NAME=ajkhoury"
set "REPO[39].URL=https://raw.githubusercontent.com/ajkhoury/rdpwrap/master/rdpwrap.ini"
set "REPO[39].PRIORITY=4"
set "REPO[39].ACTIVE=1"

set "REPO[40].NAME=border"
set "REPO[40].URL=https://raw.githubusercontent.com/border/rdpwrap/master/rdpwrap.ini"
set "REPO[40].PRIORITY=4"
set "REPO[40].ACTIVE=1"

set "REPO[41].NAME=custom-dev"
set "REPO[41].URL=https://raw.githubusercontent.com/custom-dev/rdpwrap/master/rdpwrap.ini"
set "REPO[41].PRIORITY=4"
set "REPO[41].ACTIVE=1"

set "REPO[42].NAME=danielkucera"
set "REPO[42].URL=https://raw.githubusercontent.com/danielkucera/rdpwrap/master/rdpwrap.ini"
set "REPO[42].PRIORITY=4"
set "REPO[42].ACTIVE=1"

set "REPO[43].NAME=desktop"
set "REPO[43].URL=https://raw.githubusercontent.com/desktop/rdpwrap/master/rdpwrap.ini"
set "REPO[43].PRIORITY=4"
set "REPO[43].ACTIVE=1"

REM -------------------------------------------
REM Display Header
REM -------------------------------------------
call :print_header
echo RDP WRAPPER MANAGEMENT SCRIPT v3.0.0
echo ========================================
echo Author: Mikhail Deynekin
echo Email: m@deynekin.com
echo Website: https://deynekin.com
echo Repositories: 43 sources available
echo ========================================
echo.

REM -------------------------------------------
REM Detect Operating Mode
REM -------------------------------------------
echo [INFO] Detecting operating mode...
call :detect_installation
echo [INFO] Operating mode: !SCRIPT_MODE!

REM -------------------------------------------
REM Argument Processing
REM -------------------------------------------
if "%~1"=="" goto main_flow

if /i "%~1"=="-h" goto show_help
if /i "%~1"=="--help" goto show_help
if /i "%~1"=="help" goto show_help
if /i "%~1"=="-log" goto enable_logging
if /i "%~1"=="-task:install" goto install_task
if /i "%~1"=="-task:remove" goto remove_task
if /i "%~1"=="-status" goto show_status
if /i "%~1"=="-repair" goto repair_installation
if /i "%~1"=="-test" goto test_repositories
if /i "%~1"=="-search" goto search_config_only
if /i "%~1"=="-install" goto install_wrapper
if /i "%~1"=="-download" goto download_only
if /i "%~1"=="-verbose" goto verbose_mode
if /i "%~1"=="-list" goto list_repositories
if /i "%~1"=="-version" goto show_version

echo [ERROR] Unknown argument: %~1
echo.
goto show_help

:show_help
call :print_header
echo USAGE: %SCRIPT_NAME% [OPTION]
echo.
echo OPERATING MODES:
echo   installer     : No RDPWInst.exe found, searches for configuration
echo   updater       : RDPWInst.exe found, updates existing installation
echo.
echo OPTIONS:
echo   -h, --help    Show this help message
echo   -log          Enable logging to file
echo   -task:install Install scheduled task for automatic updates
echo   -task:remove  Remove scheduled task
echo   -status       Show current RDP Wrapper status
echo   -repair       Repair RDP Wrapper installation
echo   -test         Test repository connectivity
echo   -search       Search for compatible configuration only
echo   -install      Download and install RDP Wrapper
echo   -download     Download latest INI only
echo   -verbose      Enable verbose output
echo   -list         List all available repositories
echo   -version      Show script version
echo   (no arguments) Normal operation based on detected mode
echo.
goto exit

:enable_logging
echo [INFO] Logging enabled. Output will be saved to: %LOG_FILE%
echo %DATE% %TIME% - RDP Wrapper Management Script Started > "%LOG_FILE%"
call :main_flow >> "%LOG_FILE%" 2>&1
goto exit

:install_task
call :require_admin
echo [INFO] Installing scheduled task...
schtasks /create /f /sc ONSTART /tn "RDP Wrapper Autoupdate" ^
    /tr "cmd.exe /C \"%SCRIPT_PATH%%SCRIPT_NAME%\" -log" ^
    /ru SYSTEM /delay 0000:10 >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo [SUCCESS] Scheduled task installed successfully
) else (
    echo [ERROR] Failed to install scheduled task
)
goto exit

:remove_task
call :require_admin
echo [INFO] Removing scheduled task...
schtasks /delete /f /tn "RDP Wrapper Autoupdate" >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo [SUCCESS] Scheduled task removed successfully
) else (
    echo [WARNING] Scheduled task may not exist
)
goto exit

:show_status
call :check_rdp_status
goto exit

:repair_installation
call :require_admin
echo [INFO] Repairing RDP Wrapper installation...
call :repair_wrapper
goto exit

:test_repositories
echo [INFO] Testing repository connectivity...
call :test_all_repositories
goto exit

:search_config_only
echo [INFO] Searching for compatible configuration only...
call :get_termsrv_version
call :search_compatible_config
if !CONFIG_FOUND! equ 1 (
    echo [SUCCESS] Found compatible configuration in: !FOUND_REPO!
    echo [INFO] INI file saved to: !CONFIG_PATH!
) else (
    echo [ERROR] No compatible configuration found
)
goto exit

:install_wrapper
call :require_admin
echo [INFO] Starting RDP Wrapper installation...
call :install_rdp_wrapper
goto exit

:download_only
echo [INFO] Downloading latest INI file only...
call :get_termsrv_version
call :search_compatible_config
if !CONFIG_FOUND! equ 1 (
    copy /y "!CONFIG_PATH!" "%SCRIPT_PATH%rdpwrap.ini" >nul
    echo [SUCCESS] INI file saved to: %SCRIPT_PATH%rdpwrap.ini
) else (
    echo [ERROR] Failed to download INI file
)
goto exit

:verbose_mode
echo [INFO] Verbose mode enabled...
set "VERBOSE=1"
goto main_flow

:list_repositories
echo Repository List (Total: %REPO_COUNT%)
echo ========================================
echo.
for /l %%i in (1,1,%REPO_COUNT%) do (
    set "repo_name=!REPO[%%i].NAME!"
    set "repo_priority=!REPO[%%i].PRIORITY!"
    set "repo_active=!REPO[%%i].ACTIVE!"
    
    if !repo_active! equ 1 (
        echo [!repo_priority!] !repo_name!
    ) else (
        echo [!repo_priority!] !repo_name! (INACTIVE)
    )
)
echo.
echo Priority Legend:
echo   1 - Most reliable (Primary)
echo   2 - Active community (Secondary)
echo   3 - Updated regularly (Tertiary)
echo   4 - Legacy/Verification needed
echo.
goto exit

:show_version
echo RDP Wrapper Management Script v3.0.0
echo Copyright (c) 2025 Mikhail Deynekin
echo.
goto exit

REM -------------------------------------------
REM Main Flow
REM -------------------------------------------
:main_flow
call :require_admin
call :verify_prerequisites

echo [INFO] System check initiated...
echo.

REM Get current Windows version
call :get_windows_version
echo [INFO] Windows Version: !WIN_VERSION!

REM Get current termsrv.dll version
call :get_termsrv_version
echo [INFO] Termsrv.dll Version: !TERMSRV_VERSION_CLEAN!

REM Determine operation based on mode
if "!SCRIPT_MODE!"=="installer" (
    echo [INFO] Running in installer mode...
    call :installer_flow
) else if "!SCRIPT_MODE!"=="updater" (
    echo [INFO] Running in updater mode...
    call :updater_flow
) else (
    echo [ERROR] Unknown operating mode
    goto exit
)

goto exit

REM -------------------------------------------
REM Function Library
REM -------------------------------------------

:print_header
echo.
echo ========================================
goto :eof

:detect_installation
REM Detect if RDP Wrapper is installed and locate components
set "SCRIPT_MODE=installer"

REM Check for RDPWInst.exe in script directory
if exist "%SCRIPT_PATH%RDPWInst.exe" (
    set "RDPWINST=%SCRIPT_PATH%RDPWInst.exe"
    set "RDPWRAP_INI=%SCRIPT_PATH%rdpwrap.ini"
    set "SCRIPT_MODE=updater"
    goto :eof
)

REM Check standard installation directories
if exist "%RDPWRAP_DIR%\RDPWInst.exe" (
    set "RDPWINST=%RDPWRAP_DIR%\RDPWInst.exe"
    set "RDPWRAP_INI=%RDPWRAP_DIR%\rdpwrap.ini"
    set "SCRIPT_MODE=updater"
    goto :eof
)

if exist "%RDPWRAP_DIR_X86%\RDPWInst.exe" (
    set "RDPWINST=%RDPWRAP_DIR_X86%\RDPWInst.exe"
    set "RDPWRAP_INI=%RDPWRAP_DIR_X86%\rdpwrap.ini"
    set "SCRIPT_MODE=updater"
    goto :eof
)

REM Check registry for installed location
for /f "tokens=2*" %%a in (
    'reg query "HKLM\SOFTWARE\RDP Wrapper" /v InstallPath 2^>nul'
) do (
    if exist "%%b\RDPWInst.exe" (
        set "RDPWINST=%%b\RDPWInst.exe"
        set "RDPWRAP_INI=%%b\rdpwrap.ini"
        set "SCRIPT_MODE=updater"
        goto :eof
    )
)

echo [INFO] RDPWInst.exe not found. Operating in installer mode.
goto :eof

:require_admin
REM Verify script is running with administrator privileges
net session >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Administrator privileges required
    echo [INFO] Please run this script as Administrator
    pause
    exit /b 1
)
goto :eof

:verify_prerequisites
REM Check if PowerShell is available
echo [INFO] Checking PowerShell availability...
where powershell >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [ERROR] PowerShell is not available on this system
    echo [INFO] PowerShell 3.0 or higher is required
    exit /b 1
)
echo [✓] PowerShell is available

REM Check internet connectivity
echo [INFO] Checking internet connectivity...
ping -n 1 8.8.8.8 >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [WARNING] No internet connectivity detected
    echo [INFO] Some features may not work properly
)
goto :eof

:get_windows_version
REM Get Windows version information
for /f "tokens=4-5 delims=[.] " %%i in ('ver') do (
    set "WIN_MAJOR=%%i"
    set "WIN_MINOR=%%j"
)
set "WIN_VERSION=!WIN_MAJOR!.!WIN_MINOR!"
goto :eof

:get_termsrv_version
REM Get termsrv.dll version and extract clean version number
set "TERMSRV_VERSION=0.0.0.0"
set "TERMSRV_VERSION_CLEAN=0.0.0.0"

REM Используем VBScript для получения версии файла (как в рабочем скрипте)
set "VBS_SCRIPT=%TEMP%\getversion.vbs"

REM Создаем VBScript файл
(
echo Set fso = CreateObject^("Scripting.FileSystemObject"^)
echo WScript.Echo fso.GetFileVersion^("%windir%\System32\termsrv.dll"^)
) > "%VBS_SCRIPT%"

REM Выполняем VBScript
for /f "tokens=*" %%v in ('cscript //nologo "%VBS_SCRIPT%" 2^>nul') do (
    set "TERMSRV_VERSION=%%v"
)

REM Удаляем временный VBScript файл
if exist "%VBS_SCRIPT%" del "%VBS_SCRIPT%" >nul 2>&1

REM Если VBScript не сработал, пытаемся через PowerShell
if "!TERMSRV_VERSION!"=="0.0.0.0" (
    set "ps_command=$file = '%windir%\\System32\\termsrv.dll'; if (Test-Path $file) { (Get-Item $file).VersionInfo.FileVersionRaw.ToString() } else { '0.0.0.0' }"
    for /f "delims=" %%v in ('powershell -Command "!ps_command!" 2^>nul') do (
        set "TERMSRV_VERSION=%%v"
    )
)

REM Еще один альтернативный метод через WMIC
if "!TERMSRV_VERSION!"=="0.0.0.0" (
    for /f "tokens=2 delims==" %%v in ('wmic datafile where "name='%windir%\\System32\\termsrv.dll'" get version /value 2^>nul') do (
        set "TERMSRV_VERSION=%%v"
    )
)

REM Убираем лишние пробелы и символы
set "TERMSRV_VERSION=!TERMSRV_VERSION: =!"
set "TERMSRV_VERSION_CLEAN=!TERMSRV_VERSION!"

REM Если все еще не получили версию, используем файловый хэш как альтернативу
if "!TERMSRV_VERSION_CLEAN!"=="0.0.0.0" (
    echo [WARNING] Cannot get termsrv.dll version, using fallback method
    REM Получаем дату изменения файла как альтернативу
    for /f "tokens=1-3 delims=/ " %%a in ('dir /tc "%windir%\System32\termsrv.dll" ^| find "termsrv.dll"') do (
        set "file_date=%%c%%a%%b"
    )
    if defined file_date (
        set "TERMSRV_VERSION_CLEAN=10.0.%file_date%.0"
    )
)

if "!TERMSRV_VERSION_CLEAN!"=="" set "TERMSRV_VERSION_CLEAN=0.0.0.0"
goto :eof

:installer_flow
REM Flow for when running as installer (no RDPWInst.exe found)
echo [INFO] Searching for compatible configuration across 43 repositories...
call :search_comprehensive

if !BEST_CONFIG_FOUND! equ 1 (
    echo [SUCCESS] Found compatible configuration in: !BEST_REPO!
    echo [INFO] Configuration supports version: !BEST_VERSION!
    
    REM Save the configuration
    copy /y "!BEST_CONFIG_PATH!" "%SCRIPT_PATH%rdpwrap.ini" >nul
    
    echo [INFO] INI file saved to: %SCRIPT_PATH%rdpwrap.ini
    echo.
    echo [ACTION REQUIRED] Next steps:
    echo   1. Download RDP Wrapper from: https://github.com/stascorp/rdpwrap
    echo   2. Extract all files to: %SCRIPT_PATH%
    echo   3. Run this script again for automatic configuration
) else (
    echo [ERROR] No suitable configuration found after checking 43 repositories
    echo [INFO] Consider trying manual configuration or checking Windows updates
)
goto :eof

:updater_flow
REM Flow for when running as updater (RDPWInst.exe found)
echo [INFO] Checking current configuration...
call :check_current_config

REM Проверяем, правильно ли определилась версия
if "!TERMSRV_VERSION_CLEAN!"=="0.0.0.0" (
    echo [ERROR] Failed to detect termsrv.dll version
    echo [INFO] Trying alternative detection method...
    call :get_termsrv_version_alternative
)

if !CONFIG_VALID! equ 1 (
    echo [SUCCESS] Current configuration supports Windows !WIN_VERSION!^(!TERMSRV_VERSION_CLEAN!^)
    call :verify_service_state
) else (
    echo [WARNING] Current configuration does not support this version
    echo [INFO] Searching across 43 repositories for compatible configuration...
    call :search_compatible_config
    
    if !CONFIG_FOUND! equ 1 (
        echo [SUCCESS] Found compatible configuration in: !FOUND_REPO!
        call :apply_configuration
        call :verify_service_state
    ) else (
        echo [ERROR] No compatible configuration found in 43 repositories
        echo [INFO] Consider manual update of rdpwrap.ini or Windows rollback
    )
)
goto :eof

:get_termsrv_version_alternative
REM Альтернативный метод получения версии termsrv.dll
set "TERMSRV_VERSION_CLEAN=0.0.0.0"

REM Используем строку из самого файла для определения версии
findstr /c:"FileVersion" "%windir%\System32\termsrv.dll" > "%TEMP%\termsrv_ver.txt" 2>nul
if exist "%TEMP%\termsrv_ver.txt" (
    for /f "tokens=2 delims=," %%a in ('type "%TEMP%\termsrv_ver.txt" ^| find "FileVersion"') do (
        set "ver_string=%%a"
        REM Извлекаем только числа версии
        for /f "tokens=1-4 delims=." %%b in ("!ver_string!") do (
            set "v1=%%b"
            set "v2=%%c"
            set "v3=%%d"
            set "v4=%%e"
        )
        REM Очищаем от нечисловых символов
        set "v1=!v1: =!"
        set "v2=!v2: =!"
        set "v3=!v3: =!"
        set "v4=!v4: =!"
        for /f "delims=0123456789" %%i in ("!v1!") do set "v1=!v1:%%i=!"
        for /f "delims=0123456789" %%i in ("!v2!") do set "v2=!v2:%%i=!"
        for /f "delims=0123456789" %%i in ("!v3!") do set "v3=!v3:%%i=!"
        for /f "delims=0123456789" %%i in ("!v4!") do set "v4=!v4:%%i=!"
        
        if "!v1!!v2!!v3!!v4!" neq "" (
            set "TERMSRV_VERSION_CLEAN=!v1!.!v2!.!v3!.!v4!"
        )
    )
    del "%TEMP%\termsrv_ver.txt" >nul 2>&1
)

if "!TERMSRV_VERSION_CLEAN!"=="0.0.0.0" (
    echo [WARNING] Using Windows build number as version fallback
    for /f "tokens=2 delims==" %%v in ('wmic os get version /value') do (
        set "win_build=%%v"
    )
    set "TERMSRV_VERSION_CLEAN=10.0.!win_build!.0"
)

goto :eof

:check_current_config
REM Check if current rdpwrap.ini supports our termsrv CLEAN version
set "CONFIG_VALID=0"
if not exist "!RDPWRAP_INI!" (
    echo [WARNING] rdpwrap.ini not found at: !RDPWRAP_INI!
    goto :eof
)

findstr /c:"[!TERMSRV_VERSION_CLEAN!]" "!RDPWRAP_INI!" >nul
if %ERRORLEVEL% equ 0 set "CONFIG_VALID=1"
goto :eof

:search_compatible_config
REM Search through repositories for compatible configuration
set "CONFIG_FOUND=0"
set "SEARCH_START=%TIME%"
set "CHECKED_COUNT=0"
set "SUCCESS_COUNT=0"

echo [INFO] Repository search started at: !SEARCH_START!
echo [INFO] Searching for version: !TERMSRV_VERSION_CLEAN!
echo.

REM Сначала ищем точное совпадение
for /l %%i in (1,1,%REPO_COUNT%) do (
    set "repo_name=!REPO[%%i].NAME!"
    set "repo_url=!REPO[%%i].URL!"
    set "repo_priority=!REPO[%%i].PRIORITY!"
    set "repo_active=!REPO[%%i].ACTIVE!"
    
    if !repo_active! equ 1 (
        set /a "CHECKED_COUNT+=1"
        echo [SEARCH] !CHECKED_COUNT!/%REPO_COUNT% - !repo_name! ^(Priority: !repo_priority!^)
        
        call :download_with_powershell "!repo_url!" "%TEMP_INI%"
        
        if exist "%TEMP_INI%" (
            for %%F in ("%TEMP_INI%") do set "filesize=%%~zF"
            if !filesize! leq 0 (
                echo [SKIP] Downloaded file is empty
                del "%TEMP_INI%" >nul 2>&1
            ) else (
                set /a "SUCCESS_COUNT+=1"
                REM Ищем точное совпадение
                findstr /c:"[!TERMSRV_VERSION_CLEAN!]" "%TEMP_INI%" >nul
                if %ERRORLEVEL% equ 0 (
                    set "CONFIG_FOUND=1"
                    set "FOUND_REPO=!repo_name!"
                    set "CONFIG_PATH=%TEMP_INI%"
                    echo [SUCCESS] Exact version match found at repository !CHECKED_COUNT!
                    goto :eof
                ) else (
                    REM Если точное совпадение не найдено, ищем похожие версии
                    echo [INFO] Exact version not found, searching for similar versions...
                    call :find_compatible_version "%TEMP_INI%"
                    if !COMPATIBLE_VERSION_FOUND! equ 1 (
                        set "CONFIG_FOUND=1"
                        set "FOUND_REPO=!repo_name!"
                        set "CONFIG_PATH=%TEMP_INI%"
                        echo [SUCCESS] Compatible version !COMPATIBLE_VERSION! found at repository !CHECKED_COUNT!
                        goto :eof
                    )
                    del "%TEMP_INI%" >nul 2>&1
                )
            )
        ) else (
            echo [SKIP] Download failed
        )
        
        echo.
    )
)

set "SEARCH_END=%TIME%"
echo [INFO] Search completed at: !SEARCH_END!
echo [INFO] Checked: !CHECKED_COUNT! repositories, Successfully downloaded: !SUCCESS_COUNT!
goto :eof

:find_compatible_version
REM Ищем совместимые версии в INI файле
set "COMPATIBLE_VERSION_FOUND=0"
set "COMPATIBLE_VERSION="
set "ini_file=%~1"

if not exist "!ini_file!" goto :eof

REM Разбиваем текущую версию на компоненты
for /f "tokens=1-4 delims=." %%a in ("!TERMSRV_VERSION_CLEAN!") do (
    set "current_major=%%a"
    set "current_minor=%%b"
    set "current_build=%%c"
    set "current_revision=%%d"
)

REM Ищем версии в INI файле
for /f "tokens=*" %%v in ('findstr /r "\[[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*" "!ini_file!"') do (
    set "line=%%v"
    set "line=!line:~1!"
    
    for /f "tokens=1 delims=]" %%a in ("!line!") do (
        set "version=%%a"
        echo !version! | findstr /r "^[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$" >nul
        if !errorlevel! equ 0 (
            REM Разбиваем найденную версию на компоненты
            for /f "tokens=1-4 delims=." %%b in ("!version!") do (
                set "found_major=%%b"
                set "found_minor=%%c"
                set "found_build=%%d"
                set "found_revision=%%e"
            )
            
            REM Проверяем совместимость (мажорная и минорная версии должны совпадать)
            if "!found_major!.!found_minor!"=="!current_major!.!current_minor!" (
                if !found_build! leq !current_build! (
                    set "COMPATIBLE_VERSION=!version!"
                    set "COMPATIBLE_VERSION_FOUND=1"
                    goto :eof
                )
            )
        )
    )
)
goto :eof

:search_comprehensive
REM Comprehensive search across all repositories for best configuration
set "BEST_CONFIG_FOUND=0"
set "BEST_VERSION="
set "BEST_REPO="
set "BEST_CONFIG_PATH="
set "SEARCH_START=%TIME%"
set "CHECKED_COUNT=0"
set "SUCCESS_COUNT=0"

echo [INFO] Comprehensive search started at: !SEARCH_START!
echo.

for /l %%i in (1,1,%REPO_COUNT%) do (
    set "repo_name=!REPO[%%i].NAME!"
    set "repo_url=!REPO[%%i].URL!"
    set "repo_priority=!REPO[%%i].PRIORITY!"
    set "repo_active=!REPO[%%i].ACTIVE!"
    
    if !repo_active! equ 1 (
        set /a "CHECKED_COUNT+=1"
        echo [SEARCH] !CHECKED_COUNT!/%REPO_COUNT% - !repo_name! ^(Priority: !repo_priority!^)
        
        call :download_with_powershell "!repo_url!" "%TEMP_INI%"
        
        if exist "%TEMP_INI%" (
            REM Check file size
            for %%F in ("%TEMP_INI%") do set "filesize=%%~zF"
            if !filesize! leq 0 (
                echo [SKIP] Downloaded file is empty
                del "%TEMP_INI%" >nul 2>&1
            ) else (
                set /a "SUCCESS_COUNT+=1"
                REM Check if this INI supports our CLEAN version
                findstr /c:"[!TERMSRV_VERSION_CLEAN!]" "%TEMP_INI%" >nul
                if %ERRORLEVEL% equ 0 (
                    REM Found exact match - this is the best
                    set "BEST_CONFIG_FOUND=1"
                    set "BEST_REPO=!repo_name!"
                    set "BEST_VERSION=!TERMSRV_VERSION_CLEAN!"
                    set "BEST_CONFIG_PATH=%TEMP_INI%"
                    echo [SUCCESS] Found exact version match at repository !CHECKED_COUNT!
                    goto :search_complete
                )
                
                REM Look for newer versions in this INI
                call :find_newest_version_in_ini "%TEMP_INI%"
                
                if "!NEWEST_VERSION!" neq "" (
                    if "!BEST_VERSION!"=="" (
                        set "BEST_VERSION=!NEWEST_VERSION!"
                        set "BEST_REPO=!repo_name!"
                        set "BEST_CONFIG_PATH=%TEMP_INI%"
                        echo [INFO] Current best: !NEWEST_VERSION! from !repo_name!
                    ) else (
                        REM Compare versions
                        call :compare_versions "!BEST_VERSION!" "!NEWEST_VERSION!"
                        if !COMPARE_RESULT! equ 2 (
                            set "BEST_VERSION=!NEWEST_VERSION!"
                            set "BEST_REPO=!repo_name!"
                            set "BEST_CONFIG_PATH=%TEMP_INI%"
                            echo [INFO] New best: !NEWEST_VERSION! from !repo_name!
                        )
                    )
                )
                
                del "%TEMP_INI%" >nul 2>&1
            )
        ) else (
            echo [SKIP] Download failed
        )
        
        echo.
    )
)

:search_complete
set "SEARCH_END=%TIME%"
echo [INFO] Search completed at: !SEARCH_END!
echo [INFO] Checked: !CHECKED_COUNT! repositories, Successfully downloaded: !SUCCESS_COUNT!

if "!BEST_CONFIG_PATH!" neq "" (
    set "BEST_CONFIG_FOUND=1"
    echo [INFO] Best configuration found in: !BEST_REPO!
    echo [INFO] Supports version: !BEST_VERSION!
) else (
    echo [WARNING] No suitable configuration found
)
goto :eof

:download_with_powershell
REM Download file using PowerShell Invoke-WebRequest
set "url=%~1"
set "output=%~2"
set "retry_count=0"

REM Clean up any existing file
if exist "!output!" del "!output!" >nul 2>&1

:download_retry_powershell
set /a "retry_count+=1"

if defined VERBOSE (
    echo     Download attempt !retry_count! of %MAX_RETRIES%...
)

REM Use PowerShell Invoke-WebRequest for robust downloading
set "ps_download_command=try { $ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri '!url!' -OutFile '!output!' -TimeoutSec !CONNECTION_TIMEOUT! -UserAgent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36' -ErrorAction Stop; exit 0 } catch { exit 1 }"

powershell -Command "!ps_download_command!" >nul 2>&1

if exist "!output!" (
    REM Verify the file is not empty
    for %%F in ("!output!") do set "filesize=%%~zF"
    if !filesize! gtr 0 (
        REM Check if it looks like a valid INI file
        findstr /i "\[.*\]" "!output!" >nul 2>&1
        if %ERRORLEVEL% equ 0 (
            if defined VERBOSE (
                echo     [✓] Download successful (size: !filesize! bytes)
            )
            exit /b 0
        ) else (
            if defined VERBOSE (
                echo     [✗] File doesn't appear to be a valid INI
            )
            del "!output!" >nul 2>&1
        )
    ) else (
        if defined VERBOSE (
            echo     [✗] Downloaded file is empty
        )
        del "!output!" >nul 2>&1
    )
) else (
    if defined VERBOSE (
        echo     [✗] Download failed
    )
)

REM Retry logic
if !retry_count! lss %MAX_RETRIES% (
    if defined VERBOSE (
        echo     Waiting 2 seconds before retry...
    )
    timeout /t 2 /nobreak >nul
    goto download_retry_powershell
) else (
    if defined VERBOSE (
        echo     [✗] Maximum retry attempts reached
    )
    exit /b 1
)
goto :eof

:find_newest_version_in_ini
REM Find the newest version in an INI file
set "NEWEST_VERSION="
set "ini_file=%~1"

if not exist "!ini_file!" goto :eof

REM Extract all version strings from INI file
for /f "tokens=*" %%v in (
    'findstr /r "\[[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*" "!ini_file!"'
) do (
    set "line=%%v"
    set "line=!line:~1!"
    
    for /f "tokens=1 delims=]" %%a in ("!line!") do (
        set "version=%%a"
        echo !version! | findstr /r "^[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$" >nul
        if !errorlevel! equ 0 (
            if "!NEWEST_VERSION!"=="" (
                set "NEWEST_VERSION=!version!"
            ) else (
                call :compare_versions "!NEWEST_VERSION!" "!version!"
                if !COMPARE_RESULT! equ 2 set "NEWEST_VERSION=!version!"
            )
        )
    )
)
goto :eof

:compare_versions
REM Compare two version strings (1.2.3.4 format)
REM Returns: 1 if v1 > v2, 2 if v2 > v1, 0 if equal
set "v1=%~1"
set "v2=%~2"
set "COMPARE_RESULT=0"

for /f "tokens=1-4 delims=." %%a in ("!v1!") do (
    set "v1_major=%%a"
    set "v1_minor=%%b"
    set "v1_build=%%c"
    set "v1_revision=%%d"
)

for /f "tokens=1-4 delims=." %%a in ("!v2!") do (
    set "v2_major=%%a"
    set "v2_minor=%%b"
    set "v2_build=%%c"
    set "v2_revision=%%d"
)

if !v1_major! gtr !v2_major! (set "COMPARE_RESULT=1" & goto :eof)
if !v1_major! lss !v2_major! (set "COMPARE_RESULT=2" & goto :eof)

if !v1_minor! gtr !v2_minor! (set "COMPARE_RESULT=1" & goto :eof)
if !v1_minor! lss !v2_minor! (set "COMPARE_RESULT=2" & goto :eof)

if !v1_build! gtr !v2_build! (set "COMPARE_RESULT=1" & goto :eof)
if !v1_build! lss !v2_build! (set "COMPARE_RESULT=2" & goto :eof)

if !v1_revision! gtr !v2_revision! (set "COMPARE_RESULT=1" & goto :eof)
if !v1_revision! lss !v2_revision! (set "COMPARE_RESULT=2" & goto :eof)

goto :eof

:apply_configuration
REM Apply new configuration without unnecessary service restart
echo [INFO] Applying new configuration...

REM Backup current configuration
if exist "!RDPWRAP_INI!" (
    set "backup_file=!RDPWRAP_INI!.backup.%DATE:~-4,4%%DATE:~-10,2%%DATE:~-7,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%"
    copy /y "!RDPWRAP_INI!" "!backup_file!" >nul
    echo [INFO] Backup created: !backup_file!
)

REM Apply new configuration using streaming method
(
    for /f "usebackq delims=" %%l in (`type "!CONFIG_PATH!"`) do (
        echo %%l
    )
) > "!RDPWRAP_INI!"

if exist "!CONFIG_PATH!" del "!CONFIG_PATH!" >nul 2>&1

echo [INFO] Restarting RDP services...
"!RDPWINST!" -r >nul 2>&1
call :configure_nla

echo [SUCCESS] Configuration applied successfully
goto :eof

:configure_nla
REM Configure Network Level Authentication
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" ^
    /v SecurityLayer /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" ^
    /v MinEncryptionLevel /t REG_DWORD /d 2 /f >nul 2>&1
goto :eof

:verify_service_state
REM Verify RDP services are running correctly
echo.
echo [INFO] Verifying service state...

sc query TermService | findstr /i "RUNNING" >nul
if %ERRORLEVEL% equ 0 (
    echo [✓] TermService is running
) else (
    echo [✗] TermService is not running
)

query session rdp-tcp >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo [✓] RDP-TCP listener active
) else (
    echo [✗] RDP-TCP listener not found
)

reg query "HKLM\SYSTEM\CurrentControlSet\Services\TermService\Parameters" ^
    /f "rdpwrap.dll" >nul
if %ERRORLEVEL% equ 0 (
    echo [✓] RDP Wrapper registered in registry
) else (
    echo [✗] RDP Wrapper not registered
)
goto :eof

:check_rdp_status
REM Comprehensive RDP status check
call :detect_installation
call :get_termsrv_version

if "!SCRIPT_MODE!"=="updater" (
    call :check_current_config
) else (
    set "CONFIG_VALID=0"
)

echo ========================================
echo RDP WRAPPER STATUS REPORT
echo ========================================
echo.
echo System Information:
echo   Windows Version:   !WIN_VERSION!
echo   Termsrv.dll:       !TERMSRV_VERSION_CLEAN!
echo   Script Mode:       !SCRIPT_MODE!
echo.
echo Installation Status:
if "!SCRIPT_MODE!"=="updater" (
    echo   [✓] RDP Wrapper installed
    if exist "!RDPWINST!" (
        echo   [✓] RDPWInst.exe found: !RDPWINST!
    )
    if !CONFIG_VALID! equ 1 (
        echo   [✓] Current INI supports this version
    ) else (
        echo   [✗] Current INI does NOT support this version
    )
) else (
    echo   [✗] RDP Wrapper not installed
)
echo.
if "!SCRIPT_MODE!"=="updater" (
    echo Service Status:
    call :verify_service_state
    echo.
)
echo ========================================
goto :eof

:repair_wrapper
REM Complete repair of RDP Wrapper installation
if "!SCRIPT_MODE!" neq "updater" (
    echo [ERROR] RDP Wrapper is not installed
    goto :eof
)

echo [INFO] Uninstalling RDP Wrapper...
"!RDPWINST!" -u >nul 2>&1
timeout /t 2 /nobreak >nul

echo [INFO] Reinstalling RDP Wrapper...
"!RDPWINST!" -i -o >nul 2>&1
timeout /t 2 /nobreak >nul

call :configure_nla
echo [SUCCESS] Repair completed
goto :eof

:install_rdp_wrapper
REM Download and install RDP Wrapper
echo [INFO] This feature requires manual download of RDP Wrapper
echo [INFO] Please download from: https://github.com/stascorp/rdpwrap
echo [INFO] Extract all files to: %SCRIPT_PATH%
echo [INFO] Then run this script again without arguments
goto :eof

:test_all_repositories
REM Test connectivity to all repositories
echo Repository Connectivity Test
echo ============================
echo.

set "working_repos=0"
set "failed_repos=0"
set "total_size=0"

for /l %%i in (1,1,%REPO_COUNT%) do (
    set "repo_name=!REPO[%%i].NAME!"
    set "repo_url=!REPO[%%i].URL!"
    set "repo_priority=!REPO[%%i].PRIORITY!"
    
    echo Testing [!repo_priority!] !repo_name!
    echo URL: !repo_url!
    
    call :download_with_powershell "!repo_url!" "%TEMP_INI%"
    
    if exist "%TEMP_INI%" (
        for %%F in ("%TEMP_INI%") do set "filesize=%%~zF"
        set /a "total_size+=filesize"
        echo Status: [✓] ACCESSIBLE ^(size: !filesize! bytes^)
        set /a "working_repos+=1"
        del "%TEMP_INI%" >nul 2>&1
    ) else (
        echo Status: [✗] INACCESSIBLE
        set /a "failed_repos+=1"
    )
    
    echo.
)

echo Test Results:
echo =============
echo Total Repositories: %REPO_COUNT%
echo Accessible: !working_repos!
echo Inaccessible: !failed_repos!
if !working_repos! gtr 0 (
    echo Total downloaded data: !total_size! bytes
)
echo.
goto :eof

:exit
echo.
echo ========================================
echo Script execution completed
echo ========================================
echo.
if "%~1"=="" pause
exit /b 0

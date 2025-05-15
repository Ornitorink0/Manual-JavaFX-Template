@echo off
setlocal

set "JAVAFX_LIB=lib"
set "SRC_DIR=src"
set "RES_DIR=res"
set "OUT_DIR=out"
set "MODULES=javafx.controls,javafx.fxml"

:: Build classpath by iterating over all .jar in JAVAFX_LIB
set "CP="
for %%f in ("%JAVAFX_LIB%\*.jar") do (
    if defined CP (
        set "CP=!CP!;%%f"
    ) else (
        set "CP=%%f"
    )
)

:: Enable delayed variable expansion
setlocal enabledelayedexpansion

if "%1" == "compile" (
    echo Compilation in progress...
    if not exist "%OUT_DIR%" mkdir "%OUT_DIR%"
    xcopy /E /Y "%RES_DIR%\*" "%OUT_DIR%\" > nul
    for /R "%SRC_DIR%" %%f in (*.java) do (
        set "FILES=!FILES! %%f"
    )
    javac --module-path "%JAVAFX_LIB%" --add-modules %MODULES% -cp "!CP!" -d "%OUT_DIR%" !FILES!
    echo Compilation completed.

) else if "%1" == "run" (
    echo Compilation in progress...
    if not exist "%OUT_DIR%" mkdir "%OUT_DIR%"
    xcopy /E /Y "%RES_DIR%\*" "%OUT_DIR%\" > nul
    for /R "%SRC_DIR%" %%f in (*.java) do (
        set "FILES=!FILES! %%f"
    )
    javac --module-path "%JAVAFX_LIB%" --add-modules %MODULES% -cp "!CP!" -d "%OUT_DIR%" !FILES!
    echo Compilation completed.

    echo Execution...
    java --module-path "%JAVAFX_LIB%" --add-modules %MODULES% -cp "!CP!;%OUT_DIR%" Main

) else if "%1" == "clean" (
    echo Cleaning output directory...
    rmdir /S /Q "%OUT_DIR%"
    echo Cleaning completed.

) else (
    echo Usage: run.bat ^<compile^|run^|clean^>
    exit /b 1
)

endlocal
exit /b 0

@echo off

REM Remove enterprise directory
if exist "%SRC_DIR%\litellm\proxy\enterprise" (
    echo Removing enterprise directory...
    rd /s /q "%SRC_DIR%\litellm\proxy\enterprise"
)

"%PYTHON%" -m pip install . -vv --no-deps --no-build-isolation
if errorlevel 1 exit 1
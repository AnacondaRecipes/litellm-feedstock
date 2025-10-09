@echo off

REM Use Python with proper symlink removal
%PYTHON% -c "from pathlib import Path; import os; p = Path('litellm/proxy/enterprise'); p.unlink() if p.is_symlink() else (p.rmdir() if p.is_dir() and not list(p.iterdir()) else None); print(f'Removed symlink: {p}' if not p.exists() else f'ERROR: Still exists: {p}')"

if exist "%SRC_DIR%\litellm\proxy\enterprise" (
    echo FATAL: Symlink still exists
    exit /b 1
)

"%PYTHON%" -m pip install . -vv --no-deps --no-build-isolation
if errorlevel 1 exit 1
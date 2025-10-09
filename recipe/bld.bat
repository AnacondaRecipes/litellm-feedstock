@echo off

%PYTHON% -c "import shutil; from pathlib import Path; ent = Path('litellm/proxy/enterprise'); shutil.rmtree(ent, ignore_errors=True) if ent.exists() else None; print(f'Removed: {ent}' if not ent.exists() else f'Failed to remove: {ent}')"

if exist "%SRC_DIR%\litellm\proxy\enterprise" (
    echo ERROR: enterprise directory still exists after deletion attempt
    dir "%SRC_DIR%\litellm\proxy"
    exit /b 1
)

"%PYTHON%" -m pip install . -vv --no-deps --no-build-isolation
if errorlevel 1 exit 1
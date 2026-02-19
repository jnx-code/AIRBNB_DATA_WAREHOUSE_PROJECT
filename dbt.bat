@echo off
REM Wrapper to run dbt via python directly to bypass shim issues
"%~dp0.venv\Scripts\python.exe" -c "from dbt.cli.main import cli; cli()" %*

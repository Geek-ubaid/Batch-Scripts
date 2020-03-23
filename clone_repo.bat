@ECHO OFF

:AGAIN
set /p clone_origin="Enter origin of the project to clone : "
FOR /f "tokens=1,2,3,4 delims=/" %%a IN ("%clone_origin%") do set "reponame=%%d"
FOR /f "tokens=1,2 delims=." %%a IN ("%reponame%") do set "dirname=%%a"
git clone %clone_origin%
cd %dirname%

IF ERRORLEVEL 1 (
    ECHO Enter the correct origin url!!
    GOTO AGAIN

) ElSE (
    ECHO Repo Cloned Succesfully!!
    code .
    exit /s
)

@echo off

set /p dir_name="Enter Project Name : "
echo Making Directory....
mkdir %dir_name%
cd %dir_name%

where /q virtualenv

IF ERRORLEVEL 1 (
    ECHO Virtualenv is either not installed or in your path
    echo Installing virtualenv....

    pip install virtualenv && (
      echo installed virtual environment
    ) || (
      echo yourCommand failed
    )
    EXIT /B
) ELSE (

  echo Virtualenv exists!!
    
)

echo Activating env....
virtualenv env && (
  echo env activated
  cd env/scripts
  activate
cd ../..
) || (
  echo yourCommand failed
)

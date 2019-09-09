echo off
:Close the log when execution

call :LOG > install.log
exit /B
:generate log


:LOG
set install_folder=%~dp0material\3.6
:find out your environment current version to set the mapping folder, ex python 3.6 -> material\3.6
echo %install_folder%
:make sure the cmd location is in material

cd /d %install_folder%
: cd to current parent folder to cd later

for /f "delims=" %%i in ('dir /B /N') do (
	if exist %%~si\NUL (
		cd %install_folder%\%%i
		python setup.py install
		cd ..
	) else (
		pip install %%i
	)
)
: pip install folder need python setup.py but file only pip required


: for %%i in (*) do pip install %%i :pip install file only show for file so can install directly


cd %~dp0
pip freeze > req.txt
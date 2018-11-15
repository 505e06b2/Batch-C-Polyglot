rem ();int puts(const char *);int main(){/*
@echo off
echo ^>^>^> Batch:
goto :main*/
	#define echo puts(
	#define rem );
	#define gg "gg"
/*
:main*/

echo gg

rem /*
echo ^>^>^> C:
tcc\tcc -x c "%~0" -run
pause
goto :eof
*/return 0;}
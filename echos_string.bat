rem ();/*
@echo off
echo ^>^>^> Batch:
goto :main*/
#include <stdio.h>

#define set char *
#define echo puts(
#define rem );

#define text "text"
int main() {/*
:main*/
	echo text
	rem /*
echo ^>^>^> C:
tcc\tcc -x c "%~0" -run
pause
goto :eof
*/	return 0;
}
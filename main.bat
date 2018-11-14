rem ();/*

:: >>> Standard batch:
set print_with_c=Is that you, %username%!?

:: >>> Prepare for C:
@echo off
echo.
rem The first line of this script, when parsed, will look like: rem ();/*=rem ();/*
<%0 (set /p varname=)
setlocal enabledelayedexpansion
set LF=^


rem ==> Need 2 blank lines

rem Put every line of this script into an array
set index=-1
set "out="
for /f "delims=" %%f in ('type %0') do (
	set /a index+=1
	set out[!index!]=%%f
)

rem Go through array, appending to the output variable
rem We could just append when we originally parse, but delayedexpansion will ruin the output (max var size: 8kb)
set "%varname%="
for /l %%n in (0 1 !index!) do (
	set "%varname%=!%varname%!!out[%%n]!!LF!"
)

echo ^>^>^> C source code:
set "%varname%"
echo ^>^>^> Run C source code:
set "%varname%" | tcc\tcc -x c - -run
pause
goto :eof
*/

#include <stdio.h>
int main(int argc, char **argv) {
	puts("!print_with_c!");
	return 0;
}

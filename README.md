
# Polyglot
### compiles_itself.bat
What this batch file does:
* Compiles as C source (`cc -x c main.bat`)
* Runs as a "standard" batch file to compile and run itself as C
* Expands variables in the C source as a sort of pre-pre-processor

What it relies on:
* C
	* Functions are implicitly int if no type specified
	* Multiline comments can "start" multiple times, as long as the end only occurs once
* Batch
	* Variable names can be almost anything, as long as any invalid symbol is escaped
	* Arrays can be simulated with `delayedexpansion`
	* Variables can only store multiline strings if `delayedexpansion` is enabled
	* `delayedexpansion`
		* `! variables` parse whenever the line is encountered; even on arbitrary input
		* `! variables` doesn't work with pipes well
		* `% variables` are parsed before anything is executed on the line
	* `set var` echos the contents of var to stdout
	* `goto :eof` stops execution of current script
	* `<%0 (set /p var=)` gets the first line of a file from stdin and puts it into a `var`


### echos_string.bat
What this batch file does:
* echos text, then runs itself as a C program which does the same

What it relies on:
* C
	* Functions are implicitly int if no type specified
	* Stdlib functions can be used as long as they're defined
	* The preprocessor can alter the syntax of the source, anywhere in the source
* Batch
	* Labels can be named arbitrarily
	* `goto :eof` stops execution of current script

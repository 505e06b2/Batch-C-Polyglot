# Polyglot
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
	* `set` echos the contents to stdout when not setting the variable
	* `goto :eof` stops execution and returns (back to a `call`) if needed
	* `<%0 (set /p var=)` gets the first line of a file from stdin and puts it into a `var`
	* `::` comments don't ever echo

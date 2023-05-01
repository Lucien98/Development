## 1st May
### rename file
To rename files with the common prefix `section` in the same directory into ones without the prefix, we could use the following commands:

	Setlocal Enabledelayedexpansion
	set "str=section"
	for /f "delims=" %%i in ('dir /b *.*') do (
	set "var=%%i" & ren "%%i" "!var:%str%=!")

Let's see how it works?

reference: [for/F命令详解](https://www.cnblogs.com/hinata-sen/p/7443007.html)

The syntax of `for /f`:

	for /f ["options"] %%i in ('command') do command

1. `for /f` 
2. `["options"]` - "delims=", note there's no [] in the instantiation
3. `%%i`
4. `in`
5. `('command')` - ('dir /b *.*')
6. `do`
7. `command` - (set "var=%%i" & ren "%%i" "!var:%str%=!"), note a pair of () is added to command.

Note that `%var:%str%=%` is the syntax of replacing text within a variable, and when enabling delayed expansion, `%` is changed to `!`. Please refer to [How-to: Edit/Replace text within a Variable](https://ss64.com/nt/syntax-replace.html) for details.

### artratex.bat
	for %%F in (*.tex) do (
	set FileName=%%~nF
	)

You can use `%%~nf` to get filename only as described in the reference for [`for`](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/for). Please refer to [Batch: Remove file extension](https://stackoverflow.com/questions/3215501/batch-remove-file-extension).


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
2. `["options"]` - "delims=", note there's no [] in the instantiation. The explanation see at [for /f命令之—Delims和Tokens用法&总结](https://blog.csdn.net/kagurawill/article/details/114982328)
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

## 2nd May
### Some lessons learned from batch file
1. **Do not** debug batch file in sublime text, debug in command window
2. batch has a very strict usage of space, so be extremely careful.


## 13 May
### Measure the execution time of a batch script
Please refer to [How do I measure execution time of a command on the Windows command line?](https://stackoverflow.com/questions/673523/how-do-i-measure-execution-time-of-a-command-on-the-windows-command-line).
	
And I just replace the `cmd /c %*` of this [./timecmd.bat](./timecmd.bat) into `cmd /c test.bat` and it worked.

## 14 May
print 1 to 10 in windows cmd: `for /l %i in (1,1,10) do (echo %i)`

## 16 May
### How to see why a process is killed
sudo dmesg | tail -7

### What is the relationship between `--memory` and the verification result
When the parameter for `--memory` is too big, for example 10G/12G/16G, the process tend to be killed.


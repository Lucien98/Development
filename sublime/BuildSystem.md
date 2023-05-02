The build system of sublime is very powerful
## 30th April
Several custom build system in sublime is introduced in https://blog.csdn.net/qq_35366294/article/details/84110136, including java, c, python, batch file.

And the code provided in this link for batch file could not deal with the batch file whose location contains a space, the solution is rather easy.

	{
      	"cmd": ["$file"],
      	"file_regex": "^\\s*File \"(...*?)\", line ([0-9]*)",
      	"file_patterns": ["*.bat"],   //一定要加上这行，build system才能自动匹配 *.bat 文件。
       	//执行完上面的命令就结束
       	//下面的命令需要按Ctrl+Shift+b来运行
      	"variants":
      	[
           	{
                	"name":"Run",
                	"shell": true,
                	"cmd": ["start","cmd","/c", " $file &echo. & pause"],
                	"working_dir": "${file_path}",
           	}
      	]
	}	

solution: change the second last line to 

                	"cmd": ["start","cmd","/c", " ${file_name} &echo. & pause"],

Note:

1. file: the full path of the file
2. file_name: the name of the file
3. file_path: the path of the directory where the file locate

## 1st May
### compilation of LaTeX
please refer to [LaTex/compilation.md](../LaTeX/compilation.md) and [LaTeX/reference.md](../LaTeX/reference.md) and [Sublime中设置Latex自定义命令一次完成参考文献生成](https://blog.csdn.net/txh3093/article/details/107214454).

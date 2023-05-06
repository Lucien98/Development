## synthesizing RTL code with DC
### `ungroup -all -flatten`
This command can be seen at [DC-系统模块划分](https://blog.csdn.net/seuwilson/article/details/52450190).

This works for Vhdl, but not Verilog.

Comand `compile_ultra` needs a different license?[Design Compiler入门](https://zhuanlan.zhihu.com/p/129059203), An image in [Synopsys逻辑综合及DesignCompiler的使用](https://blog.csdn.net/qq_42759162/article/details/105541240).

## 5th May
The point *This works for Vhdl, but not Verilog.* is not true. It turns out I forgot to add the option `-hierarchy` when write output verilog file.

TODO: figure out what is `-hierarchy` used for in the `write` command.

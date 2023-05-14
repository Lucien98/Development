## 12 May
### Initialization of 2-d array
In c++, Even if the elements of a 2-d array are all zeros, this 2-d array must be initialized with {0}.

### boost::program_options
In visual studio, an error occurred: cannot open file 'libboost_program_options-vc141-mt-x64-1_66.lib'

Reason: [官方boost包build之后不存在该静态库，需要自己生成](https://blog.csdn.net/qq_42894837/article/details/110224240).

Solution:

1. Compile boost
    [boost1.79编译](https://blog.csdn.net/aoxuestudy/article/details/124225164#)
    - `.\bootstrap.bat` (I only used this, the following are not done)
    - `./b2 install --prefix=PREFIX`
    - `bjam stage --toolset=msvc-14.2  --without-python --stagedir="E:\boost\boost1.79\boost_1_79_0_build" link=static runtime-link=shared runtime-link=static threading=multi debug release`
    - `./b2 install --prefix=“E:\boost\boost_1_74_0_build\x64” --build-type=complete --toolset=msvc-14.2 threading=multi --build-type=complete address-model=64`
2. bjam

	`.\bjam.exe stage --toolset=msvc-14.1 --stagedir="D:\boost_lib" link=static runtime-link=static threading=multi debug release`

    - After step 2 I have a file `libboost_program_options-vc141-mt-s-x64-1_66.lib` in `D:\boost_lib\lib`. When I run RPVerif in VS, the error still occurred.

    - Notice the generated file has an `-s` in its name, so I decided to:

3. rename file(delete `-s` in file name)

    - rename `D:\boost_lib\lib\libboost_program_options-vc141-mt-s-x64-1_66.lib` into `D:\boost_lib\lib\libboost_program_options-vc141-mt-x64-1_66.lib`

	- And it still did not work, because 

			有“mt”的为“threading=multi”版本，没有的则是“threading=single”版本。
			有“s”的为“runtime-link=static”版本，没有的则是“runtime-link=shared”版本。
		
		as explained in [boost1.79编译](https://blog.csdn.net/aoxuestudy/article/details/124225164#).

4. bjam again
    - I changed the command in step 2 into
    
    	`.\bjam.exe stage --toolset=msvc-14.1 --stagedir="D:\boost_lib" link=static runtime-link=shared threading=multi debug release`

    - It worked!

#### differences of static/dynamic libraries between linux and windows

| 		|Linux	|windows|
|-		|  -  	|  -    |
|static | `.a`	| `.lib`|
|dynamic| `.so`	| `.dll`|


  - so: shared objects
  - dll: dynamic link library

## 13 May
### Constructor of c++ class
#### NodeContext
  - No explict constructor, it has data types `int`, `pair`, `string`, `bool`, `pointer`.
  - All pointers are initialized with `NULL` or the `new` keyword.
#### RPVerif
  - data types: `string`, `Graph`, `vector`, `O_d`, `map`, `pair`, `int`
  - Some are initialized in constructor, some are initialized in declaration, and others are initialized somewhere else.
#### BooleanMatrix

## 14 May
### Parser
  - Parser generator
      + lex, yacc
      + ocamllex, ocamlyacc/menhir
      + Abstract
### Text to Abstract Syntax Tree
  - only need unary, binary operator
  - Homework [ast-interpreter](https://github.com/Lucien98/ast-interpreter)
      + unaryExpr->getOpcode
      + unaryExpr->getSubExpr
      + Can parenExpr seen as a unaryExpr?
      + What if there are two operators in one expression? There's no such case in ast-interpreter.

### Parser of maskVerif
I should read and learn it carefully.

Maybe I should refer to the lexer of a [calculator](https://github.com/Scylardor/ocamlculator) in ocaml.

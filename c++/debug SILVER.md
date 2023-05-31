## 7 May
### Differences between `RUN` and  `CALL` in Lace
TODO

When compiling SILVER, before replacing the `CALL` of `#define` in sylvan_ext.h into `RUN`, `make` throws a error of undeclared ...

## 8 May
### debug for lace
This line (in Silver.cpp/Check_Probing/if(robustModel)) generates a segment fault in copy the vector parameter `path`.

    double p = RUN(mtbdd_singprobability_1shot, observation.GetBDD(), varcount, path, res, ns);

Note that this line in the `else` statement of `if(robustModel)` did not raise the segment fault.

<!-- Note that this error only occured when check the security of q12. -->
#### aes_sbox_couniform2.nl
after runing about 720 seconds, the size of extended probes are always 0.

### Summary of 7,8 May
I am careless due to the stupid print_by_col.py script.

 - Bug 1: It seemed that the `prev_permutation` did not work after the update of lace framework
 	+ I tried to replace the `prev_permutation` with `Combination`
 	+ I made this **stupid mistake**: variable `order` in SILVER is 0. I try to use `order` to initialze the `m` in `n \choose m`.
 - Bug 2: the size of extended probes is 0
 	+ When copying the header file from sylvan to SILVER via regex `*.h`, only the `.h` files are copied and thus the `hpp` file(`sylvan_obj.hpp`) missed. Now I understand that `.h` is C header files and `.hpp` is C++ header files.
 - Bug 3: Segment fault raised when running 1shot method.
 	+ todo: how to solve it?

## 15 May
### degrade lace
When I checkout the commit using older version lace, VS throws a error:

    The "ValidateSource" task returned false but did not log an error

In fact, the `vcxproj` file contains the information that which file is included in the project. So we can just remove such lines which includes the file into the project.

    <ClInclude Include="inc\sylvan\lace_config.h" />
    <ClInclude Include="inc\sylvan\sylvan_zdd.h" />

And the dependent `sylvan` library is also changed:

      <AdditionalLibraryDirectories>%(Link.AdditionalLibraryDirectories);/home/lucien/git/sylvain/build/src/;/home/lucien/git/sylvain/build/_deps/lace-build/</AdditionalLibraryDirectories>

### All testbenchs failed in the single shot method and are significantly slower.

### next things to do
  - [x] add gc feature
  - [ ] figure out Why SILVER with the new lace framework is much slower?
  - [ ] figure out Why sylvan_stat did not work?
### some data for the current version SILVER

| bench     | time      | original time |
|   -       |   -       |   -           |
|  Dom1     | 0.052     | 0.001         |
|  Dom3     | 472.923   | 2.8           |
|AES1Fresh  | 387.733   | 37.892        |
|AESNoFresh | 455.664   | 38.976        |

And after using `sylvan_set_granularity(3);`, the running time is 525.963

## 16 May
### `lace_start`
`lace_start(unsigned int n_workers, size_t dqsize)`

  - n_workers
      + 
  - dqsize
      + dq is the short for doube-ended queue

### results for aes_sbox_couniform1

    [   850.934] probing.robust   (d ≤ 1) -- PASS.  >> Probes: <in:line16,in:line8>
    Sylvan statistics
    
    Tables
    MTBDD nodes created  1143427281      
    MTBDD nodes reused   640239700       
    Lookup iterations    8295019663      
    Unique nodes table   16130869 of 16777216 buckets filled.
    Operation cache      12823306 of 16777216 buckets filled.
    Memory (nodes)       384.00 MB (max real) of 384.00 MB (allocated virtual memory).
    Memory (cache)       576.00 MB (max real) of 576.00 MB (allocated virtual memory).
    
    Operation            Count            Cache get        Cache put
    BDD and              3060371106       1739254095       1249991591      
    BDD xor              6777669          4124168          2533644         
    
    Garbage collection
    GC executions        81              
    Total time spent     38.638486 sec.
    
### Lace fatal error: Task stack overflow! Aborting.
When this error occurrs, we should increase the parameter `dqsize` of `lace_init`.

When the `dqsize` is set to `10000000`, the error no longer occurrs.


## 18 May
### sylvan_nodecount()
It is a function for `MTBDD` rather than `Bdd`.


## 19 May
When I tried to use global variale to implement command line options, I declared an variable of type struct in `config.hpp` file.
As both `Silver.cpp` and `verify.cpp` include `config.hpp`, in the linking phase, an `multiple definition` error occurred

    verify.o: config.hpp:127:multiple definition of `cfg`;
    Silver.o: config.hpp:127:first defined here

Please refer to [c++ linking error of multiple definition](https://ubuntuforums.org/showthread.php?t=1660856) for more information.

And then I was told not to use global variale.

I need to learn some more about how to separate `hpp` files into `h` files and `cpp` files.

## 24 May
### Time of aes_sbox_couniform1
  - presharing: 659.434
  - single: 760.729
  - sharing: 3836.538
<!-- ### Does endian work? -->
  - presharing, lit:625.615
### aes_sbox_dom1
  - presharing, lit: 746.839

## 25 May
### memory restrain and `OoM kill`
I did not give a restrain in the memory used by SILVER, and while verifying the first order dom and cms version of AES sbox, the process was killed due to `out of memory`
### Synthesis of aes_sbox_dom3
  - `signal 3 is defined multiple times`:
    + change the line in `replace.py` into
    + `s = re.sub(r'\[(\d+)\]\[(\d)\]', r'_\1__\2_', s) # this line is different from replace.py of aes_sbox_dom2`

## 31 May
### Prince Cipher
[Prince](https://eprint.iacr.org/2012/529.pdf)

**Key schedule**
  - What are the differences between `k_0`, `k_0_p` and `k_1`

## 31 May
### synthesis of prince_roundBased
#### Notation

    (* SILVER="control" *)  input [63:0] input_s1;
    (* SILVER="control" *)  input [63:0] input_s2;
    (* SILVER="[63:0]_0" *)  input [63:0] k_0;
    (* SILVER="[127:64]_0" *)  input [63:0] k_0_p;
    (* SILVER="[191:128]_0" *)  input [63:0] k_1;
    (* SILVER="[63:0]_1" *)  input [63:0] k_0_2;
    (* SILVER="[127:64]_1" *)  input [63:0] k_0_p_2;
    (* SILVER="[191:128]_1" *)  input [63:0] k_1_2;
    (* SILVER="[63:0]_0" *)  output [63:0] output_s1;
    (* SILVER="[63:0]_1" *)  output [63:0] output_s2;
    (* SILVER="control" *)  input [3:0] round;
    (* SILVER="control" *)  input reset, enc_dec, roundStart_Select, roundHalf_Select, roundEnd_Select,
            clk;

#### Parse result

    the target module SDFF_X1 not found
    cell type or module SDFF_X1 not found
    cell type or module HDSDFPQ1_0 not found
    cell type or module dflipfloplw_0 not found
    cell type or module ScanFF_SIZE64_0 not found
    cell type or module PRINCE_Round not found
  
  SILVER did not recognize `SDFF_X1`, so other components that contain `SDFF_X1` are also not recognized.

### change `SDFF_x1` into `DFF_X1`

    268 Buffer(s) removed and 151 signal(s) rerouted
    the circuit either has a loop or cell \rounds.roundResult_Reg_s1.SFF_0.SFFInst.Q_reg has an unconnected input. SILVER is currently not able to evaluate such a deisgn
    Verilog design parsing failed.

It seems we should rewrite the vhdl/verilog code of `prince` into a version that only contains a single round in a non-iterated way. So I should be very familier with the cipher and `vhdl`, so this won't be done in several months.

### next things to do
1. synthesis of other schemes RUB proposed
2. solve the issue that RPVerif failed to verify skinny
3. add reduction rules to SILVER
4. print robust probes in RPVerif
5. software and hardware masking
6. testbenchs of software masking
7. boolean masking and arithmetic masking
8. 
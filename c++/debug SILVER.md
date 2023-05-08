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

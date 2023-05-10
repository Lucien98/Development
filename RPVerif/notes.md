## 9 May RPVerif
### clean up
  - rename function `PerfectMatch` to `RemoveFullRank`
  - rename map `re_num` into `Gi_gi_map`
  - rename vector `num` into `gi_Gi_map`
  - rename `p` into `node`
  - rename `pm` into `perf`
  - rename `simplify_rule2` into `remove_redundant_sum`
  - rename `simplify_rule6` into `remove_unique_perf`
  - comment `simplify_rule7`
  - rename `simplify_rule1` into `reduceOd`
  - rename `expr` into `node_vertices`
  - rename `mask` into `mask_vertices`
  - delete class `BooleanMatrix0`
  - define 3 macros
  	+ input_offset, max_num_probes, max_num_masks

### Why do i need 3500
The `in` and `ref` nodes are both perfect mask and expressions that need mask.

## 10 May
### Comparison with RPVerif before the cleaning up in 9 May
after the modification of 9 May:
  - paraSNI3 failed(due to the comment `simplify_rule7`)
  - the perfomance decrease a lot in small programs
  	+ The reason for the perfomance decrease:
  		* maybe because my pc is tired now? I'd run the testbenchs of maskVerif to check it. - It is not.
  		* Maybe because the IO time too long? Yes, it is. But the 0ms benchs are less

### What are rule 6 and 7 about?


### What role does `simplify_rule7` play in verification
see the results in repos/RPVerif/x64/Release/diff.txt or [../../RPVerif/x64/Release/diff.txt](../../RPVerif/x64/Release/diff.txt).

  - `paraSNI3` failed
  - `ni_count`, `rank_count` changes: `uma`, `aes_sbox_cms2_an`

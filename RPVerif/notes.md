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

**Conclusion**: I don't know why the 0ms benchs are much less. It is wierd. It is slightly because:

  - print leaky Od to file

originally, there are 7 benchmars are 0 ms, 8 benchs are 1 ms, but only 3 benchs are 0 ms, and 6/7 benchs are 1 ms.

### What are rule 6 and 7 about?


#### What role does `simplify_rule7` play in verification
see the results in repos/RPVerif/x64/Release/diff.txt or [../../RPVerif/x64/Release/diff.txt](../../RPVerif/x64/Release/diff.txt).

  - `paraSNI3` failed
  - `ni_count`, `rank_count` changes: `uma`, `aes_sbox_cms2_an`

#### What role does `simplify_rule6` play in verification
I don't know

### solution to remove these two rules
I modified the function `extendOd_rank`, then `simplify_rule6` and `simplify_rule7` are no longer needed.

    bool extendOd_rank(std::vector<Node>& od, std::vector<Node> leakyOd) {
        // std::set<Node> original_od(od.begin(), od.end());
        std::set<Node> ext;
        for (std::vector<Node>::reverse_iterator i = od.rbegin(); i != od.rend(); )//modified
        {
            if (std::count(leakyOd.begin(), leakyOd.end(), *i) == 1) {
                // in fact, this line will never happen, because the index of `in` and `ref` node (*i) 
                //   is not equal to the index in leakyOd, i.e. index in leakOd has an offset. 
                if (model[*i].getType() == "in" || model[*i].getType() == "ref") {
                    i++;
                    continue;
                }
                ext.insert(model[*i].getRegisters()->begin(), model[*i].getRegisters()->end());
                i = std::vector<Node>::reverse_iterator(od.erase((++i).base())); //modified
                break; //add
            }
            else {
                i++;
            }
        }
        if (ext.size() == 0) return false;
        od.insert(od.end(), ext.begin(), ext.end());
        std::set<Node> odset(od.begin(), od.end());
        od.clear();
        od.insert(od.end(), odset.begin(), odset.end());
        // std::sort(od.begin(), od.end());
        return true;
    }



#### side notes
  - benchs that need extendOd_rank:
    + paraSNI3
    + aes_sbox_cms2_an
    + aes_sbox_dom2
    + AESSbox_2OM_18
  - AES DOM2 now only has 24 unverified probes

### Intersting fact
When RPVerif verifies all combinations despite of already finding a leakyOd, it is significantly slower in small benchs.

**Not Intersting**, it's just a accidental phenomena.

### Dangerous global variale `require_extend`

## 11 May
### What is `witness` and `bijection`
Vector `witness` stores the perfect mask used in verifying the dth-order observation set. 
There is an `is_leaky` function using `witness` to check whether `witness` is leaky. Now I think it is unnecessary. (TODO: remove `is_leaky`)
And now it is un
Map `bijection` 

### Check weather the condition of rule 2 holds
It is clear that Full Rank rule is only applied once in the verification of a dth-order observation set.
So it is rather easy to check whether the condition of the full rank rule holds.
And only AES_2OM need to check supp_prime ∩ perf is empty, other testbenchs only need to check that supp_prime is 
empty.

        if (leaky.size() == 0) {
            if (verbose > 2) {
                printf("\033[**31m**RANK:\033[**0m**");
                std::cout << " " << component.size() << " " << num_comp << " ";
            }
            assert(num_comp == 1);
            std::set<Node> supp_prime;
            std::set<Node> perf;
            for (auto const bij : bijection) {
                //assert(bij.first >= input_offset);
                if (verbose > 2) {
                    std::cout << " " << to_string(bij.first) << " ";
                    for (auto m : bij.second) {
                        std::cout << " " << to_string(m) << " ";
                    }
                    std::cout << "\n";
                }
                std::set<Node> diff;
                Node i = bij.first >= input_offset ? bij.first - input_offset : bij.first;
                std::set_difference(model[i].getSupportV()->begin(),
                    model[i].getSupportV()->end(),
                    model[i].getPerfectM()->begin(),
                    model[i].getPerfectM()->end(),
                    std::inserter(diff, diff.begin())
                );
                supp_prime.insert(diff.begin(), diff.end());
                perf.insert(model[i].getPerfectM()->begin(), model[i].getPerfectM()->end());
            }
            if (!supp_prime.empty()) {
                std::set<Node> diff;
                std::set_difference(supp_prime.begin(),
                    supp_prime.end(),
                    perf.begin(),
                    perf.end(),
                    std::inserter(diff, diff.begin())
                );
                assert(diff.empty());
            }
        }


### next things to do
  - remove dependency of eigen (**half way**)
  - add command options to RPVerif(espeically the order option)
  - change the structure of RPVerif
  - fix the bug of skinny_sbox8_CMS1
  - make test vector to verify the changes of the code is right (or equivalent).
  <!-- -  -->

## 12 May

### next things to do
  - [x] remove dependency of eigen
  - [x] add command options to RPVerif(espeically the order option)
  - [x] change the structure of RPVerif
  - [x] remove the unnecessary `fixedSupportV` left from history
  - [ ] fix the bug of skinny_sbox8_CMS1
  - [ ] make test vector to verify the changes of the code is right (or equivalent).

### What affects the efficiency
When I run RPVerif the first time in the afternoon, it is much slower in small benchs.

Is it because the program has ran before in the morning, so it is faster?


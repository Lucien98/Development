# 2023年
## 4月21日
<!-- regex -->
When I install gitblit in my PC, tutorial told me to set up gitblit with file data/defaults.properties. I wondered that how many options can I config via data/defaults.properties. The file contains 2000+ lines and most of the lines are comments. 

- To find out the total number of comment lines, I use the following regex: `^#`.

- To find out the total number of blank lines, use `^$`.

the rule of regex in sublime:

> start of line: `^`
 
> end of line: `$`
 
And there is an alternative way to do this: cloc. Since cloc is aready in my system Path, so the only thing I need to do is changing to that directory and `cloc defaults.properties`. While cloc identify the text file only but its extendsion, it ignores the properties file. So I changed the file's extend to `.sh`, and I get the following result. 

 D:\gitServer\gitblit-1.9.3\data>cloc defaults.properties.sh

        1 text file.
        1 unique file.
        0 files ignored.
    http://cloc.sourceforge.net v 1.64  T=0.01 s (99.9 files/s, 217062.1 lines/s)
    -------------------------------------------------------------------------------
    Language                     files          blank        comment           code
    -------------------------------------------------------------------------------
    Bourne Shell                     1            259           1677            237
    -------------------------------------------------------------------------------
<!-- |------------------------------|----------------|--------------|---------------|----| -->
<!-- if the first character of line is a space and there is no break line between this line and the first line of the following table then the following table won't work  -->
Translating the table into markdown table as follows:

|Language                     |files          |blank        |comment        |code|
|-----------------------------|---------------|-------------|---------------|----|
|Bourne Shell                 |1              |259          |1677           |237|

<!-- |--------------------------------|----------------|---------------|-------------|---| -->

And these two method returns the consistent result. The first method concludes that there are 260 blank lines and 1677 comment lines while the results of the second method is shown above.


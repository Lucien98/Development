#!/usr/bin/bash
# dot -Tpng sm4.gv -o sm4.png
for i in 497 498  503  504  529  530  533  534  539  540  563  564  599  615  634
do
	dot -Tpng "gv/$i.gv" -o "png/$i.png"
	# dot -Tpdf "gv/$i.gv" -o "pdf/$i.pdf"

done

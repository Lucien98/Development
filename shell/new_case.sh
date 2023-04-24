circuit=$1 #unisbox # declaring circuit = q12 with space will not work
mkdir -p "subtree/${circuit}_subtree/png"
mkdir -p "subtree/${circuit}_subtree/pdf"
mkdir -p "subtree/${circuit}_subtree/gv"
mkdir -p "subtree/${circuit}_subtree/csv"
mkdir -p maintree/$circuit/

genGraph_m="maintree/${circuit}/genGraph.py"
gv2png_m="maintree/${circuit}/gv2png.sh"


if [ -f $genGraph_m ]
then 
	echo '1 file exist'
else
	cp maintree/present/genGraph.py maintree/$circuit/
fi
if [ -f $gv2png_m ]
then 
	echo '2 file exist'
else
	cp maintree/present/gv2png.sh maintree/$circuit/
fi

genGraph_s="subtree/${circuit}_subtree/genGraph.py"
gv2png_s="subtree/${circuit}_subtree/gv2png.sh"

if [ -f $genGraph_s ]
then 
	echo '3 file exist'
else
	cp subtree/present_subtree/genGraph.py subtree/${circuit}_subtree/
fi

if [ -f $gv2png_s ]
then 
	echo '4 file exist'
else
	cp subtree/present_subtree/gv2png.sh subtree/${circuit}_subtree/
# mkdir 
fi

main_fold="maintree/${circuit}/"
sub_fold="subtree/${circuit}_subtree/"
if [ -f "${main_fold}${circuit}.csv" ]
then
	echo "csv file exist"
else
	echo $(basename ${circuit}.csv)
	echo '' > "${main_fold}$(basename ${circuit}.csv)"
fi
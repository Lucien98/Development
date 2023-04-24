while read line;
do
	echo $line
	# echo "test/${line}.mv"
	./maskverif < test/${line}.mv
	# ./bin/rpverif $line 1
	echo
	echo
	echo "****************"
done < ./false_negatives.txt

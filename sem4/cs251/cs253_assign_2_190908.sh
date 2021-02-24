#!/bin/bash
# IFS=$'\n'
declare -a States=($(jq 'to_entries[] |.key' data.json))

var=0

for state in "${States[@]}" 
	do
	# echo $var
	# var=$((var+1))
    # echo $state
	state_name=$state
	state_name="${state_name%\"}"
	state_name="${state_name#\"}"
	# echo $state_name
	# echo "#########################"
	jq -r --arg state_name "$state_name" '.[$state_name]' data.json > tmp.$$.json && mv tmp.$$.json d.json
	# cat d.json
	total_state=$(jq '.total.confirmed' d.json)
	max=0
	max_district=""
	max_confirmed=0
	total_district=0
	# echo "Total_state ------------------------------------------------------------------------------------------"
	# echo $total_state


	if [ "$total_state" -ge 5000 ] 
		then
			IFS=$'\n'
		    # echo "was here##############################################"
			declare -a Districts=($(jq '.districts|to_entries[] |.key' d.json))
			
			# Districts=jq '.districts|keys' d.json 
			jq -r '.districts' d.json > tmp.$$.json && mv tmp.$$.json c1.json

			

			for  district in ${Districts[@]}
			 do	
			    
				district="${district%\"}"
				district="${district#\"}"
				# echo $district
				jq -r --arg district "$district" '.[$district]' c1.json > tmp1.$$.json && mv tmp1.$$.json c.json 
				
				tot=$(jq '.total.confirmed' c.json) 
				
				# echo "TOTAL DISTRICT +++++++++++++++++++++++++++++++++++++++"
				# printf 'Total_confirmed  ' 
				# echo $tot
				# var=$((var+1))
				#||$tot < 5000 | bc )) 
				if [[ "$district" != "Unknown" ]]
					then
						if [ "$tot" -ge 5000 ]
							then 
							# jq 'districts.district' d.json > c.json
							recover=$(jq '.total.recovered' c.json)  
							confirm=$(jq '.total.confirmed' c.json)
							rr=`echo "scale=2;100*$recover/$confirm" |bc -l`
							# rr=${rr/.*}
							# echo $rr
							# rr=$( bc -l <<<"100*$recover/$confirm" ) 
							# echo "I was here RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR"
							if (( $(echo $rr '>' $max |bc -l) )); then
	
							 # if [ "$rr" -gt "$max" ]
								# then
								# echo $rr 
								max=$rr
								max_district=$district
								max_confirmed=$confirm  
							fi    
						fi
					fi
			
			
			done
	#  else 
	#     # echo "else ke andar"
	# 	continue 
	fi

	# echo "last me"
	if (( $(echo $max '>' 0 |bc -l) )); then
	# if [ $max -ne 0 ]
		# then
		# echo "inside this"
		echo "$state_name, $max_district, $max_confirmed, $max" >> processed_Covid_Data_190908.csv
		# var=$((var+1))
		# echo $var  
	fi
max=0
				
done
# sed -i 'State_Name, City_Name, Confirmed, Recovery_Rate' answer.csv
# new_header="State_Name, City_Name, Confirmed, Recovery_Rate"
# sed -i '' "1s/.*/$new_header/" processed_Covid_Data_190908.csv
sed -i 1i"State_Name, City_Name, Confirmed, Recovery_Rate" processed_Covid_Data_190908.csv

echo "Now executing cat processed_Covid_Data_190908.csv"
cat processed_Covid_Data_190908.csv

echo "done "
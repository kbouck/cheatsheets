```bash
# print a year calendar with week numbers
(cal 1 2021 | sed '3q;d' | sed '/^$/d'; for n in $(for i in {1..12}; do cal $i 2021 | tail -n "+3"; done); do printf "%2s " $n ; done | cut -c 22- | fold -w 21) | cat -n

# not quite working - but almost there



cal 3 2022 | tail -n "+3"  # get the days of a month

for n in $(for i in {1..12}; do cal $i 2022 | tail -n "+3"; done); do printf "%2s " $n ; done  # days of year as 3-space 



(echo -n $(cal 1 2022 | sed -E '1,2d;4,$d;3s/([ ]+) 1 +.*$/\1/g'); for n in $(for i in {1..12}; do cal $i 2022 | tail -n "+3"; done); do printf "%2s " $n ; done) | fold -w 21 | cat -n

 
# Get first set of spaces for first week of year
cal 1 2022 | sed -E '1,2d;4,$d;3s/([ ]+) 1 +.*$/\1/g'

# number of spaces to prefix first week
sed -E '1,2d;4,$d;3s/([ ]+) 1 +.*$/\1/g' | wc -c 


===============

# print yearly calendar with week numbers
printf "         $(cal | sed "2q;d")\n"; (printf "%$(cal 1 2022 | sed -E '1,2d;4,$d;3s/([ ]+) 1 +.*$/\1/g' | wc -c)s"; for n in $(for i in {1..12}; do cal $i 2022 | tail -n "+3"; done); do printf "%2s " $n ; done) | fold -w 21 | sed '/^ *$/d' | cat -n; printf "\n"

# explained:
printf "         $(cal | sed "2q;d")\n";     # prints the days of week, with enough prefix to line-up with output of cat -n

printf "%$(cal 1 2022 | sed -E '1,2d;4,$d;3s/([ ]+) 1 +.*$/\1/g' | wc -c)s" # prints the spaces prior to the 1st day of year

# print each day number as 3-chars right-justified
for n in $(for i in {1..12}; do cal $i 2022 | tail -n "+3"; done); do printf "%2s " $n ; done)

# word-wrap after 21 chars (3 chars per day * 7 days)
fold -w 21

# add line numbers, which represent the weeks
cat -n


```


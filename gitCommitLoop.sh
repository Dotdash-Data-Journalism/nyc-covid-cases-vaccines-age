# COUNTER=1

# for commit in $(sed "${COUNTER}q;d" ../nycCovidCommitsJustHashes.txt)
# do
#     git show $commit:totals/by-age.csv > ../nycCovidProjection/byAgeData/by_age_$COUNTER.csv
#     COUNTER=$((COUNTER+1))
# done

for i in {1..174}
do
    git show $(sed "${i}q;d" ../nycCovidProjection/nycCovidCommitsJustHashes2.txt):totals/by-age.csv > ../nycCovidProjection/byAgeData/by_age_$i.csv
    echo Made csv $i
done
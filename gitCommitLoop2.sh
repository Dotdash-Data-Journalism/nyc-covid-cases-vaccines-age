for i in {175..393}
do
    git show $(sed "${i}q;d" ../nycCovidProjection/nycCovidCommitsJustHashes2.txt):by-age.csv > ../nycCovidProjection/byAgeData/by_age_$i.csv
    echo Made csv $i
done
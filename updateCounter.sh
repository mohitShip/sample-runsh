initialCounter=`cat shippable.triggers.yml | grep counter | awk {'print $2'}`
incrementedCounter=$((initialCounter+1))
sed "s~$initialCounter~$incrementedCounter~g" shippable.triggers.yml > temp
mv temp shippable.triggers.yml
git add --all
git commit -m "Updating counter from $initialCounter to $incrementedCounter"
git push origin master

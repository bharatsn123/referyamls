#!/bin/sh

if [ $# -eq 0 ]
then
	echo "1. Create Server and Services \n2. Delete Server and Services\n"
	read op
else
	op=$1
fi
if [ $op -eq 1 ]
then
	echo "INFO : Creating server---"
	kubectl create -f https://raw.githubusercontent.com/bharatsn123/referyamls/master/teastore-rabbitmq.yaml
	echo "INFO : Sleeping for 3 seconds... Giving time for server to come online.. Please Wait"
	sleep 3s
	echo "INFO : Creating services---"
	kubectl create -f https://raw.githubusercontent.com/bharatsn123/referyamls/master/teastore-ribbon-kieker.yaml
else
	echo "INFO : Deleting server---"
	kubectl delete -f https://raw.githubusercontent.com/bharatsn123/referyamls/master/teastore-rabbitmq.yaml
	echo "INFO : Deleting services---"
	kubectl delete -f https://raw.githubusercontent.com/bharatsn123/referyamls/master/teastore-ribbon-kieker.yaml
fi

echo "INFO : build.sh is done "

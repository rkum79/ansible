response=$(curl -s -o /dev/null -w "%{http_code}\n" http://localhost:3000/)
if [ "$response" != "200" ]
then
 exit 1
fi

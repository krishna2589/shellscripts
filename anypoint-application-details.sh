#To display mule api application full details from api manager
anypoint-cli --host anypoint.mulesoft.com --username="<anypoint.username>" --password="<anypoint.password>" --environment="<anypoint.environment>" runtime-mgr standalone-application describe --output 'text' "anypoint.applicationname"

#script to extract specific values and update jenkins build status based on the results.
for f in $(anypoint-cli --host anypoint.mulesoft.com --username="<anypoint.username>" --password="<anypoint.password>" --environment="<anypoint.environment>" runtime-mgr standalone-application describe --output 'text' --fields 'Status,File Name' "<anypoint.applicationname>" | awk '/^Status/ {print $2} /^File Name/ {print $3}') 
do
if [[ $f != "<value1>" && $f != "<value2>" ]]; then
echo "Deployment Failed"
exit 1
fi;
done
echo "API Started, deployment successful"
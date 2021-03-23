#/bin/sh
#Tests if file can be reached with curl, then an ifelse to act upon this.
#Sends downloaded file to /dev/null so you don't need to deal with it
#Relies on curl being installed

####################################
## Specify parameters for testing ##
test_URL='https://d1.awsstatic.com/logos/aws-logo-lockups/poweredbyaws/Powered-By_logo-horiz_RGB.87c70af8a8a34b68606524ade6261db083947a14.png'
desired_status_code=200
####################################

status_code=$(curl -s -o /dev/null -w '%{http_code}' $test_URL ;)

if [[ $status_code -eq $desired_status_code ]]; then
    echo "Succesfully downloaded $test_URL"
else
  echo "ERROR: failed to get desired $desired_status_code response from $test_URL"
  echo "ERROR: Status code is - $status_code"
fi

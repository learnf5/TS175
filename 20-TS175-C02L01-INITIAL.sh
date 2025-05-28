# get the lab and course identifiers
profile_id=@lab.LabProfile.Id
set +x
export LAB_ID=$(curl --silent "https://labondemand.com/api/v3/labprofile?id=$profile_id" --header "api_key: $APIKEY" | jq --raw-output .Number)
echo LAB_ID=\$\(curl --silent "https://labondemand.com/api/v3/labprofile?id=$profile_id" --header "api_key: xxxxxxxxxxxxxxxxxxxxxxx" \| jq --raw-output .Number\)
echo $LAB_ID
set -x
export COURSE_ID=$(echo ${LAB_ID%%-*} | tr A-Z a-z)

# download and run the nap-specific lab script
curl --silent --output /tmp/common-tasks.sh https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/common-tasks.sh
bash -x /tmp/common-tasks.sh

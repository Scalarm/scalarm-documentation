#!/bin/bash
source `dirname $0`/../utils.sh

info "Checking if Information Service is responding"
execute $SCRIPT_PATH/../check_status.sh $INFORMATION_SERVICE_URL

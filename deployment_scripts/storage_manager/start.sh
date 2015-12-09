#!/bin/bash
source `dirname $0`/../utils.sh

info "Go to Storage Manager direcotry"
execute cd $SCALARM_ROOT/scalarm_storage_manager

info "Starting Storage Manager (with single MongoDB instance)"
execute rake service:start_single

info "Wating few seconds for Storage Manager to settle down..."
execute sleep 5

info "Checking if Storage Manager is working"
execute $SCRIPT_PATH/test.sh

# If PUBLIC_LOG_BANK_ADDRESS not set, use localhost
[ -n "$PUBLIC_LOG_BANK_ADDRESS" ] || export PUBLIC_LOG_BANK_ADDRESS=localhost:20000

info "Registering log_bank in Information Service (using public address: $PUBLIC_LOG_BANK_ADDRESS)"
execute $SCRIPT_PATH/../register_service.sh storage_managers $PUBLIC_LOG_BANK_ADDRESS

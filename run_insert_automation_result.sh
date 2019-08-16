#!/usr/bin/env bash
set -e
pwd
echo -e "Inserting test results into the Merchant Center DB"
ls
python insert_automation_result.py "2" ${AUTOMATE_TYPE} ${SERVICE_NAME} ${TEST_TYPE} ${TEST_ENV} ${REPORT_DIR}"/output.xml"

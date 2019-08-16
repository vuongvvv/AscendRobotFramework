#!/usr/bin/env bash
set -e
echo -e "Executing robot test"
robot --variable env:${TEST_ENV} --loglevel TRACE -i ${TEST_TYPE} --outputdir ${REPORT_DIR} /robot/${AUTOMATE_TYPE}/testcases/${SERVICE_NAME}

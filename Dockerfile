FROM python:2.7-alpine

#WORKDIR /usr/src/app

#Install chromedriver
RUN apk add --no-cache chromium chromium-chromedriver

RUN apk add --no-cache bash

RUN pip install --upgrade pip

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . /robot

ADD run_tests.sh /usr/local/bin/run_tests.sh
RUN chmod +x /usr/local/bin/run_tests.sh

ADD insert_automation_result.py /usr/local/bin/insert_automation_result.py
ADD run_insert_automation_result.sh /usr/local/bin/run_insert_automation_result.sh
RUN chmod +x /usr/local/bin/run_insert_automation_result.sh
CMD ["run_tests.sh"]
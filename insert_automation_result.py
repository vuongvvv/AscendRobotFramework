import sys
import urllib2
import urllib
from xml.dom import minidom
import StringIO
import requests
import json
import os
import datetime
import time
import requests
import mysql.connector

unit_id = sys.argv[1]
sub_unit = sys.argv[2]
service_name = sys.argv[3]
test_type = sys.argv[4]
env = sys.argv[5]
result_xml_url = sys.argv[6]

def switch_sub_unit(sub_unit_wording):
   switcher = {
      'api':3,
      'web':2,
      'mobile':5,
      'e2e-tests':6
   }
   return switcher.get(sub_unit_wording,0)
sub_unit_id = switch_sub_unit(sub_unit)


# read robot result from xml
dom = minidom.parse(urllib.urlopen(result_xml_url))

stat = dom.getElementsByTagName('stat')

high_failed = [items.attributes['fail'].value for items in stat if items.firstChild.nodeValue == "High"]
h_failed = 0 if not high_failed else int(high_failed[0])

high_passed = [items.attributes['pass'].value for items in stat if items.firstChild.nodeValue == "High"]
h_passes = 0 if not high_passed else int(high_passed[0])

h_total = h_passes + h_failed

print h_total, h_passes, h_failed

medium_failed = [items.attributes['fail'].value for items in stat if items.firstChild.nodeValue == "Medium"]
m_failed = 0 if not medium_failed else int(medium_failed[0])

medium_passed = [items.attributes['pass'].value for items in stat if items.firstChild.nodeValue == "Medium"]
m_passes = 0 if not medium_passed else int(medium_passed[0])

low_failed = [items.attributes['fail'].value for items in stat if items.firstChild.nodeValue == "Low"]
l_failed = 0 if not low_failed else int(low_failed[0])

low_passed = [items.attributes['pass'].value for items in stat if items.firstChild.nodeValue == "Low"]
l_passes = 0 if not low_passed else int(low_passed[0])

failed = [items.attributes['fail'].value for items in stat if items.firstChild.nodeValue == "All Tests"]
passed = [items.attributes['pass'].value for items in stat if items.firstChild.nodeValue == "All Tests"]

total = int(failed[0]) + int(passed[0])
print int(passed[0]), total

db = mysql.connector.connect(
  host="54.169.158.250",
  user="qadashboard",
  passwd="C0mq@2019",
  database="qadashboard"
)
result = db.cursor()
ts = time.time()
st = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')

try:
   sql_insert = """INSERT INTO automation_result VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"""
   data_insert = [(None, unit_id, sub_unit_id, service_name, test_type, env, h_passes, h_failed, m_passes, m_failed, l_passes, l_failed, int(passed[0]), int(failed[0]), st)]

   result.executemany(sql_insert,data_insert)
   db.commit()
   print "insert data complete"
except:
   db.rollback()
   print "error while insert"

db.close()

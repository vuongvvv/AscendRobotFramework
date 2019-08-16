*** Keywords ***
Get Safely Data From Dictionary
	[Documentation]  This keyword will return a default value that you want if don't found key in dictionary
	[Arguments]  ${dict}  ${key}  ${default_value}={}
	${value}=   Evaluate   $dict.get("${key}", '${default_value}')
	[Return]  ${value}

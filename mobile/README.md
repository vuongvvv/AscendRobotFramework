#### PRE-REQUISITES ####

1) Appium Server
- iOS Device    
    - Run:
        - appium -p 4723 --session-override
- Android Device
    - Run:
        - appium -p 4725 --session-override

2) Android Studio V3.1
    - How to list all emulator on your local machine?
        - Run:
            - cd ~/Library/Android/sdk/tools/bin && ./avdmanager list avd

2.2 How to run emulator?
    - Run:
        - cd ~/Library/Android/sdk/tools &&./emulator -avd <EMULATOR NAME>
- Example:
        - cd ~/Library/Android/sdk/tools &&./emulator -avd NEXUS_5X

3) Robot Framework
    - AppiumLibrary Installation
        - Command: 
            - pip install robotframework-appiumlibrary

3.2 How to run test?
- Run:
    - robot -v ENV:<TEST ENV> -v OS:<PLATFORM> -v DEVICE:<TEST_DEVICE> <TEST FILE PATH>

- Examples:
    - robot -v ENV:alpha -v OS:ANDROID -v DEVICE:NEXUS_5X /Users/nantawan.cha/o2o-mobile-demo/testcases/tsm/tutorial_test.robot
    - robot -v ENV:alpha -v OS:IOS -v DEVICE:IPHONE_X /Users/nantawan.cha/o2o-mobile-demo/testcases/tsm/tutorial_test.robot

4) In your local machine, please create folder 'app-path' for storing the .apk and .app test files.

- Example:

o2o-automation
 - web
 - mobile
 - api
 - e2e-tests
 
app-path
 - iOS
 - Android
 
NOTE: 
- The 'app-path' folder should be in the same level with mobile folder

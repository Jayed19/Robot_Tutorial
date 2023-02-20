*** Settings ***
Library    SeleniumLibrary
Test Template    LoginTest

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login


*** Test Cases ***    Username    Password
1    Admin    admin123
2    Admin    admin1234


*** Keywords ***
LoginTest
    [Arguments]    ${Username}    ${Password}
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Sleep    5s
    Input Text    name=username    ${Username}
    Sleep    5s
    Input Text    name=password    ${Password}
    Sleep    5s
    Click Button    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
    Sleep    5s


    IF    "${Password}" == "admin123"
        Location Should Be    https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index
    ELSE
        Location Should Be    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
    END
  


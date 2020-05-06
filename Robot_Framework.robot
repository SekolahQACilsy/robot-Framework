*** Settings ***
Library           Selenium2Library

*** Variables ***
${TxtUsername}    id=txtUsername
${TxtPassword}    id=txtPassword
${BtnLogin}       id=btnLogin

*** Test Cases ***
TC_Navigate_To_URL
    Open Browser    https://opensource-demo.orangehrmlive.com/    Chrome

TC_Login
    Input Text    id=txtUsername    Admin
    Input Password    id=txtPassword    admin123
    Click Button    id=btnLogin

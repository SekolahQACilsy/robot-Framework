*** Settings ***
Library           Selenium2Library

*** Variables ***
${TxtUsername}    id=txtUsername
${TxtPassword}    id=txtPassword
${BtnLogin}       id=btnLogin
${MenuAdminModule}    id=menu_admin_viewAdminModule
${SelectUserType}    id=searchSystemUser_userType
${BtnSearch}      id=searchBtn
${AdminNationality}    id=menu_admin_nationality
${NavWelcome}     id=welcome
${LinkLogout}     xpath=//*[@id="welcome-menu"]/ul/li[2]/a
${AdminQualification}    id=menu_admin_Qualifications

*** Test Cases ***
TC_Navigate_To_URL
    Open Browser    https://opensource-demo.orangehrmlive.com/    Chrome

TC_Login
    Input Text    id=txtUsername    Admin
    Input Password    id=txtPassword    admin123
    Click Button    id=btnLogin

TC_SearchUserByType
    Click Element    ${MenuAdminModule}
    Select From List By Label    ${SelectUserType}    Admin
    Click Button    ${BtnSearch}

TC_AddNationality
    Mouse Over    ${MenuAdminModule}
    Wait Until Element Is Enabled    ${AdminNationality}
    Click Element    ${AdminNationality}
    Comment    Sleep    3s
    Wait Until Element Is Enabled    id=btnAdd
    Click Button    id=btnAdd
    Input Text    id=nationality_name    AAA Nationality
    Click Button    id=btnSave
    Sleep    3s
    Element Should Contain    id=resultTable    AAA Nationality

TC_SubMenuHover
    Wait Until Element Is Enabled    ${MenuAdminModule}
    Mouse Over    ${MenuAdminModule}
    Wait Until Element Is Enabled    ${AdminQualification}
    Mouse Over    ${AdminQualification}
    Click Element    id=menu_admin_viewEducation

TC_Logout
    Click Element    ${NavWelcome}
    Wait Until Element Is Enabled    ${LinkLogout}
    Sleep    3s
    Click Link    ${LinkLogout}

TC_CloseBrowser
    Close Browser

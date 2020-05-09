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
${tabLeave}       id=menu_leave_viewLeaveModule
${tabAssignLeave}    id=menu_leave_assignLeave
${textFieldEmployeeName}    id=assignleave_txtEmployee_empName
${listLeaveType}    id=assignleave_txtLeaveType
${LeaveFromDate}    id=assignleave_txtFromDate
${LeaveToDate}    id=assignleave_txtToDate
${listPartialDays}    id=assignleave_partialDays
${duration}       id=assignleave_firstDuration_duration
${durationDayAmpm}    id=assignleave_firstDuration_ampm
${txtComment}     id=assignleave_txtComment
${btnAssign}      id=assignBtn

*** Test Cases ***
TC_Navigate_To_URL
    Open Browser    https://opensource-demo.orangehrmlive.com/    Chrome

TC_Login
    Input Text    id=txtUsername    Admin
    Input Password    id=txtPassword    admin123
    Click Button    id=btnLogin

TC_AddNewEmployee
    Wait Until Element Is Enabled    id=menu_pim_viewPimModule
    Mouse Over    id=menu_pim_viewPimModule
    Wait Until Element Is Enabled    id=menu_pim_viewEmployeeList
    Click Element    id=menu_pim_viewEmployeeList
    Wait Until Element Is Enabled    id=btnAdd
    Click Button    id=btnAdd
    Input Text    id=firstName    John
    Input Text    id=lastName    Telo
    Input Text    id=employeeId    10011
    Choose File    id=photofile    ${CURDIR}/photo.png
    Click Button    id=btnSave

TC_SearchUserByType
    Click Element    ${MenuAdminModule}
    Select From List By Label    ${SelectUserType}    Admin
    Click Button    ${BtnSearch}

TC_AddNationalityValidation
    Mouse Over    ${MenuAdminModule}
    Wait Until Element Is Enabled    ${AdminNationality}
    Click Element    ${AdminNationality}
    Comment    Sleep    3s
    Wait Until Element Is Enabled    id=btnAdd
    Click Button    id=btnAdd
    Comment    Input Text    id=nationality_name    AAA Nationality
    Click Button    id=btnSave
    Element Attribute Value Should Be    id=nationality_name    class    formInput validation-error

TC_AddNationalitySuccess
    Input Text    id=nationality_name    AAA Nationality
    Click Button    id=btnSave
    Sleep    3s
    Element Should Contain    id=resultTable    AAA Nationality

TC_DeleteNationalitySuccess
    Wait Until Element Is Enabled    name=chkSelectRow[]
    Click Element    name=chkSelectRow[]
    Click Element    id=btnDelete
    Wait Until Element Is Enabled    id=dialogDeleteBtn
    Click Element    id=dialogDeleteBtn
    Element Should Not Contain    id=resultTable    AAA Nationality

TC_SubMenuHover
    Wait Until Element Is Enabled    ${MenuAdminModule}
    Mouse Over    ${MenuAdminModule}
    Wait Until Element Is Enabled    ${AdminQualification}
    Mouse Over    ${AdminQualification}
    Click Element    id=menu_admin_viewEducation

TC_Leave
    Wait Until Element Is Visible    ${tabLeave}
    Click Element    ${tabLeave}
    Click Element    ${tabAssignLeave}
    Wait Until Element Is Visible    ${textFieldEmployeeName}
    Input Text    ${textFieldEmployeeName}    Agus
    Comment    Click Element    ${listLeaveType}
    Select From List By Label    ${listLeaveType}    Vacation US
    Input Text    ${LeaveFromDate}    2020-05-06
    Input Text    ${LeaveToDate}    2020-05-10
    Press Keys    ${LeaveToDate}    RETURN
    Comment    Click Element    ${LeaveToDate}
    Comment    Wait Until Element Is Visible    ${listPartialDays}
    Select From List By Label    ${listPartialDays}    All Days
    Select From List By Label    ${duration}    Half Day
    Select From List By Label    ${durationDayAmpm}    Morning
    Input Text    ${txtComment}    Done
    Click Button    ${btnAssign}

TC_Logout
    Click Element    ${NavWelcome}
    Wait Until Element Is Enabled    ${LinkLogout}
    Sleep    3s
    Click Link    ${LinkLogout}

TC_CloseBrowser
    Close Browser

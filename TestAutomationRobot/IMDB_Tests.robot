*** Settings ***
Documentation     This project is created to test some functionalities on IMDB Page.
...
...               http://www.imdb.com
...
...               Tests
...
...               TC1 - IMDB Page Login Logout - Chrome
...               TC1 - IMDB Page Login Logout - IExplorer
...               TC2 - IMDB Search Functionality - Chrome
...               TC2 - IMDB Search Functionality - IExplorer
...               TC3 - IMDB Adding a film to the Watchlist- Chrome
...               TC3 - IMDB Adding a film to the Watchlist- IExplorer
...
Library           Selenium2Library

*** Variables ***
${url}            http://www.imdb.com
${email}          mineatasoy@gmail.com
${pwd}            minemine
${name}           Mine Atasoy
${filmName}       Step

*** Test Cases ***
TC1 - IMDB Page Login Logout - Chrome
    [Documentation]    This testcase is created to ensure that IMDB page login and logout functionalities work as expected for Chrome
    ...
    ...    Steps
    ...
    ...    1. Open Browser and navigate to URL: http://www.imdb.com
    ...
    ...    2. Login with a proper user
    ...
    ...    3. Verify that Login is successful
    ...
    ...    4. Logout from the page
    ...
    ...    5. Verify that logout is successful
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Login
    Sleep    5
    Page Should Contain    text=${name}
    Capture Page Screenshot
    Logout
    Page Should Not Contain    text=${name}
    Capture Page Screenshot
    Close Browser

TC1 - IMDB Page Login Logout - IExplorer
    [Documentation]    This testcase is created to ensure that IMDB page login and logout functionalities work as expected for IExplorer
    ...
    ...    Steps
    ...
    ...    1. Open Browser and navigate to URL: http://www.imdb.com
    ...
    ...    2. Login with a proper user
    ...
    ...    3. Verify that Login is successful
    ...
    ...    4. Logout from the page
    ...
    ...    5. Verify that logout is successful
    Open Browser    ${url}    ie
    Maximize Browser Window
    Login
    Sleep    5
    Page Should Contain    text=${name}
    Logout
    Page Should Not Contain    text=${name}
    Close Browser

TC2 - IMDB Search Functionality - Chrome
    [Documentation]    This testcase is created to ensure that IMDB pagesearch functionality works as expected for Chrome
    ...
    ...    Steps
    ...
    ...    1. Open Browser and navigate to URL: http://www.imdb.com
    ...
    ...    2. Insert a film name on search box and choose Titles from the list
    ...
    ...    3. Click search button
    ...
    ...    4. Verify that search result return correct value
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Search By Titles
    Page Should Contain Link    xpath=//*[@id="main"]/div/div[2]/table/tbody/tr[1]/td[2]/a    message=${filmName}
    Click Link    xpath=//*[@id="main"]/div/div[2]/table/tbody/tr[1]/td[2]/a
    Capture Page Screenshot
    Close Browser

TC2 - IMDB Search Functionality - IExplorer
    [Documentation]    This testcase is created to ensure that IMDB pagesearch functionality works as expected for IExplorer
    ...
    ...    Steps
    ...
    ...    1. Open Browser and navigate to URL: http://www.imdb.com
    ...
    ...    2. Insert a film name on search box and choose Titles from the list
    ...
    ...    3. Click search button
    ...
    ...    4. Verify that search result return correct value
    Open Browser    ${url}    ie
    Maximize Browser Window
    Search By Titles
    Page Should Contain Link    xpath=//*[@id="main"]/div/div[2]/table/tbody/tr[1]/td[2]/a    message=${filmName}
    Click Link    xpath=//*[@id="main"]/div/div[2]/table/tbody/tr[1]/td[2]/a
    Close Browser

TC3 - IMDB Adding a film to the Watchlist- Chrome
    [Documentation]    This testcase is created to ensure that a film can be added to watchlist successfully on IMDB page on Chrome.
    ...
    ...    Steps
    ...
    ...    1. Open Browser and navigate to URL: http://www.imdb.com
    ...
    ...    2. Login to the page with a proper user
    ...
    ...    3. Search the film name that you want to add to the watchlist.
    ...
    ...    4. Click \ 'Add watchlist button'
    ...
    ...    5. Open wathclist
    ...
    ...    6. Verify that the film is included in watchlist
    ...
    ...    7. Open the film detail again and click 'Remove from List'
    ...
    ...    8. Open watchlist
    ...
    ...    9. Verify that the film is not included in the list
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Login
    Search By Titles
    Click Link    xpath=//*[@id="main"]/div/div[2]/table/tbody/tr[1]/td[2]/a
    Click Element    xpath=//*[@id="title-overview-widget"]/div[2]/div[2]/div/div[2]/div[1]
    Click Link    xpath=//*[@id="navWatchlistMenu"]/p/a
    Select From List By Label    xpath=//*[@id="center-1-react"]/div/div[2]/div[1]/div[1]/div[1]/select    Date Added
    Page Should Contain Link    //*[@id="page-1"]/div/div/div[2]/h3/a    message=${filmName}
    Capture Page Screenshot
    Click Link    //*[@id="page-1"]/div/div/div[2]/h3/a
    Click Element    xpath=//*[@id="title-overview-widget"]/div[2]/div[2]/div/div[2]/div[1]
    Click Link    xpath=//*[@id="navWatchlistMenu"]/p/a
    Select From List By Label    xpath=//*[@id="center-1-react"]/div/div[2]/div[1]/div[1]/div[1]/select    Date Added
    Page Should Not Contain    text=${filmName}
    Logout
    Close Browser

TC3 - IMDB Adding a film to the Watchlist- IExplorer
    [Documentation]    This testcase is created to ensure that a film can be added to watchlist successfully on IMDB page on IExplorer
    ...
    ...    Steps
    ...
    ...    1. Open Browser and navigate to URL: http://www.imdb.com
    ...
    ...    2. Login to the page with a proper user
    ...
    ...    3. Search the film name that you want to add to the watchlist.
    ...
    ...    4. Click \ 'Add watchlist button'
    ...
    ...    5. Open wathclist
    ...
    ...    6. Verify that the film is included in watchlist
    ...
    ...    7. Open the film detail again and click 'Remove from List'
    ...
    ...    8. Open watchlist
    ...
    ...    9. Verify that the film is not included in the list
    Open Browser    ${url}    ie
    Maximize Browser Window
    Login
    Sleep    5
    Search By Titles
    Click Link    xpath=//*[@id="main"]/div/div[2]/table/tbody/tr[1]/td[2]/a
    Click Element    xpath=//*[@id="title-overview-widget"]/div[2]/div[2]/div/div[2]/div[1]
    Click Link    xpath=//*[@id="navWatchlistMenu"]/p/a
    Select From List By Label    xpath=//*[@id="center-1-react"]/div/div[2]/div[1]/div[1]/div[1]/select    Date Added
    Page Should Contain Link    //*[@id="page-1"]/div/div/div[2]/h3/a    message=${filmName}
    Click Link    //*[@id="page-1"]/div/div/div[2]/h3/a
    Click Element    xpath=//*[@id="title-overview-widget"]/div[2]/div[2]/div/div[2]/div[1]
    Click Link    xpath=//*[@id="navWatchlistMenu"]/p/a
    Comment    Select From List By Label    xpath=//*[@id="center-1-react"]/div/div[2]/div[1]/div[1]/div[1]/select    Date Added
    Page Should Not Contain    text=${filmName}
    Comment    Logout
    Close Browser

*** Keywords ***
Login
    Click Element    id=nblogin
    Click Element    xpath=//*[@id="signin-options"]/div/div/a[4]/span[2]
    Input Text    name = email    ${email}
    Input Password    id=ap_password    text=${pwd}
    Click Button    id=signInSubmit

Logout
    Mouse Over    xpath=//*[@id="navUserMenu"]/p/a
    Sleep    1
    Click Element    id=nblogout

Search By Titles
    Input Text    name=q    ${filmName}
    Select From List By Label    id=quicksearch    Titles
    Click Button    id=navbar-submit-button

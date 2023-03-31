*** Settings ***
Library    SeleniumLibrary
Variables  ./variables.py

*** Test Cases ***
Login to LinkedIn
    # Get the email and password from variables
    ${email}=    Get Variable Value    ${LINKEDIN_EMAIL}
    ${password}=    Get Variable Value    ${LINKEDIN_PASSWORD}

    # Start a new Chrome browser
    Open Browser    https://www.linkedin.com/login    chrome

    # Find the email and password fields and enter the login details
    Input Text    name=session_key    ${email}
    Input Text    name=session_password    ${password}

    # Submit the login form
    Click Button    xpath=//button[@type='submit']

    # Wait for the "Home" element to appear on the page
    Wait Until Page Contains Element    xpath=//*[@class="t-16 t-black t-bold"]   timeout=30s


*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Aller sur la page d'accès fournisseurs
    [Documentation]    Se rend sur le portail d'accès fournisseurs
    ...
    ...                - *eprocUrl*: Url du portail\n- *timeout*: délai d'attente avant erreur (défaut = 10)
    ...
    ...                Url en sortie: https://env03.ivalua.com/buyer/groupelaposte/rctmaint3/fwdm7/page.aspx/fr/usr/login
    [Arguments]    ${eprocUrl}=https://env03.ivalua.com/buyer/groupelaposte/rctmaint3/fwdm7/page.aspx/fr/usr/login
    ...            ${timeout}=15
    Open Browser    ${eprocUrl}    browser=ff
    Maximize Browser Window
    Go to    ${eprocUrl}    
    Wait Until Element Is Visible    //div[text()='ACCES FOURNISSEURS']    timeout=${timeout}

Se connecter en tant que fournisseur
    [Documentation]    Se connecte en tant que fournisseur à partir du portail d'accès fournisseurs
    ...
    ...                - *user*: utilisateur\n- *password*: mot de passe\n
    ...                - *timeout*: délai d'attente avant erreur (défaut = 10)
    ...
    ...                Url en sortie: https://env03.ivalua.com/buyer/groupelaposte/rctmaint3/fwdm7/page.aspx/fr/buy/homepage/emp
    [Arguments]    ${user}    ${password}    ${timeout}=15
    Wait Until Element Is Enabled    body_x_txtLogin    timeout=${timeout}
    Input text    body_x_txtLogin    ${user}
    Input password    body_x_txtPass    ${password}
    Click Button    body_x_btnLogin
    Wait Until Element Is Visible    //span[contains(text(), 'Bienvenue sur le portail')]    timeout=${timeout}
    Wait Until Element Is Visible    aLoginMenu    timeout=${timeout}


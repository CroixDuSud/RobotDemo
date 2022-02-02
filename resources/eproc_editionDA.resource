*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Choisir le domaine fonctionnel
    [Documentation]
    [Arguments]    ${domaineFonctionnel}    ${timeout}=10
    Wait Until Element Is Visible    //label[.='Domaine Fonctionnel']/following-sibling::div//input[@class='search']    timeout=${timeout}
    Wait Until Element Is Enabled    //label[.='Domaine Fonctionnel']/following-sibling::div//input[@class='search']    timeout=${timeout}
    Input Text    //label[.='Domaine Fonctionnel']/following-sibling::div//input[@class='search']    ${domaineFonctionnel}
    Wait Until Element Is Enabled    //label[.='Domaine Fonctionnel']/following-sibling::div//input[@class='search']/following-sibling::div//li[@class='item'][contains(.,'${domaineFonctionnel}')]    timeout=${timeout}
    Click Element    //label[.='Domaine Fonctionnel']/following-sibling::div//input[@class='search']/following-sibling::div//li[@class='item'][contains(.,'${domaineFonctionnel}')]
    Wait Until Element Is Visible    //label[.='Domaine Fonctionnel']/following-sibling::div//input[@class='search']/following-sibling::div[contains(text(), '${domaineFonctionnel}')]    timeout=${timeout}

Choisir le code projet
    [Documentation]
    [Arguments]    ${codeProjet}    ${timeout}=10
    Wait Until Element Is Visible    //label[.='Code Projet']/following-sibling::div//input[@class='search']    timeout=${timeout}
    Wait Until Element Is Enabled    //label[.='Code Projet']/following-sibling::div//input[@class='search']    timeout=${timeout}
    Input Text    //label[.='Code Projet']/following-sibling::div//input[@class='search']    ${codeProjet}
    Wait Until Element Is Enabled    //label[.='Code Projet']/following-sibling::div//input[@class='search']/following-sibling::div//li[@class='item'][contains(.,'${codeProjet}')]    timeout=${timeout}
    Click Element    //label[.='Code Projet']/following-sibling::div//input[@class='search']/following-sibling::div//li[@class='item'][contains(.,'${codeProjet}')]
    Wait Until Element Is Visible    //label[.='Code Projet']/following-sibling::div//input[@class='search']/following-sibling::div[contains(text(), '${codeProjet}')]    timeout=${timeout}

Enregister la demande d'achat
    [Documentation]
    [Arguments]    ${timeout}=60
    Wait Until Element Is Visible    proxyActionBar_x__cmdSave    timeout=${timeout}
    Wait Until Element Is Enabled    proxyActionBar_x__cmdSave    timeout=${timeout}
    Click Element    proxyActionBar_x__cmdSave
    Alert Should Be Present    Confirmez vous la réinitialisation de toutes les imputations ?    action=ACCEPT    timeout=${timeout}
    Wait Until Element Is Visible    //div[@data-criticity='success'][contains(@class, 'visible')]    timeout=${timeout}

Valider la demande d'achat
    [Documentation]
    [Arguments]    ${timeout}=90
    Wait Until Element Is Visible    //button[@aria-label='Lancer la validation de la D.A.']    timeout=${timeout}
    Wait Until Element Is Enabled    //button[@aria-label='Lancer la validation de la D.A.']    timeout=${timeout}
    Click Button    //button[@aria-label='Lancer la validation de la D.A.']
    Wait Until Element Is Visible    //div[@data-criticity='info'][contains(@class, 'visible')]//li[contains(., 'Données sauvegardées')]    timeout=${timeout}

Obtenir le numero de commande de la demande d'achat
    [Documentation]
    [Arguments]    ${timeout}=10
    Wait Until Element Is Visible    //div[@data-criticity='info'][contains(@class, 'visible')]//li[contains(., 'Données sauvegardées')]    timeout=${timeout}
    ${numeroCommandeCreee}=    Get Text    //div[@data-criticity='info'][contains(@class, 'visible')]//li[contains(., 'Une ou plusieurs commandes')]//u
    Set Suite Variable    ${numeroCommande}    ${numeroCommandeCreee}
    IF    '${numeroCommandeCreee}' == ''
        Fail    Le numéro de commande est nul
    END
    [Return]    ${numeroCommandeCreee}
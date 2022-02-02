*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Rechercher la commande par son numero
    [Documentation]
    [Arguments]    ${numeroCommande}    ${timeout}=10
    Saisir le numéro de commande    ${numeroCommande}
    Click button    body_x_prxFilterBar_x_cmdSearchBtn
    Wait Until Element Is Visible    //a[contains(@href, 'order_manage')][.='${numeroCommande}']    timeout=${timeout}

Ouvrir la commande
    [Documentation]
    [Arguments]    ${numeroCommande}    ${timeout}=10
    Wait Until Element Is Enabled    //div[contains(@class, 'image')]//a[contains(@href, 'order_manage')]    timeout=${timeout}
    Click Element    //div[contains(@class, 'image')]//a[contains(@href, 'order_manage')]
    Wait Until Element Is Visible    //h1[contains(., '${numeroCommande}')]    timeout=${timeout}

Saisir le numéro de commande
    [Documentation]
    [Arguments]    ${numeroCommande}    ${timeout}=10
    Wait Until Element Is Visible    //input[@id='body_x_txtOrdCodeCalculated']    timeout=${timeout}
    Wait Until Element Is Enabled    //input[@id='body_x_txtOrdCodeCalculated']    timeout=${timeout}
    Input Text    //input[@id='body_x_txtOrdCodeCalculated']    ${numeroCommande}
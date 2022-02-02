*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

### Action haut niveau (métier)
Aller à la page de création d'une demande d'achat
    [Documentation]
    [Arguments]
    Cliquer sur le menu    Approvisionnement    Créer DA

Aller à la page des listes des demandes
    [Documentation]
    [Arguments]
    Cliquer sur le menu    Approvisionnement    demandes

Aller à la page des listes des commandes
    [Documentation]
    [Arguments]
    Cliquer sur le menu    Approvisionnement    commandes

Aller à la page des factures à certifier
    [Documentation]
    [Arguments]
    Cliquer sur le menu    Facturation    certifier


### Action bas niveau
Cliquer sur le menu
    [Documentation]
    [Arguments]    ${nomMenu}    ${sousMenu}=None    ${timeout}=10
    Wait Until Element Is Enabled    //div[@id='header_x_headerNavBar']//span[contains(text(),'${nomMenu}')]/parent::div    timeout=${timeout}
    Wait Until Element Is Visible    //div[@id='header_x_headerNavBar']//span[contains(text(),'${nomMenu}')]/parent::div    timeout=${timeout}
    Click Element    //div[@id='header_x_headerNavBar']//span[contains(text(),'${nomMenu}')]/parent::div
    IF    '${sousMenu}' != 'None'
        Wait Until Element Is Enabled    //div[@id='header_x_headerNavBar']//span[contains(text(),'${nomMenu}')]/..//a[contains(@aria-label,'${sousMenu}')]    timeout=${timeout}
        Wait Until Element Is Visible    //div[@id='header_x_headerNavBar']//span[contains(text(),'${nomMenu}')]/..//a[contains(@aria-label,'${sousMenu}')]    timeout=${timeout}
        Click Element    //div[@id='header_x_headerNavBar']//span[contains(text(),'${nomMenu}')]/..//a[contains(@aria-label,'${sousMenu}')]
        Wait Until Element Is Visible    //h1[contains(text(), '${sousMenu}')]    timeout=${timeout}
    END
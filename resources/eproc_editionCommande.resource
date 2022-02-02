*** Settings ***
Library    SeleniumLibrary

Resource    eproc_commun.resource

*** Keywords ***

Ouvrir l'onglet validation
    [Documentation]
    [Arguments]    ${timeout}=10
    Wait Until Element Is Visible    //li[contains(., 'Validation')]    timeout=${timeout}
    Wait Until Element Is Enabled    //li[contains(., 'Validation')]    timeout=${timeout}
    Click Element    //li[contains(., 'Validation')]
    Wait Until Element Is Visible    //div[contains(text(), 'Suivi des validations')]    timeout=${timeout}

Vérifier la couleur
    Get CSS Property Value    //span[contains(text(), 'Réplication ECC')]//ancestor::div[contains(@class, 'wfl_val')]    class
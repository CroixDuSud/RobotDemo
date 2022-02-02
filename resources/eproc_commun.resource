*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Get CSS Property Value
    [Documentation]
    ...    Récupère la valeur de l'attribut CSS d'un élément localisé par son locator
    ...    
    ...    Arguments:
    ...    - locator           (string)    tout locator xpath/css/id etc, supporté par SeleniumLibrary
    ...    - attribute         (string)    nom de l'attribut CSS dont on veut retourner la valeur
    ...    
    ...    Retour:             (string)    Retourne la valeur de l'attribut ou FAIL
    ...        
    [Arguments]    ${locator}    ${attribute}
    ${css}=         Get WebElement    ${locator}
    ${prop_val}=    Call Method       ${css}    value_of_css_property    ${attribute}
    [Return]     ${prop_val}
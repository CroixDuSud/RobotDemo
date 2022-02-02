*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Rechercher le produit
    [Documentation]
    [Arguments]    ${idProduit}    ${libelleProduit}    ${timeout}=20
    Wait Until Element Is Visible    body_x_txtQuery    timeout=${timeout}
    Wait Until Element Is Enabled    body_x_txtQuery    timeout=${timeout}
    Input Text    body_x_txtQuery    ${libelleProduit}
    Click Button    body_x_prxFilterBar_x_cmdSearchBtn
    Wait Until Element Is Visible    //*[@id="body_x_grid_grd_tr_${idProduit}_btnAddBasket"]    timeout=${timeout}
    #TODO Ajouter un vérif libellé
    #Get WebElement    //*[@id="body_x_grid_grd_tr_${idProduit}_btnAddBasket"]
    #[Return]

Ajouter le produit au panier
    [Documentation]
    [Arguments]    ${idProduit}    ${qteProduit}=1    ${timeout}=20
    #Wait Until Element Is Enabled     body_x_grid_grd_tr_${idProduit}_selQty_${nbr}    timeout=${timeout}
    #Click Element    body_x_grid_grd_tr_${idProduit}_selQty_${nbr}
    Wait Until Element Is Visible    //*[@id="body_x_grid_grd_tr_${idProduit}_btnAddBasket"]    timeout=${timeout}
    Wait Until Element Is Enabled    //*[@id="body_x_grid_grd_tr_${idProduit}_btnAddBasket"]    timeout=${timeout}
    Click Button    //*[@id="body_x_grid_grd_tr_${idProduit}_btnAddBasket"]
    Wait Until Element Is Visible    //div[@id='rightPanel']//span[contains(@data-item-id,'${idProduit}')]/ancestor::div[contains(@id, 'contentView')]//input[@class='search'][@aria-label='Qté']/following-sibling::div[text()='${qteProduit}']    timeout=${timeout}

Ajouter ${qteProduit} fois le produit ${idProduit} au panier

Valider le panier
    [Documentation]
    [Arguments]    ${timeout}=30
    Wait Until Element Is Visible    //a[@aria-label='Valider le panier']    timeout=${timeout}
    Wait Until Element Is Enabled    //a[@aria-label='Valider le panier']    timeout=${timeout}
    Click Element    //a[@aria-label='Valider le panier']
    Wait Until Element Is Visible    //div[text()='Adresse de livraison']    timeout=${timeout}
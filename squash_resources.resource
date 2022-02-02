*** Settings ***
Library    SeleniumLibrary
Resource    resources/eproc_portail.resource
Resource    resources/eproc_menuNav.resource
Resource    resources/eproc_listeCommandes.resource

*** Keywords ***

Given Je suis connecté sur eproc avec les identifiants ${user} ${mdp}
    Aller sur la page d'accès fournisseurs    https://env03.ivalua.com/buyer/groupelaposte/rctmaint3/fwdm7/page.aspx/fr/usr/login
    Se connecter en tant que fournisseur    ${user}    ${mdp}

And Je consulte la liste des commandes
    Aller à la page des listes des commandes

When Je recherche un ${numCommande}
    Saisir le numéro de commande    ${numCommande}
    Rechercher la commande par son numero    ${numCommande}
Then La commande ${numCommande} est listée et je peux la consulter
    Ouvrir la commande    ${numCommande}

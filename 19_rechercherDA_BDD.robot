# Automation priority: null
# Test case importance: Low
*** Settings ***
Resource	squash_resources.resource
Library		squash_tf.TFParamService

Test Setup    Open Browser    browser=ff

*** Test Cases ***
rechercherDA_BDD
	${mdp} =	Get Test Param	DS_mdp
	${user} =	Get Test Param	DS_user
	${numCommande} =	Get Test Param	DS_numCommande

	Given Je suis connecté sur eproc avec les identifiants ${user} ${mdp}
	And Je consulte la liste des commandes
	When Je recherche un ${numCommande}
	Then La commande ${numCommande} est listée et je peux la consulter
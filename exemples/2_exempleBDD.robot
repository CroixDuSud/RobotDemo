# Automation priority: null
# Test case importance: Low
*** Settings ***
Resource	squash_resources.resource

*** Test Cases ***
exempleBDD
	Given J'ai ${somme} euros
	When Je mets ${somme} dans la machine à café
	Then j'obtiens ${nombre} café
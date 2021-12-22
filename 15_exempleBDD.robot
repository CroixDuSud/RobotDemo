# Automation priority: null
# Test case importance: Low
*** Settings ***
Resource	squash_resources.resource
Library		squash_tf.TFParamService

*** Test Cases ***
exempleBDD
	${somme} =	Get Test Param	DS_somme
	${nombre} =	Get Test Param	DS_nombre

	Given J'ai ${somme} euros
	When Je mets ${somme} dans la machine à café
	Then j'obtiens ${nombre} café
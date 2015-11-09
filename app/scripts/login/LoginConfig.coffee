'use strict'

angular.module('WissenSystem')
.config(['$stateProvider', 'App', 'USER_ROLES', 'PERMISSIONS', '$translateProvider', ($stateProvider, App, USER_ROLES, PERMISSIONS, $translateProvider)->
	


	$translateProvider.translations('EN', 
		LOGIN_MSG: 'Sing In to the panel'
	)
	.translations('ES', 
		LOGIN_MSG: 'Ingresa al panel'
	)
	.translations('FR', 
		LOGIN_MSG: 'Connectez-vous au panneau'
		PON_A_PRUEBA_TU_CONOCIMIENTO_LOGIN:'Testez Vos Connaissances'
		NOMBRE_DE_USUARIO_LOGIN:"Nom D'utilisateur"
		INGRESA_TU_NOMBRE_DE_USUARIO_LOGIN:"Entrez Votre Nom D'utilisateur"
		INGRESA_TU_PASSWORD_LOGIN:"Entrez Votre Mot De Passe"
		SOY_INVITADO_LOGIN:"Je Suis Invité"
		ENTRAR_LOGIN:'Entrer'
		OLVIDASTE_COMO_INGRESAR_LOGIN:'Vous Avez Oublié Comment Entrer'
		MODIFICAR_LOGIN:'Modifier'
		EL_SERVIDOR_LOGIN:'Le Serveur'

	)
])
'use strict'

angular.module('WissenSystem')
	.config(['$stateProvider', 'App', 'USER_ROLES', 'PERMISSIONS', '$translateProvider', ($state, USER_ROLES ,PERMISSIONS, App, $translateProvider)->

		$state
			.state('panel.examen_respuesta', { #- Estado admin.
				url: '^/examen'
				views:
					'contenido_panel':
						templateUrl: "#{App.views}examen_respuesta/examenRespuesta.tpl.html"
						controller: 'ExamenRespuestaCtrl'
				resolve: {
					resolved_user: ['AuthService', (AuthService)->
						AuthService.verificar()
					]
				}
				data: 
					pageTitle: 'Examen'
			})

		$translateProvider.translations('EN', 
			INICIO_MENU: 'Home',
		)
		.translations('ES', 
			INICIO_MENU: 'Inicio',

		)
		.translations('FR', 
			INICIO_MENU: 'Initiation',
			PANNEAU_DE_PIED_EXAMEN_RESPUESTA:'Panneau De Pied'
			GRAND_FINAL_EXAMEN_RESPUESTA:'Grand Final'
			PLAYOFFS_EXAMEN_RESPUESTA:'Playoffs'
			DÉMARRE_LANALYSE_EXAMEN_RESPUESTA:"Démarrer L'analyse"
			VOUS_VOULEZ_COMMENCER_LE_TEST_EXAMEN_RESPUESTA:'Vous Voulez Commencer Le Test'
			PAS_EXAMEN_RESPUESTA:'Pas'
			DÉMARRER_EXAMEN_RESPUESTA:'Démarrer'


		)


		return
])
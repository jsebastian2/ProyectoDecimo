'use strict'

angular.module('WissenSystem')
	.config ['$stateProvider', 'App', 'USER_ROLES', 'PERMISSIONS', '$translateProvider', ($state, App, USER_ROLES, PERMISSIONS, $translateProvider) ->

		$state
			.state('panel', { #- Estado admin.
				url: '/panel'
				views:
					'principal':
						templateUrl: "#{App.views}panel/panel.tpl.html"
						controller: 'PanelCtrl'
				resolve: { 
					resolved_user: ['AuthService', (AuthService)->
						AuthService.verificar()
					]
				}
				data: 
					pageTitle: 'WissenSystem - Bienvenido'
			})


		$translateProvider.preferredLanguage('ES');


		$translateProvider.translations('EN', 
			INICIO_MENU: 'Home'
			USERS_MENU: 'Users'
			EVENTS_MENU:'Events'
			ENTIDADES_MENU: 'Entities'
			CATEGORIAS_MENU: 'Categories'
			PREGUNTAS_MENU: 'Questions'
			EVALUACIONES_MENU:'Questions'
			IDIOMA_MENU: 'Language'
		)
		.translations('ES',
			INICIO_MENU: 'Inicio'
			EVENTS_MENU:'Eventos'
			ENTIDADES_MENU:'Entidades'
			CATEGORIAS_MENU:'Categorias'
			PREGUNTAS_MENU: 'Preguntas'
			EVALUACIONES_MENU:'Evaluaciones'
			USERS_MENU:'Usuarios'
			IDIOMA_MENU: 'Idioma'
			SELECCIONE_EVENTO: 'Selecciona el evento que deseas'
			ELIMINATORIAS: 'Eliminatorias'
			GRAN_FINAL: 'Gran final'
			INSCRITO_EN: 'Esta inscrito en:'
			EXAM_HECHOS: 'Examanes hechos'
			
		)
		.translations('FR',
			INICIO_MENU: 'Initiation'
			EVENTS_MENU:'Événements'
			ENTIDADES_MENU:'Entités'
			CATEGORIAS_MENU:'Catégories'
			PREGUNTAS_MENU: 'Questionnement'
			EVALUACIONES_MENU:'Evaluations'
			USERS_MENU:'Utilisateurs'
			IDIOMA_MENU: 'Langue'
			SELECCIONE_EVENTO: 'Choisir'
			ELIMINATORIAS: "Playoffs"
			GRAN_FINAL: 'Grand Final'
			INSCRITO_EN: 'Inscrit Dans'
			EXAM_HECHOS: 'Examanes Faits'
			SELECCIONA_EL_EVENTO_QUE_DESEAS_PANEL: "Sélectionnez L'événement Que Vous Voulez"
			EVENTOS_PANEL: 'Événements'
			ACTUAL_PANEL: 'Courant'
			ESTABLECER_COMO_EVENTO_ACTUAL_PANEL: 'Événement Actuel Set'
			PERFIL_PANEL: 'Profil'
			CONFIGURACION_PANEL: 'Configuration'
			IMAGENES_PANEL: 'Imagery'
			SALIR_PANEL: 'Laisser'
			CONSTRUCCION_PANEL: 'Travaux'

			
		)

		return
	]

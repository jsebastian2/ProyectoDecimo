angular.module('WissenSystem')

.config (['App','$stateProvider', '$translateProvider', (App, $stateProvider, $translateProvider)->
		
	$stateProvider
		.state('panel.entidades', 
			url: '^/entidades'
			views:
				'contenido_panel':
					templateUrl: "#{App.views}entidades/entidades.tpl.html"
					controller: 'EntidadesCtrl'

				data:
					pageTitle: 'Entidades'
		)



	$translateProvider.translations('EN', 
		ENTIDADES_MENU: 'Entities'
	)
	.translations('ES',
		ENTIDADES_MENU: 'Entidades'
	)
	.translations('FR',
		ENTIDADES_MENU: 'Entités'
		CREAR_NUEVO_ENTIDADES:'Créer Un Nouveau'
		NOMBRE_ENTIDADES:'Nom'
		SELECCIONAR_LÍDER_ENTIDADES:'Choisir Un Leader'
		LOGO_ENTIDADES:'Logo'
		GUARDAR_ENTIDADES:'Sauvegarder'
		CANCELAR_ENTIDADES:'Annuler'
		SEGURO_QUE_DESEA_ELIMINAR_REMOVE:'Bien Sûr, Vous Voulez Supprimer'
		ENTIDAD_REMOVE:'Entité'
		ELIMINAR_REMOVE:'Retirer'
		CANCELAR_REMOVE:'Annuler'


	)


])
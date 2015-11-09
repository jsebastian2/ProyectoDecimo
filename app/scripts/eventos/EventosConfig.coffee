angular.module('WissenSystem')

.config (['App','$stateProvider', '$translateProvider', (App, $stateProvider, $translateProvider)->
		
	$stateProvider
		.state('panel.eventos', 
			url: '^/eventos'
			views:
				'contenido_panel':
					templateUrl: "#{App.views}eventos/eventos.tpl.html"
					controller: 'EventosCtrl'

				data:
					pageTitle: 'Eventos'
		)


		.state('panel.eventos_user', 
			url: '/eventos_user'
			templateUrl: 'views/eventos/eventos_user.tpl.html'
			controller: 'EventosUserCtrl'
		)


	$translateProvider.translations('EN', 
		EVENTS_TITLE: 'Events'
		CREAR_EVENTO: 'create event '
	)
	.translations('ES',
		EVENTS_TITLE: 'Eventos'
		CREAR_EVENTO: 'create event '
	)
	.translations('ES',
		EVENTS_TITLE: 'Eventos'
		CREAR_EVENTO: 'Create event '		
		NUEVO_ENTIDADES:'Nouveau'
		NOMBRE_ENTIDADES:'Nom'
		CAMPO_OBLIGATORIO_ENTIDADES:'Champ Obligatoire'
		ALIAS_ENTIDADES:'Alias'
		DESCRIPCIÓN_ENTIDADES:'Description'
		EXAMEN_ACTUAL_ENTIDADES:'Examen actuel'
		PARA_PRUEBAS_ENTIDADES:'Test'
		PARA_LA_FINAL_ENTIDADES:'Pour Final'
		CON_PAGO_ENTIDADES:'Payer'
		PRECIO_1_ENTIDADES:'Prix 1'
		PRECIO_2_ENTIDADES:'Prix 2'
		PRECIO_3_ENTIDADES:'Prix 3'
		PRECIO_4_ENTIDADES:'Prix 4'
		EVENTO_ACTUAL_ENTIDADES:'Evénement AActuel'
		HABILITAR_CHAT_PÚBLICO_ENTIDADES:'Activer Les Conversations Publique'
		HABILITAR_CHAT_PRIVADO_ENTIDADES:'Activer Les Conversations Privées'
		USAR_IDIOMA_UNICO_ENTIDADES:'Utilisez Uniquement La Langue'
		IDIOMA_PRINCIPAL_ENTIDADES:'Accueil Langue'
		IDIOMASEXTRAS_ENTIDADES:'Langues Extras'
		GUARDAR_ENTIDADES:'Sauvegarder'
		CANCELAR_ENTIDADES:'Annuler'
		SEGURO_DESEA_ELIMINAR_EVENTO:'Bien Sûr, Vous Voulez Supprimer'
		EVENTO_EVENTO:'Evénement'
		ELIMINAR_EVENTO:'Retirer'
		CANCELAR_REMOVE_EVENTO:'Annuler'


	)




])
angular.module('WissenSystem')

.config(['$stateProvider', 'App', '$translateProvider', ($stateProvider, App, $translateProvider)->

	$stateProvider

	.state('panel.preguntas', { #- Estado admin.
				url: '^/preguntas'
				views:
					'contenido_panel':
						templateUrl: "#{App.views}preguntas/preguntas.tpl.html"
						controller: 'PreguntasCtrl'

				data: 
					pageTitle: 'Preguntas'
			})


	$translateProvider.translations('EN', 
		BUSCAR_PLACEHOLDER: 'Find',
		TIP_BTN__NUEVA_PREGUNTA: 'Create a new question'
		BTN_NUEVA_PREGUNTA: 'New question'
	)
	.translations('ES', 
		BUSCAR_PLACEHOLDER: 'Buscar',
		TIP_BTN__NUEVA_PREGUNTA: 'Crear una nueva pregunta'
		BTN_NUEVA_PREGUNTA: 'Nueva pregunta'
	)
	.translations('FR', 
		BUSCAR_PLACEHOLDER: 'Recherche'
		TIP_BTN__NUEVA_PREGUNTA: 'Créer Une Nouvelle Question'
		BTN_NUEVA_PREGUNTA: 'Une Question'
		PARA_CREAR_CUADRICULAS_O_PREGUNTAS_BASADAS_EN_UN_CONTENIDO_COMUN:"Pour Créer Des Grilles Ou Des Questions Sur La Base D'un Contenu Commun"
		NUEVO_GRUPO_PREGUNTAS:"Nouveau Groupe Questions"

		SEGURO_QUE_DESEAS_ELIMINAR:"Bien Sûr, Vous Voulez Supprimer"
		CANCELAR:"Annuler"
		ASIGNAR:"Allouer"

		PREGUNTA_EN:"Question"
		TEXTO_AYUDA:"Le Texte D'aide"
		OPCION:"Options"
		QUITAR_OPCION :"Retirer L'option"
		RESPUESTA_CORRECTA :"Bonne Réponse"

		EDITAR_EN_IDIOMAS :"Modifier En Langues"
		CONFIGURACION:"Paramètres"
		OCULTAR:"Cacher"
		DESCRIPCION:"Description"
		DURACION:"Durée"
		EN_SEGUNDOS_SOLO_PARA_LA_GRAN_FINAL:"En Quelques Secondes. Seulement Pour La Finale"
		SOLO_APLIC_SI:"Applique Seulement Si L'évaluation Est Sur Place"
		TEST:"Test"
		MULTIPLE:"Multiple"
		TEXTO:"Texte"
		LISTA:"Liste"
		ORDENAR:"Ordre"
		OPCIONES_ALEATORIAS:"Les Options Aléatoires"
		NO_IMPORTARA_EL_ORDEN_EN_QUE_ORDENE_LA_OPCIONES:"Peu Importe Les Options Afin De Commande. Toujours"
		GUARDAR_Y_CONTINUAR_EDITANDO:"Enregistrer Et Continuer L'édition"
		FINALIZAR:"Fermer"
		APLICAR :"Appliquer"


		TODAS:"Tous"
		SIN_ASIGNAR:"Non Affecté"

		SEGURO_QUE_DESEAS_ELIMINAR:"Bien Sûr, Vous Voulez Supprimer"
		PREGUNTA:"Question"
		ELIMINAR:"Retirer"
		CANCELAR:"Annuler"

		EDITAR_PREGUNTA:"Modifier La Question"
		PREVIEW:"Avant-Première"
		ELIMINAR_PREGUNTA:"Retirer Question"
		ASIGNAR_A_EXAMEN:"Attribuer Un Avis"
		NOTIFICACIONS:"Notificacions"

	)

])
angular.module('WissenSystem')

.config (['App','$stateProvider', '$translateProvider', (App, $stateProvider, $translateProvider)->
		
	$stateProvider
		.state('panel.evaluaciones', 
			url: '^/evaluaciones'
			views:
				'contenido_panel':
					templateUrl: "#{App.views}evaluaciones/evaluaciones.tpl.html"
					controller: 'EvaluacionesCtrl'

				data:
					pageTitle: 'Eventos'
		)



	$translateProvider.translations('EN', 
		ENTIDADES_TITLE: 'Test'
	)
	.translations('ES',
		ENTIDADES_TITLE: 'Evaluaciones'
	)
	.translations('FR',
		ENTIDADES_TITLE: 'Evaluations'
		CREAR_NUEVO_EVALUACION:'Créer Un Nouveau'
		NUEVA_EVALUACION:'Réévaluation'
		DESCRIPCION_EVALUACION:'Description'
		CATEGORIA_EVALUACION:'Catégorie'
		ACTUAL_EVALUACION:'Courant'
		SERA_LA_EVALUACION_EVALUACION:"L'évaluation Sera"
		DURACION_POR_PREGUNTAS_EVALUACION:'Durée Pour Les Questions'
		DURACION_POR_EXAMEN_EVALUACION:"Durée De L'examen"
		DURACION_POR_PREGUNTA_EVALUACION:'Durée Par Question'
		RESPONDER_UNA_POR_UNA_EVALUACION:'Répondre Une Par Une'
		RESPONDER_UNA_POR_UNA_O_TODAS_LAS_PREGUNTAS_EVALUACION: ' Répondre Une Par Une Ou Toutes Les Questions'
		CANCELAR_EVALUACION:'Annuler'
		GUARDAR_EVALUACION:'Sauvegarder'
		SEGURO_QUE_DESEA_ELIMINAR_REMOVE_EVALUACIONES:'Bien sûr, vous voulez supprimer'
		ELIMINAR_REMOVE_EVALUACIONES:'Retirer'
		CANCELAR:'Annuler'

	)



])
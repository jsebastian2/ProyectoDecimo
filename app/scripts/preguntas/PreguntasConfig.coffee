angular.module('WissenSystem')

.config(['$stateProvider', 'App', ($stateProvider, App)->

	$stateProvider

	.state('panel.preguntas', { #- Estado admin.
				url: '^/preguntas_malas'
				views:
					'contenido_panel':
						templateUrl: "#{App.views}preguntas/preguntas.tpl.html"
						controller: 'PreguntasCtrl'

				data: 
					pageTitle: 'Preguntitas'
			})


])
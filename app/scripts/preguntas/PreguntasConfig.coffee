angular.module('WissenSystem')

.config(['$stateProvider', 'App', ($stateProvider, App)->

	$stateProvider

	.state('preguntas', { #- Estado admin.
				url: '/preguntas_malas'
				views:
					'principal':
						templateUrl: "#{App.views}preguntas/preguntas.tpl.html"
						controller: 'PreguntasCtrl'

				data: 
					pageTitle: 'Preguntitas'
			})


])
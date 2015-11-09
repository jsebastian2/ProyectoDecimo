angular.module('WissenSystem')

.directive('iniciarDir',['App', (App)->

	restrict: 'E'
	templaterUrl: "#{App.views}examen_respuestas/iniciarDir.tpl.html"
	scope:
		eventoactual: "="
		user: "="

		link:(scope, iElem, iAttrs)->
		#debo agregar la clase.loading-inactive para que desaparezca el loader de la pantalla
		#y eso lo puedo hacer el ng.if

		controller:'IniciarCtrl'
])
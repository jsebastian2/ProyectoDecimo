angular.module('WissenSystem')

.directive('gridEvaluaciones',['App', (App)->

	restrict: 'E'
	templaterUrl: "#{App.views}evaluaciones/gridEvaluaciones.tpl.html"

	scope:
		currenteval: "="
		evaluaciones: "="
		categoriasking: "="
		idioma: "="

		link:(scope, iElem, iAttrs)->
		# debo agregar la clase.loading-inactive para que desaparezca el loader de la pantalla
		# y eso lo puedo hacer el ng.if

		controller:'IniciarCtrl'


])
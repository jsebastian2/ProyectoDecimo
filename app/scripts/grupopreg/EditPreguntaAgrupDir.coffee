angular.module('WissenSystem')

.directive('editPreguntaAgrupada',['App', (App)->

	restrict: 'E'
	templateUrl: "#{App.views}grupopreg/editPreguntaAgrupDir.tpl.html"
	scope:
		pregagrup: "="

	link: (scope, iElem, iAttrs)->
		#
		#

	controller: 'EditPreguntaAgrupCtrl'
	

])
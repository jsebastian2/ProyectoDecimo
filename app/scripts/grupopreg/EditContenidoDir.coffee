angular.module('WissenSystem')

.directive('editContenido',['App', (App)->

	restrict: 'E'
	templateUrl: "#{App.views}grupopreg/editContenidoDir.tpl.html"
	scope:
		grupoking: "="
		indice: "="
		eventoactual: "="
		idiomaactualselect: "="

	link: (scope, iElem, iAttrs)->
		#agregar
		#ng-if

	controller: 'EditContenidoCtrl'
	

])
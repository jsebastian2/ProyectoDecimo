angular.module('WissenSystem')

.directive('gridUsuarios',['App', (App)->

	restrict: 'E'
	templateUrl: "#{App.views}usuarios/gridUsuariosDir.tpl.html"
	
	scope:
		usuarios: "="
		categoriasking: "="
		currentusers: "="
		nivelesking: "="
		idioma: "="

	link: (scope, iElem, iAttrs)->
		#agregar
		#ng-if

	controller: 'GridUsuariosDir'
	

])
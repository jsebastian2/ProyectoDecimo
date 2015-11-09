angular.module('WissenSystem')

.directive('viewGrupo',['App', (App)->

	restrict: 'E'
	templateUrl: "#{App.views}grupopreg/viewGrupoDir.tpl.html"
	scope:
		idiomapreg: "="
		preguntagrupo: "="
		indice: "="
		eventoactual: "="
		idiomaactualselect: "="
		evaluaciones: "="
		
	link: (scope, iElem, iAttrs)->
		#
		#

	controller: 'ViewGrupoCtrl'
	

])
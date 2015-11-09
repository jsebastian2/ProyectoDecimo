angular.module('WissenSystem')

.directive('preguntaGrupo',['App', (App)->

	restrict: 'E'
	templateUrl: "#{App.views}grupopreg/PreguntaGrupoDir.tpl.html"
	scope:
		idiomapreg: "="
		preguntagrupo: "="
		indice: "="
		eventoactual: "="
		
	link: (scope, iElem, iAttrs)->
		#
		#

	controller: 'PreguntaGrupoCtrl'
	

])
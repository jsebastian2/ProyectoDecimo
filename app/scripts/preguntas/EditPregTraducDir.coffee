angular.module('WissenSystem')

.directive('addPregunta',['App', (App)-> 

	restrict: 'E'
	templateUrl: "#{App.views}preguntas/editrPregTraducDir.tpl.html"
	scope: 
		preguntatraduc: "="
		preguntaking:"="
		eventoactual:"="
		
	link: (scope, iElem, iAttrs)->
		# Debo agregar la clase .loading-inactive para que desaparezca el loader de la pantalla.
		# y eso lo puedo hacer con el ng-if

	controller: 'EditPregTraducDirCtrl'
		

])


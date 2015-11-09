angular.module('WissenSystem')

.controller('ViewPreguntasExamenCtrl', ['$scope', 'Restangular', 'toastr', '$filter', 'AuthService', '$state', '$modal', 'App', ($scope, Restangular, toastr, $filter, AuthService, $state, $modal, App)->

	$scope.USER = $scope.$parent.USER

	$scope.idioma = $scope.USER.idioma_maiin_id


	$scope.elegirOpcion = (pregunta, opcion)->
		angular.forEach pregunta.opciones, (opt)->
			opt.elegida = false

		opcion.elegida= true



		$scope.indexChar = (index)->
		return String.fromCharCode(65 + index)




])


.directive('viewPreguntaExamen', ['App', (App)->

	restric: 'E'
	templateUrl: "#{App.views}examen_respuesta/ViewPreguntaExamenDir.tpl.html"
	scope:
		grupoking:"="

	link:(scope, iElem, iAttrs)->
		#Debo agregar la clase.loading-inactive para que desaparezca el loader de la
		#y eso lo puedo hacer con el ng-if

	controller:'ViewPreguntaExamenCtrl'


	])
angular.module('WissenSystem')

.controller('ExamenRespuestaCtrl', ['$scope', '$http', 'toastr', '$state', '$rootScope', 'Restangular', '$filter', ($scope, $http, toastr, $state, $rootScope, Restangular, $filter)->

	$scope.USER = resolved_user
	$scope.imagesPath = App.images


	$scope.cambiarTema('theme-one')


	if !$rootScope.examen_actual
		console.log 'No hay examen'

	$scope.$on '$destroy', ()->
		console.log 'En destruccion'
		window.onbeforeunload = undefined

	$scope.categoria_traducida = $filter('categoriaTraducidas')([$rootScope.examen_actual])
	if $scope.categoria_traducida.legth > 0
		$scope.categoria_traducida = $scope.categoria_traducida[0]
	console.log 'categoria_traducida', $scope.categoria_traducida



])

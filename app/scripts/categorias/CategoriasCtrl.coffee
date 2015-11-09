angular.module('WissenSystem')

.controller('CategoriasCtrl', ['$scope', 'Restangular', 'toastr',  ($scope, Restangular, toastr)->


	$scope.comprobar_evento_actual = ()->
		if $scope.evento_actual

			if $scope.evento_actual.idioma_principal_id

				$scope.idiomaPreg = {
					selected: $scope.evento_actual.idioma_principal_id
				}
		else
			toastr.warning 'Primero debes crear o selecionar un evento actual'

	$scope.comprobar_evento_actual()

	$scope.$on 'cambio_evento_user', ()->
		$scope.comprobar_evento_actual()

	$scope.$on 'cambio_evento_actual', ()->
		$scope.comprobar_evento_actual()

])
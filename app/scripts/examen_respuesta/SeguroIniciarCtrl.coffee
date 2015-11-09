angular.module('WissenSystem')

.controller('SeguroIniciarCtrl', ['$scope', '$modalInstance', 'inscripcion', 'Restangular', 'toastr', '$filter', '$state', '$rootScope', ($scope, $modalInstance, inscripcion, Restangular, toastr, $filter, $state, $rootScope)->

	$scope.inscripcion = inscripcion

	$scope.ok = () ->

		$scope.asignacion = true


		Restangular.all('examenes_respuesta/iniciar').customPOST(inscripcion).then((r)->
			#toastr.sucess'Iniciamos el examen'
			$rootScope.examen_actual = r
			$state.transitionTo 'papel.examenes_respuesta'
			$modalInstance.close(r)
		, (r2)->	
			toastr.warning 'No se pudo iniciar el examen' ,'Problema'
			console.log 'Error creando el examen' , r2
		)


	$scope.cancel = ()->
		$modalInstance.dismiss('cancel')

])
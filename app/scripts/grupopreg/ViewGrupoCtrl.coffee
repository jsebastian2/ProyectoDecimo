angular.module('WissenSystem')

.controller('EditPreguntaAgrupCtrl' , ['$scope', '$http', 'Restangular', '$state', '$cookies', 'App', '$modal', '$filter', '$rootScope', 'toaster', 
	($scope, App, $modal, $filter, $http, Restangular, $state, $cookies, $rootScope, $toastr) ->
		"""
		$scope
		$scope
		"""

		$scope.creando = false

		$scope.addNewPregunta = (contenido)->

			$scope.creando = true

			Restangular.one('preguntas_agrupadas/stores').customPOST({contenido_id: contenido.id}).then((r)->
				r.editando = true
				$scope.creando = false
				contenido.preguntas_agrupadas.push r
				console.log 'Pregunta añadida: ', contenido

			(r2)->
				console.log 'Rechazada la nueva', r2
				$scope.creando = false
				toastr.warning 'No se creo pregunta', 'Problema'
			)

		$scope.asignarEvaluacion = (grupoking)->
			modalInstance = $modal.open({
				templateUrl: App.views + 'grupopreg/asignarGrupo.tpl.html'
				controller: 'AsignarGrupoCtrl'
				resolve:
					pregunta: ()->
						grupoking
					evaluaciones: ()->
						$scope.evaluaciones	
			})
			modalInstance.result.then( (elem)->
				#scope.$emit 'preguntaAsignada', elem
				console.log 'resultado del modal: ', elem

			)


		$scope.toggleMostrarAyuda = (pregunta)->
			pregunta.mostar_ayuda = !pregunta.mostar_ayuda


		$scope.indexChar = (index)->
			return String.fromCharCode(65 + index)

		$scope.editarGrupo = (grupoking)->
			grupoking.editando = true


		$scope.eliminarContenido = (grupoking)->

			modalInstance = $modal.open({
				templateUrl: App.views + 'grupopreg/removeGrupo.tpl.html'
				controller: 'removeGrupoCtrl'
				resolve:
					grupoking: ()->
						grupoking
			})
			modalInstance.result.then( (elem)->
				$scope.$emit 'grupoeliminado', elem
				console.log 'resultado del modal' , elem
			)


		$scope.EditPreguntaAgrup = (grupoking)->
			grupoking.editando = true



		$scope.eliminarPreguntaAgrup = (preg_agrup, contenido)->

			modalInstance = $modal.open({
				templateUrl: App.views + 'grupopreg/removePreguntaAgrup.tpl.html'
				controller:'removePreguntaAgrupctrl'
				resolve:
					preg_agrup: ()->
						preg_agrup
			})
			modalInstance.result.then( (elem)->
				$scope.$emit 'pregAgrupEliminada', elem
				console.log 'resultado del modal: ', preg_agrup.id, $filter('filter')(contenido.preguntas_agrupadas, {id: '!' + preg_agrup.id})
				contenido.preguntas_agrupadas = $filter('filter')(contenido.preguntas_agrupadas, {id: '!' + preg_agrup.id})
			)


		$scope.previewPreguntaAgroup = (preg_agrup) ->

			preg_agrup.showDetail = !preg_agrup.showDetail



	]
)



.controller('removeGrupoCtrl', ['$scope', '$modalInstance', 'grupoking', 'Restangular', 'toastr',($scope, $modalInstance, grupoking, Restangular, toastr)->
	$scope.grupoking = grupoking

	$scope.ok = ()->

		Restangular.all('grupo_preguntas/destroy/' + grupoking.id).remove().then((r)->
			toaster.success 'pregunta eliminada con exito.', 'Eliminada'
		, (r2)->
			toastr.warning 'No se pudo eliminar la grupoking.', 'Problema'
			console.log 'Error eliminando grupoking: ' , r2
		)
		$modalInstance.close(grupoking)

	$scope.cancel = ()->
		$modalInstance.dismiss('cancel')
	])




.controller('removePreguntaAgrupCtrl', ['$scope', '$modalInstance', 'preg_agrup', 'Restangular', 'toastr', '$filter',($scope, $modalInstance, preg_agrup, Restangular, toastr, $filter)->
	$scope.preg_agrup = preg_agrup

	$scope.ok = ()->

		Restangular.all('preguntas_agrupadas/destroy/'+preg_agrup.id).remove().then((r)->
			toastr.success 'pregunta eliminada con exito', 'eliminada'
		, (r2)->
			toastr.warning 'No se pudo eliminar la preg_agrup', 'Problema'
			console.log 'Error eliminando preg_agrup: ', r2
		)
		$modalInstance.close(preg_agrup)

	$scope.cancel = ()->
		$modalInstance.dismiss('cancel')

])

.controller('AsignarGrupoCtrl', ['$scope', '$modalInstance', 'pregunta', 'evaluaciones','Restangular', 'toastr', '$filter',($scope, $modalInstance, pregunta, evaluaciones, Restangular, toastr, $filter)->
	$scope.pregunta = pregunta
	$scope.evaluaciones = evaluaciones
	$scope.asignacion = false
	$scope.selected = false

	$scope.ok = ()->

		$scope.asignando =  true

		datos =
			grupo_pregs_id: pregunta.id
			evaluaciones_id: $scope.selected

		Restangular.all('pregunta_evaluaciones/asignar-grupo').customPUT(datos).then((R)->
			toastr.success 'grupo asigando con exito.'
			$scope.asignando = false

			evalue = $filter('filter')(evaluaciones, {id: $scope.selected}) [0]
			$scope.preguntas_evaluacion.push r 

			$modalInstance.close(r)
		, (r2)->
			toastr.warning 'No se pudo asignar el grupo', 'Problema'
			console.log 'Error asignando el grupo: ' , r2
			$scope.asignado = false
		)


	$scope.cancel = ()->
		$modalInstance.dismiss('cancel')

])

		


	




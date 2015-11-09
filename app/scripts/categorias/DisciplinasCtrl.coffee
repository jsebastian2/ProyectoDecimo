angular.module('WissenSystem')

.controller('DisciplinasCtrl', ['$scope', 'Restangular', 'toastr', '$filter', 'AuthService', '$state', '$modal', 'App', ($scope, Restangular, toastr, $filter, AuthService, $state, $modal, App)->


	$scope.creado = false


	$scope.disciplinasking = []

	$scope.traer_disciplinas = ()->
		Restangular.all('disciplinas/disciplinas-usuarios').getList().then((r)->
			$scope.disciplinasking = r
			#console.log 'Disciplinas traidas: ' , 'r'
		, (r2)->
			toastr.warning 'No  se trajeron las disciplinas', 'Problema'
			console.log ' No se trajeron disciplinas', r2
		)
	$scope.traer_disciplinas()

	$scope.$on 'cambio_evento_user', ()->
		$scope.traer_disciplinas()



	$scope.crear_disciplina = () ->
		$scope.creando = true

		Restangular.one ('disciplinas/store').custom.POST().then((r)->
			r.editando = true 
			$scope.disciplinasking.push r2
			$scope.creando = false
			console.log 'Disciplinas creadas' , r 
		, (r2)->
			toastr.warning 'No se creo la disciplina' , 'Problema'
			console.log 'No se creo disciplinas'
			$scope.creando = false
		)


	$scope.cerrar_edicion = (disciplinaking)->
		disciplinaking.editando = false


	$scope.editarCategoria = (disciplinaking)->
		disciplinaking.editando = true


	$scope.eliminarCategoria = (disciplinaking)->

		modalInstance = $modal.open({
			tempalteUrl: App.views + 'disciplinas/removeDisciplina.tpl.html'
			controller: 'removeCategoriaCtrl'
			resolve:
				elemento: ()->
					disciplinaking
		})
		modalInstance.result.then( (elem)->
			$scope.disciplinasking = $filter('filter')($scope.disciplinas_king, {id: '!'+elem.id})
			console.log 'Resultado del modal: ', elem
		)


	$scope.finalizar_edicion = (disciplinaking)->
		$scope.guardando(disciplinaking)
		disciplinaking.editando = false

	$scope.guardando = (disciplinaking)->
		Restangular.all('disciplinas/guardar').customPut(disciplinaking).then((r)->
			toastr.success 'Disciplina guardada: '
			console.log  'Disciplina guardada', r
		, (r2)->
			toastr.warning 'No se pudo  guardar la disciplina', 'Problema'
			console.log 'no se pudo guardar', r2
		)


])



.controller('RemoveDisciplinaCtrl', ['$scope', '$modalInstance', 'elemento', 'Restangular', 'toastr', ($scope, $modalInstance, elemento, Restangular, toastr)-> 
	$scope.elemento = elemento
	console.log 'elemento', elemento

	$scope.ok = ()->

		Restangular.all('disciplinas/destroy').customDELETE(elemento.id).then((r)->
			toastr.success 'Disciplina eliminada exitosamente', 'eliminado'
			$modalInstance.close(elemento)
		, (r2)->
			toastr.warning 'No se puedo eliminar', 'Problema'
			console.log 'error eliminando', r2
			$modalInstance.dismiss('Error')
		)


	$scope.cancel = ()->
		$modalInstance.dismiss('cancel')

])
angular.module('WissenSystem')

.controller('NivelesCtrl', ['$scope', 'Restangular', 'toastr', '$filter', 'AuthService', '$state', '$modal', 'App', ($scope, Restangular, toastr, $filter, AuthService, $state, $modal, App)->


	$scope.creado = false


	$scope.disciplinasking = []

	$scope.traer_disciplinas = ()->
		Restangular.all('nivel/nivel-usuarios').getList().then((r)->
			$scope.niveles_king = r
			#console.log 'niveles traidos: ' , 'r'
		, (r2)->
			toastr.warning 'No  se trajeron los niveles', 'Problema'
			console.log ' No se trajeron los niveles', r2
		)
	$scope.traer_disciplinas()

	$scope.$on 'cambio_evento_user', ()->
		$scope.traer_disciplinas()



	$scope.crear_disciplina = () ->
		$scope.creando = true

		Restangular.one ('nivel/store').custom.POST().then((r)->
			r.editando = true 
			$scope.niveles_king.push r2
			$scope.creando = false
			console.log 'Niveles creados' , r 
		, (r2)->
			toastr.warning 'No se creo el nivel' , 'Problema'
			console.log 'No se creo nivel'
			$scope.creando = false
		)


	$scope.cerrar_edicion = (nivelking)->
		nivelking.editando = false


	$scope.editarCategoria = (nivelking)->
		nivelking.editando = true


	$scope.eliminarCategoria = (nivelking)->

		modalInstance = $modal.open({
			tempalteUrl: App.views + 'niveles/removeNiveles.tpl.html'
			controller: 'removeCategoriaCtrl'
			resolve:
				elemento: ()->
					nivelking
		})
		modalInstance.result.then( (elem)->
			$scope.niveles_king = $filter('filter')($scope.niveles_king, {id: '!'+elem.id})
			console.log 'Resultado del modal: ', elem
		)


	$scope.finalizar_edicion = (nivelking)->
		$scope.guardando(nivelking)
		nivelking.editando = false

	$scope.guardando = (nivelking)->
		Restangular.all('niveles/guardar').customPut(nivelking).then((r)->
			toastr.success 'nivel guardado: '
			console.log  'nivel guardadp', r
		, (r2)->
			toastr.warning 'No se pudo  guardar el nivel', 'Problema'
			console.log 'no se pudo guardar', r2
		)


])



.controller('RemoveNivelCtrl', ['$scope', '$modalInstance', 'elemento', 'Restangular', 'toastr', ($scope, $modalInstance, elemento, Restangular, toastr)-> 
	$scope.elemento = elemento
	console.log 'elemento', elemento

	$scope.ok = ()->

		Restangular.all('niveles/destroy').customDELETE(elemento.id).then((r)->
			toastr.success 'nivel eliminado exitosamente', 'eliminado'
			$modalInstance.close(elemento)
		, (r2)->
			toastr.warning 'No se puedo eliminar', 'Problema'
			console.log 'error eliminando', r2
			$modalInstance.dismiss('Error')
		)


	$scope.cancel = ()->
		$modalInstance.dismiss('cancel')

])
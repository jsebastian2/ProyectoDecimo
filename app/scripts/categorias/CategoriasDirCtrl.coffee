angular.module('WissenSystem')

.controller('CategoriasCtrl', ['$scope', 'Restangular', 'toastr', '$filter', 'AuthService', '$state', '$modal', 'App', ($scope, Restangular, toastr, $filter, AuthService, $state, $modal, App)->



	$scope.creado = false

	$scope.categorias_king = []


	$scope.traer_categorias = ()->
		Restangular.all('categorias/categorias-usuarios').getList().then((r)->
			$scope.categorias_king = r
			#console.log 'Categorias traidas: ' , 'r'
		, (r2)->
			toastr.warning 'No  se trajeron las categorias', 'Problema'
			console.log ' No se trajeron categorias', r2
		)
	$scope.traer_categorias()

	$scope.$on 'cambio_evento_user', ()->
		$scope.traer_categorias()



	$scope.crear_categoria = () ->
		$scope.creando = true

		Restangular.one ('categorias/store').custom.POST().then((r)->
			r.editando = true 
			$scope.categorias_king.push r2
			$scope.creando = false
			console.log 'Categorias' , r 
		, (r2)->
			toastr.warning 'No se creo la categoria' , 'Problema'
			console.log 'No se creo categorias'
			$scope.creando = false
		)


	$scope.cerrar_edicion = (categoriaking)->
		categoriaking.editando = false


	$scope.editarCategoria = (categoriaking)->
		categoriaking.editando = true


	$scope.eliminarCategoria = (categoriaking)->

		modalInstance = $modal.open({
			tempalteUrl: App.views + 'categorias/removeCategoria.tpl.html'
			controller: 'RemoveCategoriaCtrl'
			resolve:
				elemento: ()->
					categoriaking
		})
		modalInstance.result.then( (elem)->
			$scope.categorias_king = $filter('filter')($scope.categorias_king, {id: '!'+elem.id})
			console.log 'Resultado del modal: ', elem
		)


	$scope.finalizar_edicion = (categoriaking)->
		$scope.guardando(categoriaking)
		categoriaking.editando = false

	$scope.guardando = (categoriaking)->
		Restangular.all('categorias/guardar').customPut(categoriaking).then((r)->
			toastr.success 'Categoria guardada: '
			console.log  'Categoria guardada', r
		, (r2)->
			toastr.warning 'No se pudo  guardar la categoria', 'Problema'
			console.log 'no se pudo guardar', r2
		)


])



.controller('RemoveCategoriaCtrl', ['$scope', '$modalInstance', 'elemento', 'Restangular', 'toastr', ($scope, $modalInstance, elemento, Restangular, toastr)-> 
	$scope.elemento = elemento
	console.log 'elemento', elemento

	$scope.ok = ()->

		Restangular.all('categorias/destroy').customDELETE(elemento.id).then((r)->
			toastr.success 'categoria eliminada exitosamente', 'eliminado'
			$modalInstance.close(elemento)
		, (r2)->
			toastr.warning 'No se puedo eliminar', 'Problema'
			console.log 'error eliminando', r2
			$modalInstance.dismiss('Error')
		)


	$scope.cancel = ()->
		$modalInstance.dismiss('cancel')

])
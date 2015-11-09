angular.module('WissenSystem')
.controller('EntidadesCtrl', ['$scope', 'Restangular', 'uiGridConstants', 'App', 'toastr', ($scope, Restangular, uiGridConstants, App, toastr)->


	$scope.imgSystemPath = App.imgSystemPath
	$scope.perfilPath = App.perfilPath
	$scope.creando = true
	$scope.editando = true

	$scope.imagenes = [
		{
			id: 1
			nombre: 'gato-dormido-ordenador.jpg'
			public: true
		}
		{
			id:2
			nombre: 'gato-dormido-ordenador.jpg'
			public: true
		}
	]


	btGrid1 = '<a tooltip="Editar" tooltip-placement="left" class="bnt bnt-default bnt-xs shiny icon-only info" ng-click="grid.apppScope.editar(row.entity)"><i class="fa fa-edit "></i></a>'
	btGrid2 = '<a tooltip="X Eliminar" tooltip-placement="ringht" class="btn btn-default btn-xs shiny icon-only danger" ng-click="grid.appScope.eliminar(row.entity)"><i class="fa fa-trash"></i></a>'


	$scope.gridOptions =
		showGridFooter: true,
		enableSorting: true,
		enableFiltering: true,
		enableGridColumnMenu: false,
		columnDefs: [
			{ field: 'id', displayName:'Id', width: 50, enableCellEdit: false, enableColumnMenu: false}
			{ name: 'edit', displayName:'Edit', width: 60, enableSorting: false, enableFiltering: false, cellTemplate: btGrid1 + btGrid2, enableCellEdit: false, enableColumnMenu: false}
			{ field: 'nombre', filter: {condition: uiGridConstants.filter.CONTAINS}, enableHiding: false }
			{ field: 'alias', width: 70, filter: { condition: uiGridConstants.filter.CONTAINS }, displayName: 'Alias'}
			{ field: 'lider', filter: { condition: uiGridConstants.filter.CONTAINS }}
		],
		multiSelect: false,
		#....
		onRegisterApi: ( gridApi ) ->
			$scope.gridApi = gridApi
			gridApi.edit.on.afterCellEdit($scope, (rowEntity, colDef, newValue, oldValue)->
				console.log 'Fila editada, ', rowEntity, ' Column:', colDef, ' newValue:' + newValue + ' oldValue:' + oldValue ;

				if newValue != oldValue
					Restangular.one('entidades/update', rowEntity.id).customPUT(rowEntity).then((r)->
						$scope.toastr.success 'Entidad Actualizada con éxito', 'Actualizado'
					, (r2)->
						$scope.toastr.error 'Cambio no guardado', 'Error'
						console.log 'Fallo al intentar guardar: ', r2
					)
				$scope.$apply()
			)


	Restangular.all('entidades').getList().then((data)->
		$scope.gridOptions.data = data;
	)


	$scope.editar = ()->
		$scope.creando = false
		$scope.editando = true
		$scope.currentEntidad = entidad
		console.log entidad, $scope.guardando, $scope.editando

	$scope.eliminar = (entidad)->
		modalInstance = $modal.open({
			templateUrl: App.view + 'eventos/removeEvento.tpl.html'
			controller: 'RemoveEntidadCtrl'
			resolve:
				elemento: ()->
					entidad
		})
		modalInstance.result.then( (elem)->
			$scope.gridOptions.data = $filter('filter')($scope.gridOptions.data, {id: '!'+elem.id})
			console.log 'Resultado del modal: ', elem
		)


	$scope.crearNuevo = ()->
		$scope.creando = true
		$scope.editando = false

	$scope.cancelarNuevo = ()->
		$scope.creando = false
		$scope.guardando = false

	$scope.cancelarEdit = ()->
		$scope.editando = false

	$scope.guardando = false
	$scope.guardarNuevo = ()->
		$scope.guardando = true

		Restangular.one('entidades/store').customPOST($scope.newEntidades).then((r)->
			console.log('Entidad guardando', r)
			$scope.gridOptions.data.push r 
			$scope.guardando = false
			$scope.creando = false
			toastr.success 'Enti guardar con exito', 'Creado'

			#Reiniciamos las variables del nuevo entidad
			$scope.newEntidad = {
				nombre: ''
				lider_nombre: ''
			}
		, (r2)->
			console.log('No se pudo guardar el entidad' , r2)
			toastr.warning 'No se pudo crear entidad.' , 'Problema'
			$scope.guardando = false
		)


	$scope.guardando_cambios = false
	$scope.guardar_cambios = ()->
		$scope.guardando_cambios = true

		Restangular.one('entidades/update').customPUT($scope.currentEntidad).then((r)->

			$scope.guardando_cambios = true
			$scope.editando = false 
			toastr ' Entidadguardada con exito', 'Creando'

			#Reiniciamoslas variablesd de nuevo
			$scope.newEntidad = {
				nombre: ''
				lider_nombre:''
			}
		, (r2)->
			console.log('No se pudo guardar entidad', r2)
			toastr.warning 'No se pudo crear entidad', 'Problema'
			$scope.guardando_cambios = false
		)



	return

])



.controller('RemoveEntidadCtrl', ['$scope', '$modalInstance', 'elemento', 'Restangular', 'toastr',($scope, $modalInstance, elemento, Restangular, toastr)->
	$scope.elemento = elemento

	$scope.ok = ()->

		Restangular.all('entidades/destroy').customDELETE(elemento.id).then((r)->
			toastr.success 'Entidades eliminanda con exito', 'eliminanda'
			$modalInstance.close(elemento)
		, (r2)->
			toastr.warning 'No se pudo eliminar', 'Problema'
			console.log 'Error eliminando elemento', r2
			$modalInstance.dimiss('cancel')
		)


	$scope.cancel = ()->
		$modalInstance.dimiss('cancel')

])
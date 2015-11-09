angular.module('WissenSystem')
.controller('GridEvaluacionesCtrl', ['$scope', 'Restangular', 'uiGridConstants', 'App', 'toastr', '$filter', '$modal', ($scope, Restangular, uiGridConstants, App, toastr, $filter, $modal)->



	btGrid1 = '<a tooltip="Editar" tooltip-placement="left" class="bnt bnt-default bnt-xs shiny icon-only info" ng-click="grid.apppScope.editar(row.entity)"><i class="fa fa-edit "></i></a>';
	btGrid2 = '<a tooltip="X Eliminar" tooltip-placement="ringht" class="btn btn-default btn-xs shiny icon-only danger" ng-click="grid.appScope.eliminar(row.entity)"><i class="fa fa-trash"></i></a>';
	cellcateg = '<span ng-bind="row.entity.categoria_id | nombreCategoria:grid.appScope.categoriasking:grid.appScope.idioma"></span>'
	cellactual = '<md-checkbox ng-true-value="1" ng-false-value="0" ng-model="row.entity.actual" ng-change="grid.appScope.setActual(row.entity)" arial-label="Actual" ng-disable="row.entity.actualizando" style="margin-top: 0px;">Actual</md-checkbox>'

	$scope.gridOptions = 
		showGridFooter: true,
		enableSorting: true,
		enableFiltering: true,
		enableGridColumnMenu: false,
		columnDefs: [
			{ field: 'id', displayName: 'Id', width: 60, enableCellEdit: false, enableColumnMenu: false }
			{ name: 'edit', displayName: 'Edit', width: 80, enableSorting: false, enableFiltering: false, cellTemplate: btGrid1 + btGrid2, enableCellEdit: false, enableColumnMenu: false }
			{ field: 'descripcion', displayName:'Descripcion', filter: {condition: uiGridConstants.filter.CONTAINS}, enableHiding: false }
			{ field: 'categoria_id', displayName:'Categoria', filter: { condition: uiGridConstants.filter.CONTAINS }, cellTemplate: cellcateg, enableCellEdit: false}
			{ field: 'actual', displayName:'Actual', width: 90, filter: { condition: uiGridConstants.filter.CONTAINS }, cellTemplate: cellactual, enableCellEdit: false}
		],
		multiSelect: false,
		#
		onRegisterApi: ( gridApi )->
			$scope.gridApi = gridApi
			gridApi.edit.on.afterCellEdit($scope, (row, colDef, NewValue, oldValue)->
				console.log 'Fila editada, ', rowEntity, 'Column', colDef, 'NewValue:' + NewValue + 'oldValue:' + oldValue ;
				
				if NewValue != oldValue 
					Restangular.one('evaluaciones/update').customPUT(rowEntity).then((r)->
						toastr.success 'Evaluaciones actualizadas con exito', 'actualizada'
					, (r2)->
						toastr.error 'Cambio no guardado', 'Error'
						console.log 'Fallo al intentar guardar:', r2					
					)
				$scope.$apply()		
			)


	Restangular.all('evaluaciones').getList().then((data)->
		$scope.evaluaciones = data
		$scope.gridOptions.data = $scope.evaluaciones;
	)


	$scope.setActual = (row)->
		row.actualizando = true
		console.log row

		Restangular.one('evaluaciones/set-actual').customPUT(row).then((r)->
			toastr.success 'Actualizando con exito', 'actualizado'
			row.actualizando = false

			elseRows = $filter('filter')($scope.evaluaciones, {categoria_id: row.categoria_id})

			for elseRows in elseRows
				if elseRows.id != row.id
					elseRows.actual = 0

		, (r2)->
			toastr.warning 'No se cambio como actual o no'
			console.log 'NO se establecio como actual o  no', r2
			row.actualizando = false
		)

	$scope.editar = (row)->
		$scope.$parent.creando = false
		$scope.$parent.editando = true
		$scope.$parent.currentEvaluacion = row

	$scope.eliminar = (row)->

		modalInstance = $modal.open({
			templateUrl: App.views + 'evaluaciones/removeEvaluacion.tpl.html'
			controller: 'RemoveEvaluacionCtrl'
			resolve:
				elemento: ()->
					row
				categoriasking: ()->
					$scope.categoriasking
		})
		modalInstance.result.then( (elemento)->
			$scope.evaluaciones = $filter('filter')($scope.evaluaciones, {id: '!'+elemento.id})
			console.log 'Resultado del modal: ', elemento
		)



	return

])


.controller('RemoveEvaluacionCtrl', ['$scope', '$modalInstance', 'elemento', 'categoriasking', 'Restangular', 'toastr', ($scope, $modalInstance, elemento, categoriasking, Restangular, toastr)->
	$scope.elemento = elemento
	$scope.categoriasking = categoriasking
	console.log 'elemento', elemento, categoriasking

	$scope.ok = ()->

		Restangular.all('evaluaciones/destroy').customDELETE(elemento.id).then((r)->
			toastr.success 'evaluaciones eliminadas', 'Eliminadas'
			$modalInstance.close(elemento)
		, (r2)->
			toastr.warning 'No se pudo eliminar evaluaciones', 'problema'
			console.log 'Error eliminando elemento: ', r2
			$modalInstance.dismiss('Error')
		)


	$scope.cancel = ()->
		$modalInstance.dismiss('cancel')
		
])

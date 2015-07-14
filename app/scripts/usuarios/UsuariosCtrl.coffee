angular.module('WissenSystem')

.controller('UsuariosCtrl', ['$scope', '$http', 'Restangular', '$state', '$cookies', '$rootScope', '$mdToast', 'uiGridConstants' 
	($scope, $http, Restangular, $state, $cookies, $rootScope, $mdToast, uiGridConstants) ->


		$scope.newUsu = {
			sexo: 'M'
			niveles: []
		}

		$scope.niveles =  [
			{
				id: 1
				nombre: 'A'
				evento_id: 1
				niveles_traducidos: [
					{
						id: 1
						nombre: 'A'
						descripcion: 'Grupos 6 y 7'
						idioma_id: 1
					},
					{
						id: 2
						nombre: 'A'
						descripcion: 'Groups 6 y 7'
						idioma_id: 2
					}
				]
			},
			{
				id: 2
				nombre: 'B'
				evento_id: 1
				niveles_traducidos: [
					{
						id: 1
						nombre: 'B'
						descripcion: 'Grupos 8 y 9'
						idioma_id: 1
					},
					{
						id: 2
						nombre: 'B'
						descripcion: 'Groups 8 y 9'
						idioma_id: 2
					}
				]
			}
		]

		$scope.avatar = {
			masculino: {
				abrev: 'M'
				def: 'Masculino'
				img: 'http://localhost:9000/images/system/avatars/male1.jpg'
			},
			femenino: {
				abrev: 'F'
				def: 'Femenino'
				img: 'http://localhost:9000/images/system/avatars/female1.jpg'
			}
		}


		$scope.editar = (row)->
			console.log 'Presionado para editar fila: ', row
			$state.go('panel.usuarios.editar', {usuario_id: row.id})

		$scope.eliminar = (row)->
			console.log 'Presionado para eliminar fila: ', row

			modalInstance = $modal.open({
				templateUrl: App.views + 'usuarios/removeAlumno.tpl.html'
				controller: 'RemoveUsuariosCtrl'
				resolve: 
					usuarios: ()->
						row
			})
			modalInstance.result.then( (alum)->
				$scope.gridOptions.data = $filter('filter')($scope.gridOptions.data, {alumno_id: '!'+alum.alumno_id})
				console.log 'Resultado del modal: ', alum
			)



		btGrid1 = '<a tooltip="Editar" tooltip-placement="left" class="btn btn-default btn-xs shiny icon-only info" ng-click="grid.appScope.editar(row.entity)"><i class="fa fa-edit "></i></a>'
		btGrid2 = '<a tooltip="X Eliminar" tooltip-placement="right" class="btn btn-default btn-xs shiny icon-only danger" ng-click="grid.appScope.eliminar(row.entity)"><i class="fa fa-trash "></i></a>'
	

		$scope.gridOptions = 
			showGridFooter: true,
			enableSorting: true,
			enableFiltering: true,
			enebleGridColumnMenu: false,
			columnDefs: [
				{ field: 'id', displayName:'Id', width: 50, enableCellEdit: false, enableColumnMenu: false}
				{ name: 'edicion', displayName:'Edición', width: 60, enableSorting: false, enableFiltering: false, cellTemplate: btGrid1 + btGrid2, enableCellEdit: false, enableColumnMenu: false}
				{ field: 'nombres', filter: {condition: uiGridConstants.filter.CONTAINS}, enableHiding: false }
				{ field: 'apellidos', filter: { condition: uiGridConstants.filter.CONTAINS }}
				{ field: 'sexo', width: 60 }
				{ field: 'username', filter: { condition: uiGridConstants.filter.CONTAINS }, displayName: 'Usuario'}
				{ field: 'email', enableCellEdit: false, filter: { condition: uiGridConstants.filter.CONTAINS }}
				{ field: 'cell', displayName:'Celular', filter: { condition: uiGridConstants.filter.CONTAINS }}
				{ field: 'edad' }
			],
			multiSelect: false,
			#filterOptions: $scope.filterOptions,
			onRegisterApi: ( gridApi ) ->
				$scope.gridApi = gridApi
				gridApi.edit.on.afterCellEdit($scope, (rowEntity, colDef, newValue, oldValue)->
					console.log 'Fila editada, ', rowEntity, ' Column:', colDef, ' newValue:' + newValue + ' oldValue:' + oldValue ;
					
					if newValue != oldValue
						Restangular.one('usuarios/update', rowEntity.id).customPUT(rowEntity).then((r)->
							$scope.toastr.success 'Usuario actualizado con éxito', 'Actualizado'
						, (r2)->
							$scope.toastr.error 'Cambio no guardado', 'Error'
							console.log 'Falló al intentar guardar: ', r2
						)
					$scope.$apply()
				)


		Restangular.all('usuarios').getList().then((data)->
			$scope.gridOptions.data = data;
		)

		$scope.guardando = false
		$scope.guardarNuevo = ()->
			$scope.guardando = true
			console.log('Usuario guardado')
			$scope.guardando = false


		return
	]
)

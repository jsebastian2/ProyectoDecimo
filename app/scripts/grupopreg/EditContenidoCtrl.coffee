angular.module('WissenSystem')

.controller('EditContenidoCtrl', ['$scope', '$http', 'toastr', '$state', '$rootScope', 'Restangular', '$filter', 
	($scope, $http, toastr, $state, $rootScope, Restangular, $filter)->

		$scope.idiomaactualselec = parseInt($scope.idiomaactualselec)

		$scope.idiomaPreg = [$scope.idiomaactualselec]


		$scope.editorOptions =
			inlineMode: true
			placeholder: ''


		$scope.cerrarEdicion = ()->
			$scope.grupoking.editando = false


		$scope.finalizarEdicion = ()->
			$scope.$emit 'finalizarEdicionContenido'

			$datos = {contenidos_traducidos: $scope.grupoking.contenidos_traducidos}

			Restangular.one('contenido_traduc/update').customPUT($datos).them((r)->
				console.log('Cambios guardados', r)
				$scope.grupoking.editando = false
				toastr.success 'Cambios guardados con exito'
			, (r2)->
				console.log('No se pudo guardar los Cambios', r2)
				toastr.warning 'Cambios NO guardados', 'Problema'
			)
			console.log 'Guardando Cambios...'


		$scope.aplicarCambios = ()->

			$datos = {contenidos_traducidos: $scope.grupoking.contenidos_traducidos}

			Restangular.one('contenido_traduc/update').customPUT($datos).them((r)->
				console.log('Cambios guardados', r)
				toastr.success 'Cambios guardados con exito'
			, (r2)->
				console.log('No se pudo guardar los cambios', r2)
				toastr.warning 'Cambios NO guardados', 'Problema'

			)
			console.log 'Guardando'




		return
	]
)
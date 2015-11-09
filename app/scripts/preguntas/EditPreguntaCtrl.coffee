angular.module('WissenSystem')

.controller('EditPreguntaCtrl', ['$scope', '$http', 'Restangular', '$state', '$cookies', '$rootScope', '$mdToast', 
	($scope, $http, Restangular, $state, $cookies, $rootScope, $mdToast) ->

		$scope.eventoactualselect = parseInt($scope.eventoactualselect)

		$scope.idiomaPreg = [$scope.eventoactualselect]


		$scope.editorOptions = 
			inlineMode: true
			placeholder: ''


		$scope.mostrarConfiguracion = false
		$scope.mostrarConfig = ()->
			$scope.mostrarConfiguracion = !$scope.mostrarConfiguracion


		$scope.cerrarEdicion = ()->
			$scope.preguntaking.editando = false

		$scope.finalizarEdicion = ()->
			$scope.$emit 'finalizaEdicionPreg'



			Restangular.on('preguntas/update').customPUT({definicion: 'Esta es una definición'}).then((r)->
				console.log('Cambios guardados', r)
				$scope.preguntaking.editando = false
				toastr.success 'Cambios  guardados '
			, (r2)->
				console.log('No se pudo guardar los cambios', r2)
				toastr.warning 'Cambiosno guardados...' , 'Problema'
			)
			console.log 'Guardando cambios.'


		$scope.aplicarCambios = ()->
			Restangular.one('preguntas/update/1').customPUT($scope.preguntaking).then((r)->
				console.log('Cambios guardados', r)
				toastr.success 'Cambios guardados con exito '
			, (r2)->
				console.log('No se pudo guardar los cambios', r2)
				toastr.success 'Cambios NO guardados ', 'Problema'
			)
			console.log 'Guardando cambios...'




		$scope.cambiaTipoPreguta = ()->
			console.log 'Cambia el tipo: ' , $scope.preguntaking.tipo_pregunta

			$scope.$broadcasts 'cambiaTipoPregunta'

		return
	]
)
		
		
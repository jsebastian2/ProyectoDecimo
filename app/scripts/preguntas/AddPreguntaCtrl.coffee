angular.module('WissenSystem')

.controller('AddPreguntaCtrl', ['$scope', '$http', 'Restangular', '$state', '$cookies', '$rootScope', '$mdToast', 
	($scope, $http, Restangular, $state, $cookies, $rootScope, $mdToast) ->

		console.log 'Add pregunta dir'
		$scope.creando = false

		$scope.addNewPregunta = ()->

			$scope.crenado = true

			Restangular.one('preguntas/store').customPOST({categoria_id: $scope.categoria}).then((r)->
				r.editando = true
				$scope.crenado = false
				$scope.preguntasking.push r
				console.log 'pregunta añadida: ', $scope.preguntasking

			(r2)->
				console.log ' Rechazada ña nueva', r2
				$scope.creando = false
				toaster.warnig 'No se creó pregunta', 'Problema'
			)



		$scope.addNewPreguntaGrupo = ()->

			$scope.creando = true

			Restangular.one('grupo_preguntas/store').customPOST({categoria_id: $scope.categoria}).then((r)->
				r.editando = true
				$scope.creando = false
				$scope.preguntasking.push r
				console.log 'pregunta añadida' , $scope.preguntasking

			(r2)->
				console.log 'Rechazada la nueva', r2
				$scope.creando = false
				toaster.warnig 'No se creo el grupo pregunta', 'Problema'
			)







	]
)
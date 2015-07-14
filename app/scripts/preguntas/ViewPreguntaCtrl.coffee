angular.module('WissenSystem')

.controller('ViewPreguntaCtrl', ['$scope', '$http', 'Restangular', '$state', '$cookies', '$rootScope', '$mdToast', 
	($scope, $http, Restangular, $state, $cookies, $rootScope, $mdToast) ->

		$scope.elegirOpcion = (pregunta, opcion)->
			angular.forEach pregunta.opciones, (opt)->
				opt.elegida = false

			opcion.elegida = true

		$scope.indexChar = (index)->
			return String.fromCharCode(65 + index)

			

		$scope.editarPregunta = (pregunta_king)->
			pregunta_king.editando = true




	]
)



.filter('porIdioma', [ ->
	(input, idioma) ->

		if input
			
			resultado = []

			idioma = parseFloat(idioma)

			for elemento in input

				idioma_id = parseFloat(elemento.idioma_id)
				
				if idioma == idioma_id
					resultado.push elemento

			return resultado
		else
			return false
])




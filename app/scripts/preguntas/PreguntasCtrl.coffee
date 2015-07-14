'use strict'

angular.module('WissenSystem')

.controller('PreguntasCtrl', ['$scope', '$http', 'Restangular', '$state', '$cookies', '$rootScope', 'toastr', 
	($scope, $http, Restangular, $state, $cookies, $rootScope, toastr) ->


		$scope.idiomaPreg = 1

		$scope.preguntas_king = [
			{
				id: 4
				descripcion: 'Una pregunta para traducir'
				tipo_pregunta: 'Test' # Test, Multiple, Texto, Lista
				duracion: 20
				evento_id: 1
				added_by: 1
				preguntas_traducidas: [
					{
						id: 1
						enunciado: '<p>¿Cuánto es <b>dos</b> más dos?</p>'
						ayuda: 'Este es un texto de ayuda'
						pregunta_id: 4
						idioma_id: 1
						idioma: 'Español'
						puntos: 5
						added_by: 1
						opciones: [
							{
								id: 1
								definicion: 'Primera opción, y necesito meter mucho texto para ver que tal se verá al ingresar más cosas.'
								is_correct: false
							},
							{
								id: 2
								definicion: 'Segunda opción'
								is_correct: true
							},
							{
								id: 3
								definicion: 'Tercera opción'
								is_correct: false
							}
						]
					}, 
					{
						id: 2
						enunciado: 'How much is 2+2?'
						ayuda: ''
						pregunta_id: 4
						idioma_id: 2
						idioma: 'English'
						puntos: 5
						added_by: 1
						opciones: [
							{
								id: 4
								definicion: 'Fist option'
								is_correct: false
							},
							{
								id: 5
								definicion: 'Second option'
								is_correct: true
							},
							{
								id: 6
								definicion: 'Third option'
								is_correct: false
							}
						]
					}
				]
			},
			{
				id: 5
				descripcion: 'Otra pregunta'
				tipo_pregunta: 'Test' # Test, Multiple, Texto, Lista
				duracion: 20
				evento_id: 1
				added_by: 1
				preguntas_traducidas: [
					{
						id: 1
						enunciado: '<p>¿Quién es más rápido?</p>'
						ayuda: 'Debes pensar en tu familia'
						pregunta_id: 5
						idioma_id: 1
						idioma: 'Español'
						puntos: 5
						added_by: 1
						opciones: [
							{
								id: 7
								definicion: 'Mi mamá.'
								is_correct: false
							},
							{
								id:8
								definicion: 'Mi papá'
								is_correct: true
							},
							{
								id: 9
								definicion: 'Mi hermano'
								is_correct: false
							},
							{
								id: 10
								definicion: 'Yo'
								is_correct: false
							}
						]
					}, 
					{
						id: 2
						enunciado: 'Who is the faster one in the family?'
						ayuda: 'You have to think in your family'
						pregunta_id: 5
						idioma_id: 2
						idioma: 'English'
						puntos: 5
						added_by: 1
						opciones: [
							{
								id: 11
								definicion: 'My mother'
								is_correct: false
							},
							{
								id: 12
								definicion: 'My father'
								is_correct: true
							},
							{
								id: 13
								definicion: 'My brother'
								is_correct: false
							},
							{
								id: 14
								definicion: 'Me'
								is_correct: false
							}
						]
					}
				]
			}
		]
			


		$scope.$on 'finalizaEdicionPreg', (elem)->
			console.log 'elem', elem


		$scope.idiomas = [
			{	
				id: 1
				nombre: 'Español'
				abrev: 'ES'
				original: 'Español'
				is_main: true
			},
			{	
				id: 2
				nombre: 'Inglés'
				abrev: 'EN'
				original: 'English'
				is_main: false
			}
		]
	]
)






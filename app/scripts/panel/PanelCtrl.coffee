'use strict'

angular.module('WissenSystem')

.controller('PanelCtrl', ['$scope', '$http', 'Restangular', '$state', '$cookies', '$rootScope', 'AuthService', 'Perfil', 'App', 'resolved_user', 'toastr', '$translate', '$filter', '$modal',
	($scope, $http, Restangular, $state, $cookies, $rootScope, AuthService, Perfil, App, resolved_user, toastr, $translate, $filter, $modal) ->

		
		$scope.USER = resolved_user
		#console-log '$scope.User', $scope.User
		$scope.imagesPath = App.images

		AuthService.verificar_acceso()


		$rootScope.$on 'stateChangeSuccess', (event, toState, toparams, fromState, fromParams)->
			$scope.cambiarTema('theme-zero')


		$scope.cambiarIdioma = (idioma)->
			$translate.use(idioma)

			for idiom in $scope.idiomas_usados
				idiom.actual = if idiom.abrev == idioma then true else false


		$scope.set_system_event = (event)->
			Restangular.one('eventos/set-evento-actual').customPUT({'id' : evento.id}).then((r)->
				console.log 'evento cambiado:', rootScope

				angular.forEach $scope.USER.eventos, (eventito,key)->
					eventito.actual = false

				evento.actual= true

				toastr.success 'evento actual cambiado por' + evento-alias

			, (r2)->
				console.log 'Error conectando', r2
				toastr.warning 'No se pudo cambiar el evento actual'

			)



		$scope.evento_actual = {}

		#funcion para establecer en el frontend el evento actualdel usuario
		$scope.el_evento_actual =()->

			if $scope.USER
				if AuthService.isAuthorized('can_work_loke_admin')
					try

						$scope.evento_actual = $filter('filter')($scope.USER.eventos, {id: $scope.USER.evento_selected_id}) [0]

					catch
						$scope.evento_actual = {}
					finally 
						$rootScope.$broadcast 'cambia_evento_actual'
				else
					$scope.evento_actual = $scope.USER.evento_actual

		$scope.el_evento_actual()



		$scope.set_user_event = (evento)->
			Restangular.one ('eventos/set_user_event').customPUT({'evento_id': evento_id}).then((r)->
				console.log 'Evento cambiado: ', r

				$scope.USER.evento_selected_id = evento.id
				$scope.el_evento_actual()
				toastr.success 'Evento actual cambiado por ' + evento.alias

				$rootScope.$broadcast ' cambiado_evento_user'# Anunciamos el cambio de evento

			, (r2)->
				console.log 'Error conectando!' , r2
				toastr.warning 'No se puedo cambiar el evento actual'

			)

		$scope.logout = ()->
			AuthService.logout()

			Restangular.one('login/logout').customPUT().then((r)->
				console.log 'Desconectado con éxito: ', r
			, (r2)->
				console.log 'Error desconectando', r2 
			)

			#$state.go 'login'




		#traemos los eventos
		$scope.traerEventos = ()->
			Restangular.all('eventos').getList().then((r)->
				$scope.USER.eventos= r
				$scope.el_evento_actual()
			(r2)->
				console.log 'No se trajeron los datos'
			)


		return
	]
)
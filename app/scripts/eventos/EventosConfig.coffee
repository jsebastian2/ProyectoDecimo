angular.module('WissenSystem')

.config(['$urlRouterProvider', '$stateProvider', ($urlRouterProvider, $stateProvider)->
		
	$stateProvider
		.state('eventos', 
			url: '/eventos'
			templateUrl: 'views/eventos/eventos.tpl.html'
			controller: 'EventosCtrl'
		)


		.state('eventos_user', 
			url: '/eventos_user'
			templateUrl: 'views/eventos/eventos_user.tpl.html'
			controller: 'EventosUserCtrl'
		)




])
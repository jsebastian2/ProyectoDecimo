'use strict'

angular.module('WissenSystem')

.controller('ApplicationController', ['$scope', 'USER_ROLES', 'AuthService', 'toastr', '$state', '$rootScope', 'Restangular', '$filter', ($scope, USER_ROLES, AuthService, toastr, $state, $rootScope, Restangular, $filter)->


	$scope.isAuthorized = AuthService.isAuthorized
	$scope.hasRoleOrPerm = AuthService.hasRoleOrPerm

	$scope.USER_ROLES = USER_ROLES

	$scope.isLoginPage = false


	$scope.navFull = true
	$scope.toggleNav = ()->
		$scope.navFull = !$scope.navFull



	$scope.tema = 'theme-zero'
	$scope.cambiartema = (actual)->
		$scope.tema = actual


	$scope.floatingSidebar = 0
	$scope.toggleFloatingSidebar = ()->
		$scope.floatingSidebar = if $scope.floatingSidebar then false else true


	#funcion para idiomas del sistema
	$scope.idiomas_del_sistema = ()->
		$scope.idiomas_usados = $filter('idiomas_del_sistema')($scope.idiomas)

		for idiom in $scope.idiomas_usados
			if idiom.abrev == 'ES'
				idiom.actual = true




	# traemos los idiomas
	$scope.idiomas = []
	Restangular.all('idiomas').getList().then((r)->
		$scope.idiomas = r
		$scope.idiomas_del_sistema()
	(r2)->
		console.log 'no se trajeron los idiomas del sistema', r2
	)








])
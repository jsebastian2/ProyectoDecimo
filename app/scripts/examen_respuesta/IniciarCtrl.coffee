angular.module('WissenSystem')

.controller('IniciarCtrl', ['$scope', 'Restangular', 'toastr', '$filter', 'AuthService', '$state', '$modal', 'App', ($scope, Restangular, toastr, $filter, AuthService, $state, $modal, App)->



	$scope.categorias_king = []
	$scope.traer_categorias_evento = () ->
		Restangular.all('categorias/categorias-evento').getList().then((r)->
			$scope.categorias_king = r
			#cosole.log 'categorias traidas: ' , r
		, (r2)->
			toastr.warning 'No se trajeron categorias del evento' ,'Problema'
			console.log 'no se trajo categorias_king' , r2
		)


		if AuthService.hasRoleOrPerm ['admin', 'profesor', 'tecnico']
			$scope.$parent.traerEventos()
		else
			$scope.traer_categorias_evento()



	$scope.iniciarExamen = (categoria)->
		modalInstance = $modal.open({
			templaterUrl: App.views + 'examen_respuestas/seguroIniciarCtrl.tpl.html'
			controller:'seguroIniciarCtrl'
			resolver:
				inscripcion: ()->
					categorias
				entidades: ()->
					$scope.parent.entidades
		})
		modalInstance.result.then((examen)->
			console.log 'resultado del modal: ' , examen
		)




])
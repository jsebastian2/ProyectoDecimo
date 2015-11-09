angular.module('WissenSystem')

.controller('EventosCtrl', ['$scope', 'Restangular','$modal', '$filter', 'App', 'toastr',  ($scope, Restangular, $modal, $filter, App, toastr)->
	
	$scope.newEvent = {
		with_pay: false
	}
	$scope.currentEvento = {
		idiomas_extras: []
	}


	$scope.creando = false
	$scope.editado = false

	$scope.guardando_nuevo = false
	$scope.guardando_edit = false

	$scope.guardar_evento = ()->

		$scope.guardando_nuevo = true


		Restangular.one('eventos/store').customPOST($scope.newEvent).then((r)->
				console.log('Evento guardado' , r)
				r.idiomas_extras = $scope.newEvent.idiomas_extras
				$scope.USER.eventos.push r 
				$scope.guardando_nuevo = false
				$scope.creando= true
				toastr.success 'Evento guardado con exito.' , 'Creado'

				#Reiniciamos las variables del evento.
				$scope.newEvent = {
					with_pay: false
				}
			, (r2)->
			console.log('No se puede guardar el evento', r2)		
			console.log('No se pudo crear evento', 'Problema')
			$scope.guardando_nuevo = false
		)
		# Actualizamos los datos por si es el evento actual
		$scope.el_evento_actual()


	$scope.update_evento = ()->

		$scope.guardando_edit = true

		Restangular.one('eventos/update').customPUT($scope.currentEvento).then((r)->
			console.log 'Evento editado', r
			$scope.guardando_edit = false
			toastr.success 'Evento actualizado con exito'
		(r2)->
			console.log 'El Evento no se pudo editar', r2
			toastr.warning 'No se pudo editar evento', 'Problema'
			$scope.guardando_edit = false
		)
		# Actulizamos los datos por si es evento actual
		$scope.el_evento_actual()



	$scope.crear_evento = ()->
		$scope.editando = false
		$scope.creando = true

	$scope.cancelar_newevento = ()->
		$scope.creando = false

	$scope.cancelar_currentEvento = ()->
		$scope.editando = false


	$scope.editarEvento = (evento)->
		$scope.editando = true
		$scope.currentEvent = evento
		console.log 'currentEvent', evento

		

	$scope.quitandoIdiomas = (item, model)->

		console.log item
		datos =
			evento_id: $scope.currentEvent.id
			idioma_id: item.idioma_id

		Restangular.one('eventos/destry').customDELETE('', datos).then((r)->
			toastr.success 'Idioma quitando con exito', 'Eliminado'
		, (r2)->
			toastr.warning 'no se pudo agregar idioma. ', 'Problema'
			console.log 'Error  agregando idioma:', r2
		)

		# Actulizamos los datos por si es evento actual
		$scope.el_evento_actual()



	$scope.idiomasSelect = (item, model)->
		console.log item, $scope.currentEvent.idiomas_extras
		datos = 
			evento_id: $scope.currentEvent.id
			idioma_id: item.id

		Restangular.one('idiomas/store').customPOST(datos).then((r)->
			toastr.success 'Idioma agregado con exito', 'Añadido'
		, (r2)->
			toastr.warning 'No se pudo agregar idioma', 'Problema'
			console.log 'Error agregando idioma: ', r2
		)

		$scope.el_evento_actual()


	$scope.eliminarEvento = (evento)->

		modalInstance = $modal.open({
			templateUrl: App.views + 'eventos/removeEvento.tpl.html'
			controller: 'RemoveEventoCtrl'
			resolve:
				element: ()->
					evento
		})
		modalInstance.result.then((elem)->
			$scope.USER.eventos = $filter('filter')($scope.USER.eventos, {id: '!'+elem.id})
			console.log 'Resultado del modal: ', elem
		)
		#
		$scope.el_evento_actual()


	#
	$scope.traerEventos()

])

.controller('RemoveEventoCtrl', ['$scope', '$modalInstance', 'elemento', 'Restangular', 'toastr', ($scope, $modalInstance, elemento, Restangular, toastr)->
	$scope.elemento = elemento

	$scope.ok = ()->

		Restangular.all('eventos/destroy').customDELETE(elemento.id).then((r)->
			toastr.success 'Evento eliminado con exito', 'Eliminado'
			$modalInstance.close(elemento)
		, (r2)->
			toastr.warning 'No se pudo eliminar al elemento', 'Problema'
			console.log 'Error eliminando elemento', r2
			$modalInstance.dismiss('cancel')
		)


	$scope.cancel = ()->
		$modalInstance.dismiss('cancel')
		
])
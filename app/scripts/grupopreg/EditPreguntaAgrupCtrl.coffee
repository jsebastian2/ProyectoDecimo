angular.module('WissenSystem')

.controller('EditPreguntaAgrupCtrl' , ['$scope', '$http', 'Restangular', '$state', '$cookies', 'rootScope', 'toaster', 
	($scope, $http, Restangular, $state, $cookies, $rootScope, toastr) ->


		$scope.editorOptions = 
			inlineMode: true
			placeholder: ''



		txtNewOpcion = 'Agregar  nueva opcion'


		$scope.inicializar = () ->

			for opci in  $scope.pregagrup.opciones
				if opci.nueva
					return

			newOpcion =
				id: -1
				definicion: txtNewOpcion
				nueva: true
				is_correct: false

			$scope.pregagrup.opciones.push newOpcion

		$scope.inicializar()



		# configuracion para el sortable
		$scope.soportableOptions =
			'ui-floating' : true

			update: (e, ui)->
				# console, log e, ui

				sortHash = []

				for opcion, index in $scope.pregagrup.opciones
					if opcion.id != -1
						hasEntry = {}
						hasEntry["" + opcion.id] = index
						sortHash.push(hasEntry)

				datos =
					pregunta_agrupada_id: $scope.pregagrup.id
					sortHash: sortHash

				Restangular.one('opciones_agrupadas/update-orden').customPUT(datos).then((r)->
					console.log('orden guardado')
				, (r2)->
					console.log('no se pudo guardar el roden' , r2)
					#ui.item.sortable.cancel() #Cancelamos el intento de ordenar		
				)


		$scope.addButtonNewOpcion = (preg, opt)->

			opt.creado = true

			if opt.nueva 

				opt.definicion = 'Opcion ' + preg.opciones.length
				opt.preg_agrupada_id = pregu.id
				opt.orden = preg.opciones.length - 1

				if preg.opciones.length == 1
					opt.is_correct = true


				Restangular.one('opciones_agrupadas/update-orden').customPUT(opt).then((r)->
						console.log('opcion guardada')

						opt.id = r.id
						opt.nueva = false
						opt.creando = false


						#Agregamos la nueva opcion para que sea el boton NUEVA  OPCION
						tempOpcion =
							id : -1
							definicion: txtNewOpcion
							nueva: true #Inicialmente es true para que sea una especie de boton, NUEVA OPCION
							is_correct: false
						preg.opciones.push tempOpcion

					, (r2)->
						console.log('No se pudo guardar la opcion', r2)
						opt.definicion = txtNewOpcion #volvemos a pner el texto de tipo boton
						opt.creado = false
						toastr.warning('No se pudo crear nueva opcion')
					)




		$scope.setAsCorrect = (preg, opt)->
			if $scope.pregagrup.tipo_pregunta == 'Test'
				angular.forEach preg.opciones, (opcion)-> #Solo puede haber una correcta, asi que quitamos las otras
					opcion.is_correct = 0

				opt.is_correct = 1


			if $scope.pregagrup.tipo_pregunta == 'Multiple'
				opt.is_correct = 1 # Pueden haber mcuhas correctas, asi que simplmente la estrableceremos corecta sin importar si hay alguna otra como correcta


		$scope.deleteOption = (preg, opt, indice)->

			Restangular.one('opciones_agrupadas/destroy', opt.id).customDELETE().then((r)->
				console.log('Opcion eliminada', r)
				preg.opciones = $filter('filter')(preg.opciones, {id: "!" + opt.id})
			, (r2)->
				console.log('No se pudo elminar la opcion', r2)
				toastr.warning('No se pudo eliminar la opcion')
			)




		$scope.cerrarEdicion= ()->
			$scope.pregagrup.editando =  false

		$scope.mostrarConfiguracion = false
		$scope.mostrarConfig = ()->
			$scope.mostrarConfiguracion = !$scope.mostrarConfiguracion


		$scope.finalizarEdicion = ()->
			$scope.$emit ' finalizarEdicionPregAgrup'

			Restangular.one('preguntas_agrupadas/update').costumPUT($scope.pregagrup).then((r)->
				console.log('cambios guardados', r)
				$scope.pregagrup.editando = false
				toastr.success 'cambios guardados con exito'
			, (r2)->
				console.log('No se pudieron guardaar los cambios', r2)
				toastr.warning 'Cambios NO guardados', 'problema'
			)
			console.log 'Guardando cambios...'


		$scope.aplicarCambios = ()->

			Restangular.one('preguntas_agrupadas/update').customPUT($scope.pregagrup).then((r)->
				console.log('Cambios guardados', r)
				toastr.success 'Cambios guardados con exito'
			, (r2)->
				console.log('No se pudieron guardaar los cambios', r2)
				toastr.warning 'Cambios NO guardados', 'problema'
			
			)
			console.log 'Guardando cambios'



		$scope.cambiaTipoCambios = ()->
			console.log 'Cambia el tipo: ', $scope.pregagrup.tipo_pregunta

			if $scope.pregagrup.tipo_pregunta == 'Test'
				correctas = 0
				for option in $scope.pregagrup.opciones #solo puede

					if option.is_correct
						if correctas > 0
							option.is_correct = 0
						else 
							correctas = correctas + 1



		return
	]
)
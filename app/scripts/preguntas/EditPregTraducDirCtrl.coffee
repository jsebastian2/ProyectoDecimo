angular.module('WissenSystem')

.controller('EditPregTraducCtrl', ['$scope', '$http', 'Restangular','$state', '$rootScope', '$filter', '$cookies', 'toastr',  ($scope, http, Restangular, $state, rootScope, $filter, cookies, toastr)->




		txtNewOpcion = 'Agregar nueva opcion'

		$scope.inicializar = ()->

			for opci in $scope.preguntatradu.opciones
				if opci.nueva
					return

			newOpcion =
				id: -1
				definicion: txtNewOpcion
				nueva: true
				is_correct: false

			$scope.preguntatradu.opciones.push newOpcion

		$scope.inicializar()


		#
		$scope.sortableOptions = 
			'ui-floating': true

			update: (e, ui)->
				#

				sortHash = []

				for opcion, index in $scope.preguntatradu.opciones
					if opcion.id != -1
						hashEntry = {}
						hashEntry["" + opcion.id] = index
						sortHash.push(hashEntry)

				datos =
					pregunta_traduc_id: $scope.preguntatraduc.id
					sortHash: sortHash

				Restangular.one('opciones/update-orden').customPUT(datos).then((r)->
					console.log('Orden guardado')
				, (r2)->
					console.log('no se pudo guardar el orden', r2)
				#ui.item.sortable.cancel() #Cancelemos el intento de ordenar
				)




		$scope.addButtonNewOpcion = (preg, opt)->

			opt.creando = true

			if opt.nueva

				opt.definicion = 'opcion' + preg.opciones.length
				opt.pregunta_traduc_id = preg.idopt.orden = preg.opciones.length -1

				if preg.opciones.length == 1
					opt.is_correct = true



				Restangular.one('opciones/store'). customPOST(opt).then((r)->
					console.log('Opcion guardada')

					opt.id = r.id
					opt.nueva = false
					opt.creando = false


					#Agregamos la nueva opcion para que sea el boton NUEVA OPCION
					tempOpncion = 
						id: -1
						definicion: txtNewOpcion
						nueva: true #inicialmente es true para que sea una especie
						is_correct: false
					preg.opciones.push tempOpncion

				, (r2)->
					console.log('No se pudo guardar la opcion', r2)
					opt.definicion = txtNewOpcion # Volvemos a poner el texto de tipo
					opt.creando = false
					toastr.warning('No se pudo crear nueva opcion')
				)




		$scope.setAsCorrect = (preg, opt)->
			if $scope.preguntasking.tipo_preguntas == 'Test'
				angular.forEach preg.opciones, (opcion)-> #sala puede haber una
					opcion.is_correct = 0

				opt.is_correct = 1


			if $scope.preguntasking.tipo_pregunta == 'Multiple'
				opt.is_correct = 1 # pueden haber mcuhas correctas,asi que simplemente


		$scope.deleteOption = (preg, opt, indice)->


			Restangular.one('opciones/destroy', opt.id).customDELETE().then((r)->
				console.log('Opcion eliminado', r)
				preg.opciones = $filter('filter')(preg.opciones, {id: "!" + opt.id})
			, (r2)->
				console.log('No se pudo eliminar la opcion', r2)
				toastr.warning 'No se pudo eliminar la opcion'
			)


		$scope.$on 'cambiaTipoPregunta', ()->

			if $scope.preguntaking.tipo_pregunta == 'Test'

				for preg_trad in $scope.preguntasking.preguntas_traducidas
					correctas = 0
					for opcion in preg_trad.opciones # Solo puede haber una corectta

						if opcion.is_correct
							if correctas > 0
								opcion.is_correct = 0
							else
								correctas = correctas + 1
	]
)

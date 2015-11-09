angular.module('WissenSystem')

.filter('categsInscritas', ['$filter', ($filter)->
	(currentUser, categorias_king, idioma_id)->

		if currentUser and categorias_king

			resultado = []

			if currentUser.length == 0 or currentUser.length == undefined
				return []


			else if currentUser.length == 1

				usuario = currentUser[0]

				for categorias_king in categorias_king

					categ_traducida = $filter('porIdioma')(categorias_king.categorias_traducida, idioma_id)

					if categ_traducida.length > 0
						categ_traducida = categ_traducida[0]

					categ_traducida.algunos = false # no aplica si solo hay uno
					categ_traducida.nivel_id = categoriaking.nivel_id

					res = $filter('filter')(usuario.inscripciones, { categorias_id: categoriaking.id })

					if res.length > 0
						categ_traducida.incripcion_id = res.id
						categ_traducida.selected           = true 
					else
						categ_traducida.incripcion_id  = undefined
						categ_traducida.selected           = false


					resultado.push categ_traducida


			else if currentUser.length > 1

					for categoriaking in categorias_king

						categ_traducida = $filter('porIdioma')(categoriaking.categorias_traducidas, idioma_id)

						if categ_traducida.length > 0
							categ_traducida= categ_traducida[0]

						categ_traducida.nivel_id = categoriaking.nivel_id
						categorias_traducida.incripcion_id = undefined # por ser varios, no habra un codigo de inscripciones

						cant = 0

						for usuario in currentUser

							res = $filter('filter')(usuario.inscripciones, { categoria_id: categoria.id })

							if res.length >0
								cant++

							if cant == 0
								categ_traducida.selected = false
								categ_traducida.algunos = false

							else if cant == currentUser.length
								categ_traducida.selected = true
								categ_traducida.algunos = false

							else

								categ_traducida.selected = false
								caget_traducida.algunos = true


							resultado.push categ_traducida


					return resultado
						
				else 
					return []
])



.filter('categsInscritasDeUsuario', ['$filter', ($filter)->
	(usuario, categorias_king, idioma_id) ->

			if usuario and categorias_king

				resultado = []


				for categoriaking in categorias_king

					categ_traducida = $filter('porIdioma')(categoriaking.categorias_traducidas, parseFloat(idioma_id)) 

					if categ_traducida. length > 0 
						categ_traducida = categ_traducida[0]

						res = $filter('filter')(usuarioinscripciones, { categoria_id: categoriaking.id})

						if res.length > 0
							res = res[0]
							categ_traducida.alloweb_to_answer = res.allowed_to_answer
							categ_traducida.examenes = res.examenes
							categ_traducida.incripcion_id = res.id

							resultado.push categ_traducida


				return resultado

			else
				return[]					
])
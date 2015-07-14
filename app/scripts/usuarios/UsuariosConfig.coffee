angular.module('WissenSystem')

.config(['$stateProvider', 'App', ($stateProvider, App)->

	$stateProvider

	.state('panel.usuarios', { #- Estado admin.
				url: '^/usuarios'
				views:
					'contenido_panel':
						templateUrl: "#{App.views}usuarios/usuarios.tpl.html"
						controller: 'UsuariosCtrl'

				data: 
					pageTitle: 'Usuarios'
			})


])
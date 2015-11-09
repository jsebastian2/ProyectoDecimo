angular.module('WissenSystem')

.config(['$stateProvider', 'App', 'PERMISSIONS', '$translateProvider', ($stateProvider, App, PERMISSIONS, $translateProvider)->

	$stateProvider
		.state('panel.usuarios', { #- Estado admin.
			url: '^/usuarios'
			views:
				'contenido_panel':
					templateUrl: "#{App.views}usuarios/usuarios.tpl.html"
					controller: 'UsuariosCtrl'

				data: 
					pageTitle: 'Usuarios'
					need_permissions: [PERMISSIONS.can_edit_usuarios]
		})

	$translateProvider.translations('EN', 
		BUSCAR_PLACEHOLDER: 'Find',
		TIP_BTN__NUEVA_PREGUNTA: 'Create a new question'
		BTN_NUEVA_PREGUNTA: 'New question'
	)
	.translations('EN', 
		BUSCAR_PLACEHOLDER: 'Find',
		TIP_BTN__NUEVA_PREGUNTA: 'Create a new question'
		BTN_NUEVA_PREGUNTA: 'New question'
	)
	.translations('FR', 
		NUEVO_USUARIOS: 'Nouveau'
		NOMBRE_USUARIOS: 'Nom'
		CAMPO_OBLIGATORIO_USUARIOS: 'Champ Obligatoire'
		APELLIDOS_USUARIOS: 'Nom'
		SEXO_USUARIOS: 'Sex'
		MASCULINO_USUARIOS: 'Male'
		FEMENINO_USUARIOS: 'Femme'
		USERNAME_USUARIOS: 'Username'
		EMAIL_USUARIOS: 'Email'
		CELULAR_USUARIOS: 'Cellule'
		EDAD_USUARIOS: 'Age'
		INSCRIBIR_EN_USUARIOS: 'Inscrivez-Vous À'
		MATEMÁTICAS_A_USUARIOS: 'Mathématiques A'
		MATEMÁTICAS_B_USUARIOS: 'Mathématiques B'
		MATEMÁTICAS_C_USUARIOS: 'Mathématiques C'
		ESPAÑOL_A_USUARIOS: 'Espagnol A'
		ESPAÑOL_B_USUARIOS: 'Espagnol B'
		GUARDAR_USUARIOS: 'Sauvegarder'
		CANCELAR_USUARIOS: 'Annuler'
		USUARIOS_USUARIOS:  'Utilisateurs'
	)

])
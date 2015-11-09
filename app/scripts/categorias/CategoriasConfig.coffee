angular.module('WissenSystem')

.config (['App','$stateProvider', '$translateProvider', (App, $stateProvider, $translateProvider)->
		
	$stateProvider
		.state('panel.categorias', 
			url: '^/categorias'
			views:
				'contenido_panel':
					templateUrl: "#{App.views}categorias/categorias.tpl.html"
					controller: 'CategoriasCtrl'

				data:
					pageTitle: 'Categorias'
		)



	$translateProvider.translations('EN', 
		CATEGORIAS_TITLE: 'Categs'
		NIVELES_TITLE: 'Levels'
		DISCIPLINA_TITLE: 'Disciplines'
	)
	.translations('ES',
		CATEGORIAS_TITLE: 'Categorias'
		NIVELES_TITLE: 'Niveles'
		DISCIPLINA_TITLE: 'Disciplinas'
	)
	.translations('FR',
		CATEGORIAS_TITLE: 'Categorias'
		NIVELES_TITLE: 'Niveles'
		DISCIPLINA_TITLE: 'Disciplinas'
		EDITAR_CATEGORIAS: 'Modifier Catégories'
		ELIMINAR_CATEGORIAS: 'Retirer Catégorie'
		EDITAR_CATEGORIA_EN_IDIOMAS: 'Modifier Une Catégorie Langue'
		TRADUCIDO_CATEGORIAS: 'Catégories Traduits'
		CERRAR_CATEGORIAS: 'Fermer Catégories'
		APLICAR_CATEGORIAS: 'Appliquer Des Catégories'
		FINALIZAR_CATEGORIAS: 'Fin Catégories'
		CREAR_CATEGORIA: 'Créer Une Catégorie'
		EDITAR_DISCIPLINA: 'Modifier La Discipline'
		ELIMINAR_DISCIPLINA: 'Retirer La Discipline'
		EDITAR_DISCIPLINA_EN_IDIOMAS: 'Modifier Langues De Discipline'
		DISCIPLINA_EN: 'Disciplia Dans'
		NOMBRE_NIVEL: 'Niveau De Nom'
		DESCRIPCION_DISCIPLINA: 'Description'
		TRADUCIDO_DISCIPLINA: 'Traduit'
		CERRAR_DISCIPLINA: 'Fermer'
		APLICAR_DISCIPLINA: 'Appliquer'
		FINALIZAR_DISCIPLINA: 'Fermer'
		CREAR_DISCIPLINA: 'Créer Discipline'
		EDITAR_NIVEL: 'Modifier Niveau'
		ELIMINAR_NIVEL: 'Retirez Niveau'
		EDITAR_NIVEL_EN_IDIOMAS: 'Modifier Langues De Niveau'
		NIVEL_EN: 'Niveau'
		NOMBRE_NIVEL: 'Niveau De Nom'
		DESCRIPCIÓN_NIVEL: 'Description'
		TRADUCIDO_NIVEL: 'Traduit'
		CERRAR_NIVEL: 'Fermer'
		APLICAR_NIVEL: 'Appliquer'
		FINALIZAR_NIVEL: 'Fermer'
		CREAR_NIVEL: 'Créer Discipline'
		SEGURO_QUE_DESEA_ELIMINAR_REMOVE_CATEGORIA: 'Bien Sûr, Vous Voulez Supprimer'
		CATEGORIAS_REMOVE_CATEGORIA: 'Catégories'
		ELIMINAR_REMOVE_CATEGORIA: 'Retirer'
		CANCELAR_REMOVE_CATEGORIA: 'Annuler'
		SEGURO_QUE_DESEA_ELIMINAR_REMOVE_DISCIPLINA: 'Bien Sûr, Vous Voulez Supprimer'
		CATEGORIAS_REMOVE_DISCIPLINA: 'Catégories'
		ELIMINAR_REMOVE_DISCIPLINA: 'Retirer'
		CANCELAR_REMOVE_DISCIPLINA: 'Annuler'
		SEGURO_QUE_DESEA_ELIMINAR_REMOVE_NIVEL: 'Bien Sûr, Vous Voulez Supprimer'
		CATEGORIAS_REMOVE_NIVEL: 'Catégories'
		ELIMINAR_REMOVE_NIVEL: 'Retirer'
		CANCELAR_REMOVE_NIVEL: 'Annuler'




	)


])
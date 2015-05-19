'use strict'

angular.module('proyectoApp', [
  'ngAnimate'
  'ngCookies'
  'ngResource'
  'ngRoute'
  'ngSanitize'
  'ngTouch'
  'ui.router'
  'pascalprecht.translate'
  'ui.bootstrap'
  'ui.select'
  'angular-loading-bar'
  'restangular'
  'toastr'
  'http-auth-interceptor'
  'ui.grid'
  'ui.grid.edit'
  'ui.grid.resizeColumns'
  'ui.grid.exporter'
  'ui.grid.selection'
  'angularFileUpload'
  'FBAngular'
])
#- Valores que usaremos para nuestro proyecto
.constant('App', (()->

  #dominio = 'http://lalvirtual.com/' 
  dominio = 'http://localhost/' # Pruebas en mi localhost
  
  console.log 'Entra al dominio: ', location.hostname
  
  if(location.hostname.match('lalvirtual'))
    dominio = 'http://lalvirtual.com/'
  
  server = dominio + 'wissenLaravel/public/'
  #server = ''
  frontapp = dominio + 'ProyectoDecimo/'




  return {
    Server: server
    views: 'views/'
    #views: server + 'views/dist/views/' # Para el server Laravel
    images: server + 'images/'
  }
)())

.config( ['$routeProvider', 'RestangularProvider', 'App', ($routeProvider, Restangular, App)->

  Restangular.setBaseUrl App.Server



  $routeProvider
    .when('/', {
      templateUrl: 'views/main.html',
      controller: 'MainCtrl'
    })
    .when('/about', {
      templateUrl: 'views/about.html',
      controller: 'AboutCtrl'
    })
    .otherwise({
      redirectTo: '/'
    })
])

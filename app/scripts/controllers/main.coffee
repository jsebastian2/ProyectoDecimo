'use strict'
angular.module('proyectoApp')

.controller('MainCtrl', ['$scope', 'Restangular',  ($scope, Restangular)->
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ]

    Restangular.all('disciplinas').getList();


    Restangular.setBaseUrl 'http://lalvirtual.com/wissen/wissenLaravel/public/'

    Restangular.all('disciplinas').getList();

])

var app = angular.module('StarterApp', ['ngRoute']);
 
//Now Configure  our  routing
.config(function($routeProvider){
        $routeProvider
            .when("/", {
                controller: "rates",
                controllerAs: "vm",
                templateUrl: "inicio.html"
            })
            .when("/descargas", {
                controller: "appCtrl",
                controllerAs: "vm",
                templateUrl: "descargas.html"
            })
            .when("/opciones", {
                controller: "appCtrl",
                controllerAs: "vm",
                templateUrl: "opciones.html"
            });
    })
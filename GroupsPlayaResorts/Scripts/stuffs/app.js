var app = angular.module('app', ['ngRoute'])
    app.config(function($routeProvider){
        $routeProvider
            .when('/', {
                controller: 'rates',
                controllerAs: 'vm',
                templateUrl: 'inicio.html'
            })
            .when('/descargas',  {
                controller: 'customersCtrl',
                controllerAs: 'vm',
                templateUrl: 'group.html'
            })
            .when('/pays', {
                controller: 'customersCtrl',
                controllerAs: 'vm',
                templateUrl: 'group.html'
            })
            .when('/rates', {
                controller: 'customersCtrl',
                controllerAs: 'vm',
                templateUrl: 'group.html'
            });
    })
// data base local
  app.controller('rates', function($scope) {
    $scope.rates =[
    {type:'Junior' ,code:'0001',single:' ' ,duble:' ' ,suite:' ' ,th:' ' ,persons:'' ,juniorkid:' ' },
    {type:'Master' ,code:'0001',single:' ' ,duble:' ' ,suite:' ' ,th:' ' ,persons:'' ,juniorkid:' ' },
    {type:'Junior' ,code:'0001',single:' ' ,duble:' ' ,suite:' ' ,th:' ' ,persons:'' ,juniorkid:' ' },
    {type:'President' ,code:'0001',single:' ' ,duble:' ' ,suite:' ' ,th:' ' ,persons:'' ,juniorkid:' ' }
    ];
});

// data base external php
app.controller('customersCtrl', function($scope, $http) {
    $http.get("http://www.w3schools.com/angular/customers.php")
    .success(function (response) {$scope.names = response.records;});
});


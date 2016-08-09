var app = angular.module('StarterApp', [])

app.config(function($routeProvider) {
	$routeProvider.when('/', 
		{
		   templateUrl: 'new_group.html'
		})
		.when('/brakedown', {
		  templateUrl: 'groups/new_group.html'
		})
		.otherwise({
			redirectTo: '/'
		});
});
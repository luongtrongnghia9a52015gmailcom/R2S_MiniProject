app = angular.module('admin-app', ["ngRoute"]);

app.config(function ($routeProvider) {
	$routeProvider
	.when("/authority", {
		templateUrl: "/assets/admin/authority/index.html",
		controller: "authority-ctrl"
	})
	.when("/account", {
		templateUrl: "/assets/admin/account/index.html",
		controller: "account-ctrl"
	})
	.otherwise({
		templateUrl: "/assets/admin/account/index.html",
		controller: "account-ctrl"
	});
});
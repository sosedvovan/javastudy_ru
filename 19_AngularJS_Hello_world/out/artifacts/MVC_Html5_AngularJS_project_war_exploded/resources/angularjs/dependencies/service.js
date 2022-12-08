//organise and share your code across the application
//contains set of methods and provides communication across controllers
//services are singleton instantiated only one for angularjs app
//Здесь определяется вызов определенной функции с передачей
// параметра внутрь функции

//определяем модуль
angular.module("serviceModule", [])
	//с пом .service определяем: объект 'TestService'
	//инициализируется с пом function()...
.service('TestService', function(){
	//в объекте определяем несколько функций
	   this.function1 = function(p) {
		  alert("function1");
	   };
	   this.function2 = function(p) {
		  alert("function2 from service.js");
	   };
	   this.function3 = function(p) {
		  alert("function3 from service.js");
	   };
	   this.serviceMethod = function(p) {
		  alert("serviceMethod from service.js");
	   }
//из области действия в jsp первого контроллера
//можно будет вызвать функцию TestService.function1()
}).controller("serviceDependency", function ($scope, TestService){
		TestService.function1();
})
//из области действия в jsp второго контроллера
//можно будет вызвать функцию TestService.serviceMethod()
//в jsp вызываем с пом кнопки
.controller("serviceController", function($scope, TestService) {
		TestService.function2();
		$scope.serviceMethod = function() {
			TestService.serviceMethod('');
		} 
});
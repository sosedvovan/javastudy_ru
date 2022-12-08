//this is the definition for a new angularjs single page application



//открываем главный модуль
var app = angular.module('myApp', [])
//заводим контроллер
//Контроллер имеет один метод с значением переменной true
    .controller('externalController', function($scope) {
        $scope.testvalue='test'
//в область видимости контроллера  $scope кладем функцию
        $scope.externalControllerMethod = function () {
//в функции заводим иницииализированную переменную и помещаем ее в область видимости
       $scope.externalControllerMethodCalled = true;
            // alert('externalController is' + '111');
   }
//то в области видимости и функция и метод
//пример вызова этого контроллера на стр ng-controller.jsp
//функции вызываем кнопкой
//<button ng-click="externalControllerMethod()">externalControllerMethod</button>
});


//Создание и наследование контроллеров
//На одной странице можно создать несколько контроллеров,
// которые могут использовать наследование.

// Ниже созданы несколько контроллеров в параметры которых передается объект $scope.
//Здесь созданы несколько контроллеров, где у каждого есть свои переменные,
// но один контекст $scope. Чтобы продемонстрировать наследование в разных
// контроллерах были созданы переменные с одинаковыми именами (firstVar, secondVar)
// <script>
//                 <%--//получаем модуль angular--%>
//                 var app = angular.module('myApp');
//                 app.controller('FirstController', ['$scope', function($scope) {
//                     $scope.zeroVar = 'ZZZ';
//                     $scope.firstVar = 'ABC';
//                     $scope.secondVar = 'abc';
//                     $scope.firstControllerCalled = false;
//                 }]);
//
//                 app.controller('SecondController', ['$scope', function($scope) {
//                     $scope.firstVar = 'DEF';
//                     $scope.secondVar = 'def';
//                 }]);
//
//                 app.controller('ThirdController', ['$scope', function($scope) {
//                     $scope.firstVar = 'GHK';
//                     $scope.secondVar = 'ghk';
//                 }]);
//
//                 app.controller('controllerMethodTest', ['$scope', function($scope) {
//                     $scope.firstControllerCalled = false;
//
//                     $scope.controllerMethod = function() {
//                         $scope.firstControllerCalled = true;
//                     }
//                 }]);
//
//             </script>

//В параметры метода controller могут быть переданы другие параметры, например сервис.
//  .controller('myController', ['someService', function(someService) { ... }


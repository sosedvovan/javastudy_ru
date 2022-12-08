//Определяем некий root элемент (rootObject = someObject),
// который затем используется на html странице с помощью
// выражения {{rootObject}}

//подключаемся к модулю
angular.module("myApp", ['serviceModule'])
//определяем переменную "someObject" как анонимный объект
    .value("someObject", {
        objectName: "Mordor",
        objectValue: "Default City",
        getObjectDetails: function (){
            return this.objectName + " is " + this.value;
        }
    })
//определяем контроллер  "valueController"
//в его $scope кладем объект кот определили выше
//и выводим его на jsp странице
    .controller("valueController", function ($scope, someObject)
    {
        $scope.rootObject = someObject;
    });
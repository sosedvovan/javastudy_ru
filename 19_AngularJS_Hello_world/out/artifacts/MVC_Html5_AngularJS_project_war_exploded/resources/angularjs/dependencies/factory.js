//СОЗДАЕМ ПЕРЕМЕННЫЕ И ОБЪЕКТЫ ДЛЯ $scope
//creates values or objects on demand
//Этот файл создает зависимости по требованию. После того
// как загрузка дойдет до вызова контроллера factoryController
// будет произведена инициализация переменных с помощью метода
// factory()

//подключаемся к модулю "myApp" (и далее работаем цепочкой)
angular.module("myApp")
//определим нужную нам переменную "someFactoryValue"
//со значением "AngularJS framework"
.value("someFactoryValue", "AngularJS framework")
//определим встроенный метод factory для инициализации(создания)(сеттер)
// переменной(объекта) "angularFactory" которую в нем и объявим
// и инициализируем с пом функции
.factory("angularFactory", function(someFactoryValue) {
//заводим новый объект и инициализируем
//его поле переменной объявленной выше
   var angularFactory = {
       'angularVersion': someFactoryValue,
       'siteName': 'javastudy.ru',
//внутрь объекта поместим еще и функцию
//геттер для поля 'angularVersion' и вызовем alert
       getAngularVersion: function() {
           alert('Angular version is' + this.angularVersion);
       }
   };
//возвращаем созданный объект
    return angularFactory;
})
//определим контроллер с именем "factoryController" функцией
// работающей с областью видимости $scope (jsp страница видит этот $scope {{...}})
//и переменной созданной и инициализированной выше.
//Контроллер мы можем вызывать в jsp странице
.controller("factoryController", function($scope, angularFactory) {
//вызовем alert (служебное сообщение при обращении к контроллеру)
    alert(angularFactory.angularVersion);
//в область видимости контроллера положим новую переменную angularVersion
//и присвоим ей значение из объекта: angularFactory.angularVersion
//теперь при обращении к этому контроллеру из  jsp страницы
//мы можем на jsp странице вывести {{ angularVersion }}
    $scope.angularVersion = angularFactory.angularVersion;
//выведем в консоль версию angular (служебное сообщение)
    console.log(angularFactory.angularVersion);
//вызовем функцию-геттер объекта чтобы вывелся alert определенный в нем
//(служебное сообщение)
    angularFactory.getAngularVersion();
});
//в jsp странице мы покажем переменную
// {{ angularVersion }}  =  AngularJS framework
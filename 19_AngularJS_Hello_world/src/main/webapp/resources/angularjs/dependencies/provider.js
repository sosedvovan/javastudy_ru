//configurable service factory
//Провайдер это фабрика, настроенная особым образом. Провайдер ожидает
// функцию $get, которая будет внедрять другую часть приложения.
// Здесь в функции определяется переменная name и по запросу к $get
// будет возвращено значение Java Spring MCV and AngularJS.

//опять подключились к то му же модулю "myApp"
angular.module("myApp")
//задали константу
.constant("testConstant","constant value")
//в методе provider(ожидает $get) определили переменную "configuredService"
//значения для которой дает функция "configuredService"
.provider("configuredService", function() {

    //определяем переменную со значением
	var name = '';

    //сеттер для переменной
    this.setName = function(newName) {
        this.name = newName;
    };

    //геттер для переменной
    this.$get = function() {
    	 var name = this.name;
//метод $get будет возвращать функцию getName:
         return {
             	 getName: function() {
                 return "Java Spring MCV and AngularJS";
                 //или
                 // return name;  //  'provider name' заданный ниже в .config
             	 },
                 getNameplus: function (){
                 return "nameplus+++"
             }

         }
    };
    
    
})
//в методе config получили доступ к  setName и передали в него 'provider name'
.config(function(configuredServiceProvider){
	configuredServiceProvider.setName('provider name');
})
//определяем контроллер чтобы воспользоваться его зоной видимости $scope
//и передать в jsp страницу переменную rootName
.controller("providerController", function($scope, configuredService) {
    //в $scope кладем переменную rootName со значением "Java Spring MCV and AngularJS"
    //это запрос к $get
	$scope.rootName = configuredService.getName();
    // configuredService.setName('newName')
    // $scope.nameplus=configuredService.name.value();
    //обычный alert
	alert(configuredService.getName());
})
//второй контроллер для вызова второго метода $get
.controller("providerController2", function($scope, configuredService){
    $scope.nameplus=configuredService.getNameplus();
});
<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<%--Описание задачи:
Рассмотреть как применяется routing и templates в AngularJS.
Определение ngRoute, $routeProvider.
Структура проекта с предыдущими частями не поменялась. Рассматриваемая
тема находится в представлении routing.jsp. В статье будут использованы два
шаблона из пакета resources/angularjs/templates (getUser.html и
listUsers.html). Из этого же пакета будут взяты angular-resource.min.js и
angular-route.min.js (они были подключены с самого начала, но именно
здесь мы будем с ними работать).--%>

<%--Описание routing и templates AngularJS--%>
<%--После конфигурации модуля есть возможность использовать routing, т.е.
переключаться между представлениями и контроллерами. Причем представления
могут быть созданы с помощью шаблонов (templates). Для этой задачи в
AngularJS предусмотрен модуль ngRoute. Модуль ngRoute позволяет соединить
контроллер и шаблон по определенному URL (или URL шаблону). Routing в
Angular задается с помощью $routeProvider, который является провайдером
для сервиса $route. Этот сервис позволяет объединять (связывать) вместе
контроллеры, шаблоны представлений и текущий URL в браузере. С помощью
этой возможности можно исключить историю браузера, кнопки вперед\назад
и закладки.

Сервис $route обычно используется вместе с директивой ngView. Роль этой
директивы заключается в том, что в нее будет встроен шаблон представления
для текущего route. Сам шаблон — это какой-либо код представления
(например html страница) в которой прописаны некие переменные.
Эти переменные при связывание будут заполнены данными. Теперь перейдем
к коду, чтобы текст выше стал понятнее.--%>


<page:angular-temaplate>
    <jsp:body>
        <!-- Page Content -->
        <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">AngularJS routing and templates
                    <small>routing and templates</small>
                </h3>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">routing and templates</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        <script>

//Применение routing
//Для использования маршрутизации (routing) нужно подключить
// angular-route.min.js и angular-resource.min.js. Они были подключены
// сразу в начале обзора AngularJS в шаблоне header’а angular-temaplate.tag.
// Это было сделано с помощью импорта js файлов.

//создаем модуль в зависимости которому передаем модуль ngRoute(чтобы в контроллерах
// этого модуля можно было вызывать сервисы ngRoute).
// А так же создадим объект users с несколькими полями
            var app = angular.module('myApp', ['ngRoute']);

            app.controller('ListUserController', function($scope) {
                $scope.users = [
                    {id: '1', name: "user1"},
                    {id: '2', name: "user2"},
                    {id: '3', name: "user3"},
                    {id: '4', name: "user4"},
                    {id: '5', name: "user5"}
                ];
            });

//Создадим еще один контроллер для нашего модуля. В функцию передадим
//специальный сервис $http, который будет обрабатывать REST запросы и
// ответы (этот сервис будет рассмотрен в следующей статье).
// Зададим маппинг в виде ‘/rest/users‘. В случае успешной обработки
// ответа сработает метод success и в переменную users запишутся данные
// ответа
// Здесь следует обратить внимание, что с помощью $http.get(‘/rest/users’)
// будет вызван метод из Spring MVC класса RestTemplateController.
// А именно метод getRestUsers() (он описывался в Работа с JSON и XML
// (преобразование объектов) в Spring MVC. Формирование ответа и обработка
// запроса) Сам метод:
//@RequestMapping(value = "/rest/users", method = RequestMethod.GET)
//public List<RestUserModel> getRestUsers() {
//    System.out.println("RestTemplateController getRestUsers is called");

//    //JSON http://jsonplaceholder.typicode.com/users
//    ResponseEntity<RestUserModel[]> response = restTemplate.getForEntity(
//        EXTERNAL_REST_URL +"/users",
//        RestUserModel[].class
//    );
//    return Arrays.asList(response.getBody());
//}
// С помощью этого метода мы получаем JSON ответ от стороннего
// (внешнего) сервера с перечислением Users.
            app.controller('ListUserControllerJSON', function($scope, $http) {
//когда вызовем этот контроллер пойдет гет запрос на урл этого приложения: '/rest/users'
//а данные ответа запишем в переменную users и по этой переменной проитерируемся в шаблоне listUsers.html
                $http.get('/rest/users').
                        success(function(data, status, headers, config) {
                            $scope.users = data;
                        })
                        .error(function(data, status, headers, config) {
                            alert("error getting data");
                        });
            });

//Еще один контроллер будет использовать сервис $routeParams. Этот сервис
// содержит мапу параметров, которые находятся в маршруте (route) урле: '/users/:userId'.
//с помощью этого примера можно получить id из параметра урла /users/2
            app.controller('GetUserController', function($scope, $routeParams) {
                //routeParams is used for get userId /users/:userId
                $scope.user = {id:$routeParams.userId, name:"Test Name in GetUserController"};
                //id:$routeParams.userId обработает урл '/users/:userId' (привязанный ниже к этому контроллеру)
            });

//Теперь нужно непосредственно задать конфигурацию для модуля ngRoute (вспомните схему
// в начале статьи, где после модуля идет Config).
//В конфигурацию передаем провайдер $routeProvider и далее задаем случаи,
// когда этот провайдер будет срабатывать и что делать.

//При URL /users будет использован шаблон listUsers.html и контроллер
// ListUserController. В шаблоне будут выведены пользователи, которые были
// заданы при определении модуля в самом начале.

//usersJSON использует тот же шаблон, но будет вызван контроллер
// ListUserControllerJSON. Наше приложение отправит запрос по адресу
// /rest/uesers (описан в angular контроллере) и в результате будет вызван
// контроллер из Spring MVC (который замапин на этот URL) —
// RestTemplateController.getRestUsers(). Там будет возвращен JSON ответ,
// который будет вставлен в шаблон listUsers.html.

//users/:userId, где :userId — параметр для ангуляр контроллера
// GetUserController. Он будет подставлен в id:$routeParams.userId вместо
// $routeParams.
//Если ничего не задано или не удовлетворяет условиям в when, то будет
// совершен редирект к /users, т.е. см. первый пункт.
//В проекте использовались два разных шаблона. Они просты,
// очень просты! getUser.html и listUsers.html
            //ngRoute definition
            //a route is defined after #sign #/users/1 or #/usersJSON
            app.config(['$routeProvider',
                function($routeProvider) {
                    $routeProvider.
                    when('/users', {
                        templateUrl: ('/resources/angularjs/templates/listUsers.html'),
                        controller: 'ListUserController'
                    }).
                    when('/usersJSON', {
                        templateUrl: ('/resources/angularjs/templates/listUsers.html'),
                        controller: 'ListUserControllerJSON'
                    }).
                    when('/users/:userId', {
                        templateUrl: ('/resources/angularjs/templates/getUser.html'),
                        controller: 'GetUserController'

                    }).
                    otherwise({
                        redirectTo: '/users'
                    });
                }]);

        </script>



<%--    Подстановка шаблона в представление    --%>
<%--    При маршрутизации наши шаблоны будут
        подставляться вместо участка <div ng-view> </div>.

        По нажатию на ссылки будет происходить переключения между контроллерами    --%>
        <div>

            <h3>AngularJS routing</h3>
<%--            входим в зону действия модуля "myApp"--%>
            <div ng-app="myApp">

<%--            шаблоны вставляются на место этой дериктивы ng-view    --%>
                <div ng-view> </div>
                <div> <br />

<%--            переход по этой ссылке перехватит сервис '$routeProvider' и в этом сервисе
                сработает условие:  when('/users/:userId'... в котором вызовится 'GetUserController'
                и шаблон getUser.html --%>
                    <p> <a href="#/users/2">/users/2 - вызывает GetUserController и шаблон getUser.html</a> </p>
                    <p> <a href="#/usersJSON">#/usersJSON</a> Смотрите RestTemplateController.getRestUsers() где мапится ссылка, используемая в ListUserControllerJSON</p>
                    <p> <a href="#/users">#/users (по дефолту редиректит сюда). Это список ListUserController, заданный на этой странице</a> </p>

                </div>


            </div>

        </div>

        <!-- /.container -->
    </jsp:body>
</page:angular-temaplate>
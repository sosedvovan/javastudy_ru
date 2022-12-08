<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:angular-temaplate>
    <jsp:body>
        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Выражения AngularJS
                        <small>expressions{{ }}</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">Expressions AngularJS</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

                <%-- Модуль AngularJS
                       Приложение Angular состоит из модулей. В модуль могут входить
                       другие модули. Таким образом вы можете считать модуль контейнером
                       для различных частей вашего приложения. Каждый модуль состоит из
                       сервисов, контроллеров, директив, провайдеров и шаблонов.
                       <script>
                        // объявление модуля
                        var myAppModule = angular.module('applicationName', [сюда зависимости опционально]);

                        // настройка модуля.
                        // этот пример создает фильтр "Привет"
                        myAppModule.filter('greet', function() {
                         return function(name) {
                            return 'Hello, ' + name + '!';
                          };
                        });
                        </script>

                        //Hello World!
                        //вызываем модуль, вызываем фильтр greet в
                        //аргументы функции передаем стрингу 'World'
                        //те когда HTML документ будет загружаться,
                        то на этом месте будет запущен модуль
                        <div ng-app="applicationName">
                          <div>
                            {{ 'World' | greet}}
                          </div>
                        </div>
                        angular.module — глобальное определение модуля. Все модули, которые должны
                        быть доступны в приложении должны регистрироваться с помощью этого механизма.
                        applicationName — имя модуля.
                        [ ] — здесь перечисляются зависимости для этого модуля (например сторонние
                        библиотеки).
                        ng-app=’applicationName’ — когда HTML документ будет загружаться, то на этом
                        месте будет запущен модуль с именем applicationName и далее будет вызван
                        фильтр с именем greet.
                        В результате увидим надпись Hello, World!.--%>



            <!-- Content Row -->
            <div class="row">

                <div class="col-lg-12">
                    <script>
                        <%--Контроллер — компонент, который используется для осуществления
                        взаимодействия между сервисами. Сервис — компонент, который
                        используется для связи частей приложения (например сервис для
                        доступа к данным и т.д.). В Angular контроллеры определяются с
                        помощью конструктора JavaScript, в который передается сервис $scope.
                        --%>


                        //задали контроллер для модуля App с именем:
                        // GreetingController с помощью метода controller()

                        //пример: с помощью внедрения зависимостей (Dependency Injection) определили
                        // свойство greeting с значением Preved, medved!:
                        //app.controller('GreetingController', ['$scope', function($scope) {
                        //$scope.greeting = 'Preved, medved!';
                        //}]);
                        //Контроллер присоединяется к DOM с помощью директивы ng-controller.
                        //<div ng-controller="GreetingController">
                        //{{ greeting }}
                        //</div>
                        //Контроллеры необходимо использовать для:
                            // Инициализации объекта $scope.
                            //Добавления поведения к объекту $scope.
                        //Контроллер не следует использовать для:
                            //Манипуляцией DOM. Контроллеры должны содержать только бизнес логику. В ангуляре есть директивы и связывание данных для манипуляции с DOM.
                            //Ввода данных — для этого есть отдельные элементы для управления формами.
                            //Фильтрации вывода — для этого есть фильтры AngularJS.
                            //Открытие доступа к участкам кода или состоянием между контроллерами — для этого используются сервисы Angular.
                            //Управлением жизненным циклом других компонентов (например для создания экземпляра сервиса).



                        //задали модуль application. Это имя потом используется для определения
                        // области действия этого модуля (связывания с DOM) с помощью
                        // директивы ng-app
                        var app = angular.module('application', []);
                        //задали контроллер myController в котором задаем несколько свойств
                        //Эти свойства затем вызываются с помощью конструкции {{ }}.
                        // Эта запись используется в AngularJS для определения выражений
                        app.controller('myController', function($scope) {
                            //определили св-во framework
                            $scope.framework = {name:'Spring MVC Framework'};

                            //определили массив
                            $scope.links = [
                                {link:'http://spring.io/'},
                                {link:'http://javastudy.ru'},
                                {link:'https://yandex.ru'},
                                {someFunction: function() {
                                    return 'someFunctionTest'
                                }
                                }
                            ];

                            //определили функцию
                            $scope.someFunction = function(value) {
                                return 'you put this value: ' + value;
                            };
                        });
                        //$scope - Область видимости, созданная при объявлении директивы ngController;
                        //Scope — объект, который ссылается на модель приложения. Этот объект является
                        // контекстом для выполнения выражений или обработки событий. Scope объекты
                        // имеют иерархию. Обычно, когда вы создаете приложение, то вам необходимо
                        // установить начальное состояние для объекта AngularJS $scope. В предыдущем
                        // примере установка состояния для $scope осуществлялась путем присоединения
                        // свойства greetings к объекту $scope ($scope.greeting = ‘…’)

                        //В общем к характеристикам объектов $scope относят:
                            //Scope объекты предоставляют доступ к $watch для наблюдения за изменениями модели.
                            //Предоставляют доступ к $apply для распространения изменений в модели сквозь систему
                        // к представлению из области действия Angular приложения (контроллеров, сервисов,
                        // обработчиков событий).
                            //Объекты scope могут иметь вложенные объекты для ограничения доступа к свойствам
                        // компонентов приложения. Child scope — наследуют свойства родительского объекта,
                        // а isolated scope — нет.
                            //Scope предоставляет контекст для выполнения выражений. Например выражение
                        // {{username}} не будет иметь смысла до тех пор, пока он не будет привязан к
                        // определенной области видимости ($scope.username=’MyName’).

                        //Так же в примере демонстрируются выражения сложения, конкатенации строк и т.д..
                        // Все они подписаны и тривиальны для понимания.
                    </script>




<%--                    исспользование модуля: --%>
<%--                    определили область действия этого модуля (связывания с DOM)
                        с помощью директивы ng-app--%>
                    <div ng-app="application">

                        <h1>AngularJS expressions</h1>
<%--                    определили область действия этого контроллера    --%>
                        <div  ng-controller="myController">
                        <div>
                                <table class="table table-striped">
                                    <tr>
                                        <td><b>Сложение чисел:</b></td>
                                        <td>{{ 1 + 1 }} </td>
                                    </tr>
                                    <tr>
                                        <td><b>Конкатенация строк:</b></td>
                                        <td>{{ "AngularJS " + " " + "Spring MVC"}} </td>
                                    </tr>
                                    <tr>
                                        <td><b>$scope (св-во framework):</b></td>
                                        <td>{{ framework }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Вызов объекта $scope.framework.name:</b></td>
                                        <td>{{ framework.name }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Массивы $scope.links[1].link:</b></td>
                                        <td><a href="{{ links[1].link }}" target="_blank">{{ links[1].link }}</a></td>
                                    </tr>
                                    <tr>
                                        <td><b>Вызов функции (из $scope.someFunction(123)):</b></td>
                                        <td>{{ someFunction(123) }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Вызов функции (из $scope.links):</b></td>
                                        <td>{{ links[3].someFunction()}}</td>
                                    </tr>
                                </table>

                            1. $scope - Область видимости, созданная при объявлении директивы ngController;
                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <!-- /.row -->

            <hr>

        </div>
        <!-- /.container -->
    </jsp:body>
</page:angular-temaplate>
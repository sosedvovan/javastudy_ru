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
                    <h1 class="page-header">Controller inheritance AngularJS
                        <small>controller inheritance</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">controller inheritance</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

<%--            Контроллеры определяются и присоединяются к HTML DOM с помощью директивы ng-controller.
                После создания контроллера AngularJS к нему присоединяется объект $scope.
                Контроллеры должны использоваться для инициализации переменных в $scope--%>

                <%--файл с внешним контроллером:
                На HTML страницу можно подключить контроллер с помощью стороннего JS файла.
                Это делается путем обычного импорта зависимости на странице.
                Напимер импортируем и в самом низу используем:--%>
            <spring:url value="/resources/angularjs/dependencies/externalController.js" var="appControllerLink"/>
            <script src="${appControllerLink}"></script>


<%--Здесь созданы несколько контроллеров, где у каждого есть свои переменные, но один
контекст $scope. Чтобы продемонстрировать наследование в разных контроллерах были
созданы переменные с одинаковыми именами (firstVar, secondVar)            --%>
            <script>
                <%--//получаем модуль angular--%>
                var app = angular.module('myApp');
                app.controller('FirstController', ['$scope', function($scope) {
                    $scope.zeroVar = 'ZZZ';
                    $scope.firstVar = 'ABC';
                    $scope.secondVar = 'abc';
                    $scope.firstControllerCalled = false;
                }]);

                app.controller('SecondController', ['$scope', function($scope) {
                    $scope.firstVar = 'DEF';
                    $scope.secondVar = 'def';
                }]);

                app.controller('ThirdController', ['$scope', function($scope) {
                    $scope.firstVar = 'GHK';
                    $scope.secondVar = 'ghk';
                }]);

                app.controller('controllerMethodTest', ['$scope', function($scope) {
                    $scope.firstControllerCalled = false;

                    $scope.controllerMethod = function() {
                        $scope.firstControllerCalled = true;
                    }
                }]);

            </script>

                <%--<h3>Наследование контроллеров</h3>--%>
<%--Для того чтобы присоединить контроллер к DOM элементу используется директива
ng-controller. В общем виде каждая новая директива ng-controller создает новую
область видимости (новый $scope) и следовательно у $scope может появиться иерархия.
Контроллеры ниже по иерархии имеют доступ к свойствам и методам вышестоящих контроллеров.            --%>
            <div ng-app="myApp">
                <div ng-controller="FirstController">
                <table class="table">
                    <tr>
                        <td>Переменная firstVar</td>
                        <td>Переменная secondVar</td>
                        <td>Переменная zeroVar</td>
                    </tr>
                    <tr>
                        <td>{{ firstVar }}</td>
                        <td>{{ secondVar }}</td>
                        <td>{{ zeroVar }}</td>
                    </tr>
                    <tr ng-controller="SecondController">
                        <td>{{ firstVar }}</td>
                        <td>{{ secondVar }}</td>
<%--    zeroVar нет в этом контроллере, но мы можем ее взять из вышестоящего контроллера                    --%>
                        <td>{{ zeroVar }}</td>
                    </tr>
                    <tr ng-controller="ThirdController">
                        <td>{{ firstVar }}</td>
                        <td>{{ secondVar }}</td>
                        <td>{{ zeroVar }}</td>
                    </tr>
                </table>
<%--                    Здесь создана таблица, в которой на каждой новой строке выводятся
одни и те же переменные. В результате наследования контроллеров, значения строк с
одинаковыми названиями переменных (firstVar, secondVar) будут переопределяться.
В тоже время для внутренних контроллеров отсутствует переменная zeroVar из первого
контроллера, но они всё равно будут иметь к ней доступ.--%>
                <br />


<%--контроллер с этой страницы--%>
                <p>Кнопка внутри FirstController и controllerMethodTest:</p>
                <div ng-controller="controllerMethodTest">
<%--кнопкой вызываем метод в котором значение переменной  firstControllerCalled изменится с фальш на тру                  --%>
                    <button ng-click="controllerMethod()">controllerMethod</button> <br />
                    <br />
                    Метод, указанный в контроллере на этой странице - controllerMethod вызван: <b>{{ firstControllerCalled }}</b>
                </div>
                <br />

<%--вызов метода из импортированного контроллера externalController внутри FirstController--%>
                <p>Кнопка внутри FirstController и внутри externalController (внешнего):</p>
                <div ng-controller="externalController">
<%--кнопкой вызываем метод в котором                     --%>
                    <button ng-click="externalControllerMethod()">externalControllerMethod</button> <br />
                    Метод внешнего контроллера externalControllerMethod вызван: <b>{{ externalControllerMethodCalled }}</b>
                </div>
            </div>
        </div>

        </div>
        <!-- /.container -->
    </jsp:body>
</page:angular-temaplate>
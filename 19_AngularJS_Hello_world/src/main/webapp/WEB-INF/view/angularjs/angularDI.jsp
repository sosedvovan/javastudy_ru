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
                    <h1 class="page-header">Dependency Injection AngularJS
                        <small>DI</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">AngularJS DI</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

<%--Внедрение зависимостей в AngularJS
AngularJS поддерживает модульную разработку и предоставляет возможность
разделения приложения на слои.
Приложения AngularJS начинаются с определения главного модуля.
Модули могут быть заданы в различных js файлах.
Модули могут быть внедрены в другие модули.
Разработчики могут определять контроллеры, сервисы, фильтры, фабрики, директивы
и т.п. в различных модулях.
Различные модули можно импортировать с помощью <script src=’test.js’> </script>
3.1. Способы внедрения зависимостей
Существует несколько способов внедрения зависимостей в AngularJS.

Использование массива с перечислением (рекомендуется).
Использование свойства $inject.
Непосредственно из имени параметра функции (существуют оговорки)
Итак рассмотрим по порядку. С помощью массива зависимости внедряются следующим образом:
someModule.controller('MyController', ['$scope', 'greeter', function($scope, greeter) {
  // ...
}]);
С помощью $inject:
var MyController = function($scope, greeter) {
  // ...
}
MyController.$inject = ['$scope', 'greeter'];
someModule.controller('MyController', MyController);
С помощью неявного внедрения (через функцию):
someModule.controller('MyController', function($scope, greeter) {
  // ...
});            --%>


<%--Применение внедрения зависимостей в AngularJS:
Сначала мы добавляем на страницу несколько javascript файлов, которые будут предоставлять нам определенный код,
который мы будем внедрять в необходимые html элементы--%>
            <!-- AngularJS myApp -->
            <spring:url value="/resources/angularjs/dependencies/root.js" var="myApp" />
            <script src="${myApp}"></script>

            <!-- AngularJS service -->
            <spring:url value="/resources/angularjs/dependencies/service.js" var="service" />
            <script src="${service}"></script>

            <!-- AngularJS factory -->
            <spring:url value="/resources/angularjs/dependencies/factory.js" var="factory" />
            <script src="${factory}"></script>

            <!-- AngularJS provider -->
            <spring:url value="/resources/angularjs/dependencies/provider.js" var="provider" />
            <script src="${provider}"></script>

<%--если включаю этот импорт не работают эксперешены
тк этот контроллер из другого модуля? конфликтуют импорты--%>
<%--те на одной jsp странице нельзя подключать 2-а разных модуля?            --%>
<%--            <spring:url value="/resources/angularjs/dependencies/externalController.js" var="appControllerLink"/>--%>
<%--            <script src="${appControllerLink}"></script>--%>





<%--            входим в область действия модуля "myApp"--%>
            <div ng-app="myApp">
                <h3>Пример внедрения зависимостей AngularJS</h3>
<%--из-за конфликта импортов работает или этот контроллер или остальные--%>
<%--                <h4>ExternalController:</h4>--%>
<%--                <div ng-controller="externalController">--%>
<%--                    <button ng-click="externalControllerMethod()">externalControllerMethod</button> <br />--%>
<%--                    Метод внешнего контроллера externalControllerMethod вызван: <b>{{ externalControllerMethodCalled }}</b>--%>
<%--                </div>--%>

<%--            входим в область действия контроллера "factoryController"
            когда загрузка дойдет до вызова контроллера factoryController
            будет произведена инициализация переменных с помощью метода
            factory()--%>
                <h4>AngularJS Factory:</h4>
                <div ng-controller="factoryController">
                    {{ angularVersion }}
                </div>


<%--            входим в область действия контроллера "serviceController"--%>
                <h4>Service controller:</h4>
                <div ng-controller="serviceController">
                    <button ng-click="serviceMethod()">service controller call</button>
                </div>



<%--            входим в область действия контроллера "providerController"--%>
                <h4>AngularJS provider:</h4>
                <div  ng-controller="providerController">
                    {{ rootName }}
                </div>
                <div  ng-controller="providerController2">
                    {{ nameplus }}
                </div>


<%--            входим в область действия контроллера "valueController"--%>
                <h4>AngularJS value:</h4>
                <div ng-controller="valueController">
                    someObject value module: {{ rootObject }}
                </div>

<%--                <p>Кнопка внутри FirstController и внутри externalController (внешнего):</p>--%>
<%--                <div ng-controller="externalController">--%>
<%--                        &lt;%&ndash;кнопкой вызываем метод в котором                     &ndash;%&gt;--%>
<%--                    <button ng-click="externalControllerMethod()">externalControllerMethod</button> <br />--%>
<%--                    Метод внешнего контроллера externalControllerMethod вызван: <b>{{ externalControllerMethodCalled }}</b>--%>
<%--                </div>--%>

            </div>


<%--на одной jsp странице не хочет работать этот контроллер одновремменно м другими почемуто--%>
<%--        <div ng-app="myApp">--%>
<%--            <h4>ExternalController:</h4>--%>
<%--            <div ng-controller="externalController">--%>
<%--                <button ng-click="externalControllerMethod()">externalControllerMethod</button>--%>
<%--                {{ testvalue }}--%>
<%--                {{ externalControllerMethodCalled }}--%>
<%--            </div>--%>
<%--        </div>--%>


        </div>
        <!-- /.container -->
    </jsp:body>
</page:angular-temaplate>
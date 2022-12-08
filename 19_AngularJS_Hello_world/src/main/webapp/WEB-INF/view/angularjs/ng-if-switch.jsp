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
                    <h1 class="page-header">if, switch в AngularJS
                        <small>ng-if ng-switch</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">AngularJS ng-if, ng-switch</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <!-- Content Row -->
            <div class="row">

                <div class="col-lg-12">

                    <script>
                        //заведем модуль
                        var app = angular.module('myAppModule', []);
                        app.controller('myController', function($scope) {
                //в область видимости данного модуля $scope
                //положим именованный объект someArray с инициализированными полями
                            $scope.someArray = {
                                name: "Some Name in Array var",
                                developer: "javastudy.ru",
                                link: "http://javastudy.ru"
                            }
                        })
                    </script>

<%--                    в области видимости данного модуля и контроллера--%>
                    <div ng-app="myAppModule" ng-controller="myController">
                        <pre>
                            <code>
                                var app = angular.module('myAppModule', []);
                                app.controller('myController', function($scope) {
                                        $scope.someArray = {
                                            name: "Some Name in Array var",
                                            developer: "javastudy.ru",
                                            link: "http://javastudy.ru"
                                        }
                                })
                            </code>
                        </pre>
<%--                    С помощью директивы ng-if можно показать или убрать целый кусок DOM на
                        основании выражения, указанного в атрибуте. Эта директива отличается от
                        ng-show, ng-hide тем, что полностью убирает элемент из дерева DOM,
                        а не добавляет к нему какого-либо css стиля    --%>
                        <h3>Пример if (ng-if) в AngularJS</h3>
<%--                    выражение в ng-if верное значит покажим этот div    --%>
                        <div class="bg-success" ng-if="someArray.name == 'Some Name in Array var'">
                            <p>ng-if == someArray.name == 'Some Name in Array var'</p>
                        </div>
<%--                    выражение в ng-if тоже верное значит покажим этот div    --%>
                        <div class="bg-warning" ng-if="someArray.developer != 'yandex.ru'">
                            <p>ng-if == someArray.developer != 'yandex.ru'</p>
                        </div>



<%--                   Директива ng-switch позволяет переключаться между значениями объекта
                        (например массива) и в случае выполнения логического выражения покажет
                        или скроет DOM элемент. В нашем случае будет показан только элемент для
                        которого значения link=’javastudy.ru’     --%>
                        <h3>Пример switch (ng-switch)</h3>
<%--                        в on кладем одно из полей нашего объекта--%>
                        <div ng-switch on="someArray.link">
<%--                        если значение в поле someArray.link="http://javastudy.ru" тогда покажем этот  div   --%>
                            <div class="bg-success" ng-switch-when="http://javastudy.ru">
                                <p>ng-switch when="http://javastudy.ru"</p>
                            </div>
                            <div class="bg-success" ng-switch-when="yandex.ru">
                                <p>ng-switch when="yandex.ru"</p>
                            </div>
                            <div class="bg-warning" ng-switch-default>
                                <p>ng-switch-default</p>
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
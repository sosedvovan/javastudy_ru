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
                    <h1 class="page-header">Итерации и сортировка AngularJS
                        <small>ng-repeat</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">AngularJS ng-repeat, orderBy</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <script>
                //заведем модуль
                var app = angular.module('myAppModule', []);
                app.controller('myController', function($scope) {
                    //в область видимости данного модуля $scope
                    //положим массив с анонимными объектами
                    $scope.someArray = [
                        {name: "Name1", developer: "javastudy.ru", link: "http://javastudy.ru"},
                        {name: "David Blaine", developer: "Copperfield", link: "http://mag.ic"},
                        {name: "Murzik", developer: "Murka", link: "http://welovecats.com"},
                        {name: "Z", developer: "X", link: "http://example.com"}
                    ]
                })
            </script>
            <!-- Content Row -->
            <div class="row">

                <div class="col-lg-12">
<%--                заходим в область действия модуля--%>
                    <div ng-app="myAppModule">
<%--                заходим в область действия контроллера--%>
                        <div ng-controller="myController">
                            <h3>Пример ng-repeat, $index, $last</h3>
<%--                Директива ng-repeat позволяет пройтись по коллекции
                    элементов от начала и до конца            --%>
                            <table class="table">
<%--            задали переменную итерации row в массиве someArray               --%>
                                <tr ng-repeat="row in someArray">
<%--                в первой колонке будут индексы элеменов массива                    --%>
                                    <td style="padding-right: 0.5em"> {{ $index }} <td>
                                    <td> {{ row.name }} </td>
                                    <td> {{ row.developer }} </td>
                                    <td> {{ row.link }} </td>
<%--                $last=true если элемент последний в итерации                    --%>
                                    <td> Последний элемент? = {{ $last }}</td>
<%--                $index  Итератор для повторяющихся элементов (0..length-1)
                    $first  true если элемент первый в итераторе.
                    $middle  	true если элемент находится между первым и последним в итераторе.
                    $last  true если элемент последний в итераторе
                    $even  true позиция в итераторе $index четная (в противном случае false).
                    $odd  true позиция в итераторе $index нечетная (в противном случае false).--%>
                                </tr>

                            </table>
                            <h3>Сортировка по 'name'</h3>
                            <table class="table">
                                <tr ng-repeat="row in someArray | orderBy :'name'">
                                    <td style="padding-right: 0.5em"> {{ $index }} <td>
                                    <td> {{ row.name }} </td>
                                    <td> {{ row.developer }} </td>
                                    <td> {{ row.link }} </td>
                                    <td> Последний элемент? = {{ $last }}</td>
                                </tr>

                            </table>

                            <h3>Сортировка по 'name' в обратном порядке </h3>
                            <table class="table">
                                <tr ng-repeat="row in someArray | orderBy :'name' :true">
                                    <td style="padding-right: 0.5em"> {{ $index }} <td>
                                    <td> {{ row.name }} </td>
                                    <td> {{ row.developer }} </td>
                                    <td> {{ row.link }} </td>
                                    <td> Последний элемент? = {{ $last }}</td>
                                </tr>

                            </table>

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
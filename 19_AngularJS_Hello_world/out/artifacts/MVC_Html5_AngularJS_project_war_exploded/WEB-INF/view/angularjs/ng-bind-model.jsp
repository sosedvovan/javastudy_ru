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
                    <h1 class="page-header">Связывание и модель в AngularJS
                        <small>ng-bind, ng-model</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">AngularJS ng-bind, ng-model</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <!-- Content Row -->
            <div class="row">

                <div class="col-lg-12">

<%--            Понятие модели AngularJS        --%>
<%--            Модель — данные, представленные пользователю в представлении и с
                которым взаимодействует пользователь. Работа с моделью
                в AngularJS осуществляется с помощью директивы ng-model.
                Например в запись:
                <input type="text" ng-model="userName"/>
                связывает переменную userName с веденными в компонент input данными.        --%>

<%--            Связывание с моделью в AngularJS
                Связать значение какой-либо переменной с компонентом DOM можно с
                помощью директивы ng-bind:
                Java
                <span style="color:green" ng-bind="userPass"> </span>
                На этом участке html странице будет выведено значение переменной
                userPass зеленым цветом--%>


                    <div ng-app>
                        <h3>Пример связывание и использование модели AngularJS</h3>
                        <div>
                            <table>
                                <tr>
                                    <td><b>Имя пользователя:</b></td>
                                    <%--введеный в поле текст будет доступен по ключу "userName" --%>
                                    <td><input type="text" ng-model="userName"/></td>
                                </tr>
                                <tr>
                                    <td><b>Пароль:</b></td>
                                    <td><input type="text" ng-model="userPass"/></td>
                                </tr>
                                <tr>
                                    <td><b>Email:</b></td>
                                    <td><input type="text" ng-model="email"/></td>
                                </tr>
                            </table>
                        </div>

                        <br />
<%--                    {{userName}} означает - взять по ключу "userName"    --%>
                        Привет, {{userName}}! Это пример использования модели в AngularJS.<br />
                        Введенный пароль: {{ userPass }} <br />
                        Email: {{ email }} <br />
                        <br />А здесь то же самое, но через связывание: <br />
<%--                    ng-bind="userName" означает - взять по ключу "userName"    --%>
                        Имя <span style="color:red" ng-bind="userName"> </span> <br />
                        Пароль <span style="color:green" ng-bind="userPass"> </span> <br />
                        Почта <span style="color:blue" ng-bind="email"> </span><br />
                        Обратите внимание, что если использовать конструкцию < span/> вместо < span> < / span>, то
                        хром проглотит последующие после первого автозакрытого элемента элементы.

                    </div>

                </div>

            </div>
            <!-- /.row -->

            <hr>

        </div>
        <!-- /.container -->
    </jsp:body>
</page:angular-temaplate>
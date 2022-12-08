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
                    <h1 class="page-header">Двунаправленное связывание AngularJS
                        <small>two way binding</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">AngularJS two way binding</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <script>
            //Инициализируем модуль AngularJS и несколько переменных
                var app = angular.module('myModule', []);
                //в контроллере Созданы два метода
                app.controller('myController', function($scope) {
                    //в $scope кладем переменную
                    $scope.siteName = 'javastudy.ru';
                    //в $scope кладем метод переключение стиля у элемента toggleId
                    $scope.clickMethod = function() {
                        //получаем елемент html
                        var toggleMe = document.getElementById('toggleId');
                        //у элемента меняем стиль(если был цвет red то станет green)
                        toggleMe.style.color = toggleMe.style.color === 'red' ? 'green' : 'red';
                    };
                //метод изменения названия переменной siteName:
                    //в $scope кладем метод принимающий наше какое-то значение
                    $scope.changeSiteName = function(value) {
                        //переменной объявленной выше меняем значение нп наше значение
                        $scope.siteName = value;
                        //alert - вывода в браузере предупреждающего модального диалогового окна
                        // с некоторым сообщением и кнопкой «ОК»
                        alert($scope.siteName);
                    }
                });

            </script>
            <!-- Content Row -->
                <div class="col-lg-12">

<%--                p элемент, который будет менять цвет при введении данных или при срабатывании
                    метода из контроллера angular--%>
                    <p id="toggleId" style="color:red;">ПЕРКЛЮЧАЮЩИЙСЯ ТЕКСТ</p>

<%--                блок действия модуля и контроллера--%>
                    <div ng-app="myModule" ng-controller="myController">

<%--                кликаем на button(запускаем метод) - меняем цвет  в id="toggleId"       --%>
                    <button ng-click='clickMethod()'>Вызвать clickMethod</button>

                        <h3>Пример связывания и использование модели AngularJS</h3>
<%--                на месте выражения {{ bindingValue }} появится то что ввели в #11111--%>
                        <strong>Связанный параметр bindingValue: </strong> {{ bindingValue }} <br />
        <%--             #11111--%>
                        <label>Связать с параметром bindingValue: </label>
<%--                 директива ng-change=’clickMethod()’, с помощью которой при изменении компонента
                     input будет вызван метод clickMethod()--%>
                        <input type="text" ng-model="bindingValue" ng-change="clickMethod()"/>
                        <br />
                        <br />


<%--                в теге span появится текст кот введем в #22222
                    связывание элемента span с моделью данных siteName--%>
                        <strong>Пример: название сайта: </strong> <span ng-bind="siteName"> </span>
<%--                     #22222   --%>
                        <label>Поменять параметр siteName через вызов js метода "newSiteName": </label>
                        <input type="text" ng-model="newSiteName" /> <br />
<%--                кликаем на button(запускаем метод changeSiteName в переменные которого посылаем newSiteName)
                    директива ng-click срабатывает по клику--%>
                        <button ng-click='changeSiteName(newSiteName)'>Вызвать changeSiteName</button>



                        <br /><br />
<%-- выпадающий список. при выборе из него элемента этот элемент печатается рядом со списком--%>
                        <select ng-model="selectedValue">
                            <option value="test1">test1</option>
                            <option value="test2">test2</option>
                            <option value="test3">test3</option>
                        </select> {{selectedValue}}<br/><br/>

<%--    радиокнопки(выбор цвета): выбираем одну из них и рядом печатаем выбранный цвет(цветом)--%>
                        <input type="radio" name="selectedColor" value="Red" ng-model="selectedColor">Red</input>
                        <input type="radio" name="selectedColor" value="Green" ng-model="selectedColor">Green</input>
                        <span style="color:{{selectedColor}}">{{selectedColor}}</span>

                        <br/><br/>
<%--    аналогично с чекбоксами--%>
                        CheckBox1 <span ng-bind="checkBox1"></span><input type="checkbox" value="testCheckBox1" ng-model="checkBox1"><br/>
                        CheckBox2 <span ng-bind="checkBox2"></span><input  type="checkbox" value="testCheckBox2" ng-model="checkBox2"><br/>
                    </div>

                </div>

            </div>
            <!-- /.row -->

            <hr>

        </div>
        <!-- /.container -->
    </jsp:body>
</page:angular-temaplate>
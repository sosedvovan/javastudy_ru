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
                    <h3 class="page-header">AngularJS form validation
                        <small>validation</small>
                    </h3>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">form validation</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <script>
//В AngularJS существует реализация стандартных форм для ввода из HTML5 (text,
// number, url, email, date, radio, checkbox). В том числе предоставляются
// директивы для валидации: required, pattern, minlength, maxlength, min, max.
// С помощью собственной директивы и функции можно добавить к объекту
// $validators свой собственный валидатор. AngularJS использует следующие
// CSS классы при валидации форм.

//ng-valid: true, если модель валидна
//ng-invalid: true, если модель не прошла валидацию
//ng-valid-[key]: true для каждого валидного ключа. Добавлено с помощью $setValidity
//ng-invalid-[key]: true для каждого не валидного ключа. Добавлено с помощью $setValidity
//ng-pristine: true, если с формой еще не взаимодействовали
//ng-dirty: устанавливается в true, если с формой взаимодействовали
//ng-touched: true, если управление было передано (потеря фокуса)
//ng-untouched: true, если форма еще не потеряла фокус
//ng-pending: true, если если любой из $asyncValidators еще не выполнен
//Для каждого класса есть соответствующее свойство в контроллере.
// Например $valid, $dirty, $pristine и т.д.

//Применение валидации в AngularJS

//Простенький скрипт, который сообщит нам о результатах
// валидации введенных в форме данных.
                //получаем модуль
                var app = angular.module('myApp', []);
                //получаем контроллер
                app.controller('userController', function($scope) {
                    //в $scope кладем функцию с 2-мя алертами
                    $scope.submitForm = function() {
                        if ($scope.userForm.$valid) {
                            alert('User form is valid');
                        }else{
                            alert('User form is NOT valid')
                        }
                    };
                });
            </script>

            <div>

                <h3>AngularJS form validation</h3>
<%--                входим в зону нашего модуля и его контроллера--%>
                <div ng-app="myApp" ng-controller="userController">
                    <!-- novalidate option on forms will disable HTML5 related validations -->

                    <!--
                    Specific AngularJS Form Properties

                    Accessing input AngularJS properties
                    syntax: formName.AngularJSProperty
                    example: userForm.$invalid

                    $invalid: style class:ng-invalid The content of the field is invalid
                    $valid:   style class:ng-valid The content of the field is valid
                    $touched: style class:ng-touched The form or input has been blurred
                    $pristine: style class:ng-pristine The form or input has NOT been used
                    $dirty: style class:ng-dirty The form or input has been used

                    Accessing input AngularJS properties
                    syntax: formName.fieldName.AngularJSProperty
                    example: userForm.username.$invalid

                     -->

                    <form name="userForm" novalidate>
                        <div style="width: 250px">
                            <table class="table table-striped">
                                <tr><td>Username:</td>
<%--                                включили проверку: заполненно ли поле    --%>
                                    <td><input type="text" name="username" ng-model="user.username" ng-required="true" />
<%--	  		след span покажем: если "userForm.username.$invalid" (если нет вообще никаких ошибок в поле username)
			    (используем св-во для валидации форм $invalid)--%>
                        <span style="color:red" ng-show="userForm.username.$invalid">
<%--            и если ошибка будет имеено такая : "userForm.username.$error.required" = тру для ng-show(если поле не заполненно)--%>
  							<span ng-show="userForm.username.$error.required">Username is required</span>
  						</span>
                                    </td>
                                </tr>

<%--            пароль не валидируем--%>
                                <tr><td>Password</td><td><input type="password" ng-model="user.password"/></td></tr>




                                <tr>

                                    <td>Email</td>
                                    <td><input type="email" name="useremail" ng-model="user.useremail"
                                               pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" ng-required="true"/>

                                    <span style="color:red" ng-show="userForm.useremail.$error.required">not required</span>
                                    <span style="color:red" ng-show="userForm.useremail.$error.pattern">Useremail is not valid</span>
                                    </td>
                                </tr>

<%--                                нажатие на button вызовет метод в конроллере в котором проверится userForm.$valid--%>
                                <tr><td colspan="2" align="left"><button ng-click="submitForm()">Submit</button>  </td></tr>

                            </table>
                        </div>
                    </form>

<%--идет использование этих свойств для для вывода значения каждого из свойств--%>

<%--            по имени формы посмотрим на все сво-ва формы--%>
                    Form: <br/>
                    <pre><code>{{userForm}}</code></pre>
                    Form is valid: <br/>
<%--            посмотрим только на одно св-во формы $valid--%>
                    <pre><code>{{userForm.$valid}}</code></pre>
                    User: <br/>
<%--            user  -  {"username":"еннн","password":"еее"}  показывает объект - введенный username и пароль      --%>
                    <pre><code>{{user}}</code></pre>
                    username $pristine: <br/>
<%--            $pristine: true, если с формой еще не взаимодействовали--%>
                    <pre><code>{{userForm.username.$pristine}}</code></pre>
                    username $valid: <br/>
<%--            $valid: true, если модель валидна--%>
                    <pre><code>{{userForm.username.$valid}}</code></pre>
                    username $invalid: <br/>
                    <pre><code>{{userForm.username.$invalid}}</code></pre>
                    username $touched: <br/>
<%--            $touched: true, если управление было передано (потеря фокуса)        --%>
                    <pre><code>{{userForm.username.$touched}}</code></pre>
<%--            $dirty: устанавливается в true, если с формой взаимодействовали--%>
                    username $dirty: <br/>
                    <pre><code>{{userForm.username.$dirty}}</code></pre>

                </div>
            </div>

            </div>

        </div>
        <!-- /.container -->
    </jsp:body>
</page:angular-temaplate>
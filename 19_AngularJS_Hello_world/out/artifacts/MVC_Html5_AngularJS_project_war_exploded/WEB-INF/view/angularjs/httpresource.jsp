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
                    <h3 class="page-header">AngularJS http resource
                        <small>http resource</small>
                    </h3>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">http resource</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <script>
// Описание $http и $resource
//$http — это сервис, который используется для вызова REST сервисов.
// $http сервис это основа Angular для коммуникации с удаленным HTTP
// сервером через XMLHttpRequest объект или через JSONP. $http сервис это
// функция, которая принимает на вход только один аргумент —
// объект конфигурации, который используется для создания HTTP
// запроса и возврата ответа:

//// Simple GET request example:
//$http({
//    method: 'GET',
//    url: '/someUrl'
//}).then(function successCallback(response) {
//    // this callback will be called asynchronously
//    // when the response is available
//}, function errorCallback(response) {
//    // called asynchronously if an error occurs
//    // or server returns response with an error status.
//});

//Объект ответа (получаемый в .then(...))будет обладать следующими свойствами:
//data – {string|Object} – тело ответа, которое будет преобразовано с помощью преобразовывающих функций.
//status – {number} – код статуса HTTP ответа.
//headers – {function([headerName])} – Header getter функции.
//config – {Object} – конфигурационный объект, который используется для создания запроса.
//statusText – {string} – HTTP статус текст ответа.

// а $resource используется для create, read, update, delete операций (CRUD)

//ниже используется Spring MVC контроллер - класс RestTemplateController, который
// описывается в Работа с JSON и XML (преобразование объектов) в Spring MVC.
// Формирование ответа и обработка запроса. Так же может быть интересна
// предыдущая часть, в которой немного рассматривается работа $http сервиса.


//Сначала мы создаем модуль в зависимость которого добавляется модуль ngResource.
// Далее задается контроллер в котором описаны GET или POST методы. Эти запросы
// будут перехватываться Spring MVC контроллером с соответствующим @RequestMapping
                var app = angular.module('myApp', ['ngResource']);

//Создаем контроллер и передаем в функцию сервис $http. Он использует метод
// get() с указанием URL. Этот URL будет обработан Spring MVC контроллером:
//
// @RequestMapping(value = "/rest/posts/{param}", method = RequestMethod.GET)
// public RestPostsModel getRestPostsById(@PathVariable("param") String param) {
//     System.out.println("RestTemplateController getRestPostsById is called");
//
//     ResponseEntity<RestPostsModel> response = restTemplate.getForEntity(
//         EXTERNAL_REST_URL +"/posts/" + param,
//         RestPostsModel.class
//     );
//     return response.getBody();
// }
// и вернет ответ, который будет записан в объект post.
//который мы и увидим на странице в браузере.
                app.controller('JSONController', function($scope, $http) {
                    $http.get('/rest/posts/13').
                    success(function(data, status, headers, config) {
                        $scope.post = data;
                        console.log(data);
                    }).
                    error(function($data, status, $headers, config) {
                        alert("error getting data");
                    });

//В модуле описан объект post, который соответствует по структуре java классу RestPostsModel.
//объект для тестового сохранения в след методе контроллера:
                    //test JSON as post
                    var post = {
                        userId: 'test',
                        id : '1',
                        title : 'test',
                        body: 'test'
                    };



//Далее рассматривается использование метода post
//Всё аналогично. Этот запрос обработает mvc контроллер с помощью метода savePost:

//JSON SAVES a post. Uses in angularjs/httpresource.jsp
// @RequestMapping(value = "/rest/savePost", method = RequestMethod.POST)
// @ResponseStatus(value = HttpStatus.OK)
// public void savePost(@RequestBody RestPostsModel postJSON) {
//
// System.out.println("savePost postJSON.getUserId(): " + postJSON.getUserId());
// System.out.println("savePost postJSON.getTitle(): " + postJSON.getTitle());
// System.out.println("savePost postJSON.getId(): " + postJSON.getId());
// System.out.println("savePost postJSON.getBody(): " + postJSON.getBody());
// System.out.println("@RestTemplateControllerExample savePost is called");
// }

                    //$http
                    $http.post('/rest/savePost', post).
                    success(function(data, status, headers, config) {
                        $scope.post = data;
                        console.log(data);
                    }).
                    error(function(data, status, headers, config) {
                        //покажет этот алерт тк у нас нет спринг мвс контроллера
                        //отслеживающего урл '/rest/savePost'
                        alert("error post data");
                    });
                });

//конфигурируем объект $resource с именем "Posts" и потом его используем в контроллерах ниже.
//При конфигурации объекта $resource с именем "Posts", сразу будет возвращен URL, который вызовет
// метод удаления объекта post с id, который указывается с помощью параметра
// (в нашем случае id:1).
                //$resource
                //$resource configuration object is Posts used for CRUD
                app.factory("Posts", function($resource) {
                    return $resource("/rest/delPosts/:id");
                });

                //$resource
                //get post id mapped to @RestTemplateController getRestPostsById
                app.controller("PostQueryByIdController", function($scope, Posts) {
                    //объекту "Posts" передаем id: 1, тот кот хотим удалить
                    //перейдя по урлу "/rest/delPosts/:id"
                    Posts.get({ id: 1 }, function(data) {
                        $scope.posts = data;
                        console.log(data);
                    });
                });

//еще один способ удалить объект:
//Так же был создан второй контроллер, который использует HTTP метод delete.
                //$resource
                //delete a post mapped to @RestTemplateController deletePostByIDAngular
                app.controller("DeletePostByIdController", function($scope, Posts) {
                    Posts.delete({ id: 4 })
                });

            </script>

<%--В представлении результаты будут выводиться с помощью следующего кода.            --%>
            <h3>AngularJS routing</h3>
            <div ng-app="myApp">
                <div ng-controller="JSONController">
                    <table class="table">
                        <tr>
                            <td><b>userid</b></td>
                            <td>{{ post.userId }}</td>
                        </tr>
                        <tr>
                            <td><b>id</b></td>
                            <td>{{ post.id }}</td>
                        </tr>
                        <tr>
                            <td><b>title</b></td>
                            <td>{{ post.title}}</td>
                        </tr>
                        <tr>
                            <td><b>body</b></td>
                            <td>{{ post.body }}</td>
                        </tr>
                    </table>

                    <!--
                    change link to $http.get('/rest/posts/') in controller and get 100 posts!
                    <table class="table" ng-repeat="p in post">
                        <tr><td><b>userid</b></td><td>{{ p.userId }}</td></tr>
                    </table> -->

<%-- Как видите в конце вызываются два angular контроллера. В результате
последовательного вызова их методов в IDE консоли мы увидим последовательность
вызова Spring MVC методов (если вызвать другие контроллеры)                  --%>
<%-- и в консоли мы увидим:
savePost postJSON.getUserId(): test
savePost postJSON.getTitle(): test
savePost postJSON.getId(): 1
savePost postJSON.getBody(): test
@RestTemplateControllerExample savePost is called
RestTemplateController getRestPostsById is called
@RestTemplateControllerExample deletePostByID is called
@RestTemplateControllerExample deletePostByID is called                   --%>
                    <div ng-controller="PostQueryByIdController">{{posts}}</div>
                    <div ng-controller="DeletePostByIdController"> </div>


                </div>

            </div>

        </div>
        <!-- /.container -->
    </jsp:body>
</page:angular-temaplate>
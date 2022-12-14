<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:template>
    <jsp:body>
        <%--Page Content--%>
        <div class="container">
            <!-- Page Heading/Breadcrumbs -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">JSON Stringify
                        <small>примеры JSON</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">Пример JSON.stringify</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->


            <c:url value="/uploadFile" var="fileUploadControllerURL" />
            <!-- Content Row -->
                <%--<div class="row">--%>

                <%--<div class="col-lg-12">--%>
            <pre>
<b>1. Объекты в JavaScript</b>
<code>
var simpleObject = {
title: 'Simple JS Object title',
developer: 'javastudy.ru'
};
var jsonSimpleObject = JSON.stringify(simpleObject);
(в скрипте будет использована строчка JSON.stringify(simpleObject, null, 0),
где 0 - не форматированный вывод, 1 - форматированный вывод.
var simpleObjectParsed = JSON.parse(jsonSimpleObject);
document.getElementById("resultStringify").innerHTML = jsonSimpleObject;
document.getElementById("resultParse").innerHTML = simpleObjectParsed.title;
</code>
</pre>
            <pre>
<b>Результат JSON.stringify(simpleObject)</b>
<code id="resultStringify">

</code>
</pre>

            <pre>
<b>Результат JSON.parse(jsonSimpleObject)</b>
<code id="resultParse">
</code>
</pre>
            <script type="text/javascript">
                //имеется такой объект
                var simpleObject = {
                    title: 'Simple JS Object title',
                    developer: 'javastudy.ru'
                };
                //объект переводим в строку JSON(возможно с заменой значений, если указана функция замены)
                var jsonSimpleObject = JSON.stringify(simpleObject, null, 0); //1 - space pretty print
                //строку JSON разбираем в обычный собъект(возможно с преобразованием получаемого)
                var simpleObjectParsed = JSON.parse(jsonSimpleObject);
                //делаем внутренние HTML переменные для тега <pre><code id="resultParse"></pre>
                document.getElementById("resultStringify").innerHTML = jsonSimpleObject;
                document.getElementById("resultParse").innerHTML = 'title: ' + simpleObjectParsed.title +'; developer: ' + simpleObjectParsed.developer;
            </script>
            <pre>


<b>2. Массивы в JavaScript</b>
<code>
var arrayObject = ['ZeroElement', 'FirstEl' , 'SecondElem'];
var jsonArrayObj = JSON.stringify(arrayObject,null, 1);
document.getElementById('resultJsonArrayObj').innerHTML = jsonArrayObj;
var arrayParsed = JSON.parse(jsonArrayObj);
document.getElementById('resultArrayParsed').innerHTML = arrayParsed[0];
</code>
</pre>
            <pre>
<b>Результат jsonArrayObj (JSON.stringify)</b>
<code id="resultJsonArrayObj">
</code>
</pre>
            <pre>
<b>Результат arrayParsed[0] (JSON.parse)</b>
<code id="resultArrayParsed">
</code>
</pre>
            <script type="text/javascript">
                //JavaScript массив задается с помощью перечисления значений
                // в квадратных скобках через запятую
                var arrayObject = ['ZeroElement', 'FirstEl' , 'SecondElem'];
                //массив переведем в строку JSON
                var jsonArrayObj = JSON.stringify(arrayObject,null, 1);
                //выведем JSON в теге <pre>
                document.getElementById('resultJsonArrayObj').innerHTML = jsonArrayObj;
                //строку JSON разбираем в обычный объект-массив
                var arrayParsed = JSON.parse(jsonArrayObj);
                //возьмем 0-ой элемент из обычного объекта-массива м выведем в теге <pre>
                document.getElementById('resultArrayParsed').innerHTML = arrayParsed[0];
            </script>
            <pre>
<b>3. Массивы объектов в JavaScript</b>
<code>
var arrayObjects = {
innerObjects: [
{name: 'firstObjectName', index:'first'},
{name: 'secondObjectName', index:'second'}
]
};
var jsonArrayObjects = JSON.stringify(arrayObjects, null, 1);
document.getElementById('resultJsonArrayObjects').innerHTML = jsonArrayObjects;
document.getElementById('resultObjectArray').innerHTML = arrayObjects.innerObjects[1].name;
</code>
</pre>
            <pre>
<b>Результат jsonArrayObjects (JSON.stringify)</b>
<code id="resultJsonArrayObjects">
</code>
</pre>
            <pre>
<b>Результат arrayObjects.innerObjects[1].name</b>
<code id="resultObjectArray">
</code>
</pre>
            <script type="text/javascript">
                //Массивы объектов JavaScript
                //создаем объект, содержащий в себе поле
                //с массивом других анонимных объектов
                var arrayObjects = {
                    innerObjects: [
                        {name: 'firstObjectName', index:'first'},
                        {name: 'secondObjectName', index:'second'}
                    ]
                };
                //преобразуем в JSON
                var jsonArrayObjects = JSON.stringify(arrayObjects, null, 1);
                //покажем JSON всего объекта в <pre>
                document.getElementById('resultJsonArrayObjects').innerHTML = jsonArrayObjects;
                //у объекта обратимся к его полю-массиву и возьмем 1-й элемент
                document.getElementById('resultObjectArray').innerHTML = arrayObjects.innerObjects[1].name;
            </script>
            <pre>
<b>4. Nested Object в JavaScript</b>
<code>
var nestedObject = {
name: 'Some Nested Object',
developer: 'javastudy.ru',
information: {
year: 2016,
site: 'https://javastudy.ru'
}
};
document.getElementById('nestedObjectFull').innerHTML = nestedObject;
document.getElementById('nestedObjectInfo').innerHTML = nestedObject.information;
</code>
</pre>
            <pre>
<b>Результат nestedObject.name</b>
<code id="nestedObjectName">
</code>
</pre>
            <pre>
<b>Результат nestedObject.information.year</b>
<code id="nestedObjectInfoYear">
</code>
</pre>
            <script type="text/javascript">
                //Nested(вложенный именнованный) объект JavaScrip
                //объект JavaScript создается путем определения внутри JS
                // объекта еще одного вложенного объекта. В данном примере
                // nested объектом является information
                var nestedObject = {
                    name: 'Some Nested Object',
                    developer: 'javastudy.ru',
                    information: {
                        year: 2016,
                        site: 'https://javastudy.ru'
                    }
                };
                //выведем поле name: внешнего объекта information
                document.getElementById('nestedObjectName').innerHTML = nestedObject.name;
                //выведем поле year: вложенного объекта
                document.getElementById('nestedObjectInfoYear').innerHTML = nestedObject.information.year;
            </script>
        </div>
        <%--</div>--%>
        <!-- /.row -->
        <hr>
        <%--</div>--%>
        <!-- /.container -->
    </jsp:body>
</page:template>
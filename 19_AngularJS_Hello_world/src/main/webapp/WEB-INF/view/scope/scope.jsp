<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:template>
    <jsp:body>
        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Сохранение объекта
                        <small>в session, request, view scope</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">Пример работы с scope</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <c:url value="/scopeSession" var="scopeSession" />
            <c:url value="/invalidateSession" var="invalidateSession" />
            <c:url value="/scopeRequest" var="scopeRequest" />
            <c:url value="/file.html" var="file" />
            <!-- Content Row -->
            <div class="row">

<%--        Объекты из разных областей видимости вызываются с помощью такой записи:
<p>Объект в сессии </p>
<p><b>SessionScope attribute:</b> ${sessionScope.sessionObject} </p>

<p>Объект в области видимости request</p>
<p><b>Request attribute: </b> ${requestScope.requestObject} </p>

Объект в области видимости request будет обновляться при каждом
новом запросе (например просто обновив страницу)--%>
                <div class="col-lg-12">
                    <p>Объект в сессии </p>
                    <p><a href="${scopeSession}">Set object in session</a> </p>
                    <p> <a href="${invalidateSession}">Invalidate Session</a> </p>
                    <p><b>SessionScope attribute:</b> ${sessionScope.sessionObject} </p>
                    <br />

                    <p>Объект в области видимости request</p>
                    <a href="${scopeRequest}">Set object in request</a>
                    <p><b>Request attribute: </b> ${requestScope.requestObject} </p>
                    <br />
<%--                    Для того, чтобы проверить сохранение объекта в сессии в
конце страницы была добавлена ссылка на переход к другому представлению (file.jsp),
где так же вызывается ${sessionScope.sessionObject}--%>
                    <p><a href="${file}">Проверить на другой странице</a></p>
                </div>

            </div>
            <!-- /.row -->

            <hr>

        </div>
        <!-- /.container -->
    </jsp:body>
</page:template>
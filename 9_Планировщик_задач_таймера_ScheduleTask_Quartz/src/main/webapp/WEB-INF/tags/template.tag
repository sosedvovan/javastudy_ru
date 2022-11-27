<!DOCTYPE html>
<%@tag description="Template Site tag" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@attribute name="title" fragment="true" %>

<%--7.1 Использование шаблонов
Начиная с этой части в приложении будут использованы шаблоны для построения страниц.
Т.к. на всех страницах у нас повторяется header и footer, то они были вынесены в файл
template.tag. Описание применения шаблонов не входит в тему статьи, но кратко опишу на что
обратить внимание. В начале .tag или .jsp страницы прописывается такая конструкция:

ДЛЯ ДРУГИХ JSP страницы, которая будет загружать шаблон
(смотрите тег page, который указывает на путь к шаблону)

<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

ДЛЯ ЭТОГО ФАЙЛА ШАБЛОНА (обратите внимание на первые строчки)

<!DOCTYPE html>
<%@tag description="Template Site tag" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>--%>

<head>
    <title><jsp:invoke fragment="title"/></title>

    <!-- Bootstrap Core CSS -->
    <spring:url value="resources/css/bootstrap.css" var="bootstrap"/>
    <link href="${bootstrap}" rel="stylesheet" />

    <!-- Custom CSS -->
    <spring:url value="/resources/css/modern-business.css" var="startertemplate"/>
    <link href="${startertemplate}" rel="stylesheet" />

    <!-- Custom Fonts -->
    <spring:url value="/resources/css/font-awesome.min.css" var="fontawesome"/>
    <link href="${fontawesome}" rel="stylesheet" />

    <!-- jQuery -->
    <spring:url value="/resources/js/jquery.js" var="jqueryjs"/>
    <script src="${jqueryjs}"></script>

    <!-- Bootstrap Core JavaScript -->
    <spring:url value="/resources/js/bootstrap.min.js" var="js"/>
    <script src="${js}"></script>

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">Start Bootstrap</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <c:url value="/about.html" var="about"/>
                <li><a href="${about}">About</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tutorial<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <c:url value="/file.html" var="file"/>
                        <c:url value="/jdbc.html" var="jdbc"/>
                        <c:url value="/email.html" var="email"/>
                        <c:url value="/orm.html" var="orm"/>
                        <c:url value="/rest.html" var="rest"/>
<%--                        <c:url value="/exception.html" var="exception"/>--%>
                        <li>
                            <a href="${file}">Загрузка файла PDF и Excel</a>
                        </li>
                        <li>
                            <a href="${jdbc}">jdbc</a>
                        </li>
                        <li>
                            <a href="${email}">emailSend</a>
                        </li>
                        <li>
                            <a href="${orm}">orm</a>
                        </li>
                        <li>
                            <a href="${rest}">rest</a>
                        </li>
                        <li>
                            <a href="/runtimeException">ExceptionController : /exception</a>
                        </li>
                        <li>
                            <a href="/jstlReturnUsers">JSTLController : /jstlReturnUsers</a>
                        </li>
                        <li>
                            <a href="/jstlUser">JSTLController : /jstlUser</a>
                        </li>
                        <li>
                            <a href="/jstlHTML">JSTLController : /jstlHTML</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>


<jsp:doBody/>


<div class="container">
    <!-- Footer -->
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright © Your Website 2014</p>
            </div>
        </div>
    </footer>
</div>

</body>

</html>
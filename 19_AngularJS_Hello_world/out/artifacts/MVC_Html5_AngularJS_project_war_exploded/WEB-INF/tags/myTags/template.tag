<!DOCTYPE html>
<%@tag description="Template Site tag" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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

    <!-- Bootstrap Core CSS

    символ / перед /resources/css... обязателен
    иначе неправильно подгрузится Bootstrap в jsp страницах (index.jsp например)
    тк в путь к bootstrap.css будет добавляться url страницы
    которая вызывает данный темплейт(через вызов index.jsp страницы например):
    http://localhost:8080/interceptorCall/resources/css/bootstrap.css
    например /interceptorCall лишнее в url-е
    (те Template так работает, что если не поставить в начале / ,
    то он возьмет путь к ресурсам(заданый в application-context.xml)
    не от root(webapp): /resources/css/bootstrap.css
    а от вызывающей страницы: /interceptorCall)-->
    <spring:url value="/resources/css/bootstrap.css" var="bootstrap"/>
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


<%--                В header меню была добавлена проверка на авторизацию пользователя
и ссылка на страницу авторизации.
Вначале мы проверяем имеет ли пользователь одну из указанных ролей. Если нет
(а так же параметр error пустой; напомню он прописывался в файле настроек
security-config.xml и далее используется на нескольких jsp страницах),
то выводится сообщение «Вы не вошли в приложение«.
В противном случае используется запись ‘principal.username’,
которая возвращает имя пользователя.--%>

                <security:authorize access= "hasAnyRole('ROLE_ADMIN','ROLE_SUPER_USER', 'ROLE_USER')" var= "isUSer"/>


                <c:if test= "${not isUSer}">
                    <li style= "padding-top: 15px; padding-bottom: 15px; color: red">
                        <c:if test= "${empty param.error}">
                            Вы не вошли в приложение
                        </c:if>
                    </li>
                    <li> <a style= "color: Green;" href= "<c:url value= "/login.html"/>">Login</a> </li>
                </c:if>



                <c:if test= "${isUSer}">
                    <li style= "padding-top: 15px; padding-bottom: 15px; color: green">
                        Вы вошли как:
                        <security:authentication property= "principal.username"/> с ролью:
                        <b><security:authentication property= "principal.authorities"/></b>

                    </li>
                    <li> <a style= "color: red;" href= "<c:url value= "/j_spring_security_logout"/>">Logout</a> </li>
                </c:if>





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
                        <c:url value="/scope.html" var="scope"/>
                        <c:url value="/cookieView.html" var="cookieView"/>
                        <c:url value="/security.html" var="security"/>
                        <c:url value="/angularjson.html" var="angularjson"/>
                        <c:url value="/angularIndex.html" var="angularIndex" />
                        <c:url value="/expressions.html" var="expressions" />
                        <c:url value="/ng-bind-model.html" var="ngbindmodel" />
                        <c:url value="/two-way-binding.html" var="twowaybinding" />

                        <c:url value="/ng-class.html" var="ngclass" />
                        <c:url value="/ng-click-show.html" var="ngclickshow" />
                        <c:url value="/ng-if-switch.html" var="ngifswitch" />
                        <c:url value="/ng-init.html" var="nginit" />
                        <c:url value="/ng-repeat.html" var="ngrepeat" />

                        <c:url value="/angularDI.html" var="angularDI" />

                        <c:url value="/ng-controller.html" var="ngcontroller" />

                        <c:url value="/angularfilters.html" var="filters" />

                        <c:url value="/angularvalidation.html" var="validation" />

                        <c:url value="/angularrouting.html" var="routing" />

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
                        <li>
                            <a href="/interceptorCall/subLevel">interceptorCall</a>
                        </li>
                        <li>
                            <a href="/redirectExample">redirectExample</a>
                        </li>
                        <li>
                            <a href="${scope}">setAttribute_scope</a>
                        </li>
                        <li>
                            <a href="${cookieView}">cookieView</a>
                        </li>
                        <li>
                            <a href="${security}">security</a>
                        </li>
                    </ul>
                </li>
    <li class="dropdown">
        <a href="angularIndex" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="navMenu.angularjs"/><b class="caret"></b> </a>
        <ul class="dropdown-menu">
            <li>
                <a href="${angularIndex}">Содержание тем AngularJS</a>
            </li>
            <li>
                <a href="${angularjson}">JavaScript Object Notation .stringify</a>
            </li>
            <li>
                <a href="${expressions}">AngularJS Expressions</a>
            </li>
            <li>
                <a href="${ngbindmodel}">AngularJS ng-bind-model</a>
            </li>
            <li>
                <a href="${twowaybinding}">AngularJS two-way data binding</a>
            </li>
            <li>
                <a href="${ngclass}">AngularJS ng-class</a>
            </li>
            <li>
                <a href="${ngclickshow}">AngularJS ng-click-show</a>
            </li>
            <li>
                <a href="${ngifswitch}">AngularJS ng-if-switch</a>
            </li>
            <li>
                <a href="${nginit}">AngularJS ng-init</a>
            </li>
            <li>
                <a href="${ngrepeat}">AngularJS ng-repeat</a>
            </li>
            <li>
                <a href="${angularDI}">AngularJS angularDI</a>
            </li>
            <li>
                <a href="${ngcontroller}">AngularJS ng-controller</a>
            </li>
            <li>
                <a href="${filters}">AngularJS filters</a>
            </li>
            <li>
                <a href="${validation}">AngularJS validation</a>
            </li>
            <li>
                <a href="${routing}">AngularJS routing</a>
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
<%--Для того, чтобы переключить локаль используется следующая запись:--%>
                <a href="<%=request.getContextPath()%>?languageVar=en">EN</a>
                <a href="<%=request.getContextPath()%>?languageVar=ru">RU</a>
<%--Т.е. это обычная ссылка EN, RU (ссылка находится внизу страницы приложения),
 по нажатию на которую происходит переключения локали. Это происходит с
 помощью добавления параметра ?languageVar=en (или ru). Напомню. что
 languageVar был прописан в mvc-config.xml в атрибуте propertyName для
 перехватчика localeChangeInterceptor--%>
            </div>
        </div>
    </footer>
</div>

</body>

</html>
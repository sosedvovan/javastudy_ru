
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:template>
    <jsp:body>
        <c:url value="/jstlReturnUsers" var="jstlReturnUsers" />
        <c:url value="/jstlUser" var="jstlUser" />
        <c:url value="/jstlHTML" var="jstlHTML" />

        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">JSTL в Spring
                        <small>JSTL example</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">Java Standard Tag Library</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <!-- Content Row -->
            <div class="row">
                <!-- Sidebar Column -->
                <div class="col-md-3">
                    <div class="list-group">

                        <a href="index.html" class="list-group-item">Home</a>
                        <a href="${jstlReturnUsers}" class="list-group-item">get all users</a>
                        <a href="${jstlUser}" class="list-group-item">Get one user</a>
                        <a href="${jstlHTML}" class="list-group-item">Get HTML</a>
                    </div>
                </div>
                <!-- Content Column -->
                <div class="col-md-9">
<%--Если объект resultObject(с юзером) (создается в контроллере по запросу getUser() )
не пустой, то дальше будет выполнен код внутри тега.--%>
                    <c:if test="${not empty resultObject}">
                        Result:
                        <p>${resultObject}</p>
                    </c:if>

                    <c:if test="${not empty resultObjectList}">
                        <b>Result List:</b>
                        <table>
<%--По запросу get All Users будет выполнен метод listUsers(), который сформирует
объект resultObjectList(с листом юзеров) и, после проверки на пустоту, будет построена таблица с
данными. И тут мы переходим к другому часто используемому тегу: c:forEach.
В него передается список объектов (атрибут items=’ ‘ ). Каждый объект в списке
(Например arrayList.get(0), ..get(1) и т.д.) будет связан с атрибутом
var=’userVar’. Теперь для каждого объекта из списка items будет выполнен код
внутри тега <c:forEach> … </c:forEach>. Как видите, для построения таблицы мы
можем использовать поля внутри класса объекта из списка. Кстати в данном случае
используется класс User--%>
                            <c:forEach var="userVar" items="#{resultObjectList}">
                                <tr>
                                    <td><b>idUser: </b></td>
<%--                                    get и set у объекта
                                        Запись вида <td><c:out value="${userVar.idUser}"/></td>
                                        Означает, что у объекта из переменной var=userVar будет вызван метод
                                        userVar.getIdUser(). Т.е. используется шаблон вида get + имя свойства с
                                        большой буквы. Аналогично может выполняться операция setIdUser(), в случаях
                                        записи.--%>
                                    <td><c:out value="${userVar.idUser}"/></td>
                                </tr>
                                <tr>
                                    <td><b>username: </b></td>
                                    <td><c:out value="${userVar.username}"/></td>
                                </tr>
                                <tr>
                                    <td><b>password: </b></td>
                                    <td><c:out value="${userVar.password}"/></td>
                                </tr>
                                <tr>
                                    <td><b>enabled: </b></td>
                                    <td><c:out value="${userVar.enabled}"/></td>
                                </tr>
                                <tr><td><b style="color:green">End user with id:${userVar.idUser}</b></td></tr>
                                <tr><td> <br /></td></tr>
                            </c:forEach>
                        </table>
                    </c:if>

<%--    если resultHTML не пустой--%>
<%--    из контроллера в resultHTML-е придет стринга:
"<font color='red'><b>Test Color Red</b></font>"--%>
<%--     тег c:out позволяет обрабатывать html код «как есть».--%>
                    <c:if test="${not empty resultHTML}">
<%--        в браузере отобразиться(выполнение html) красным цветом: Test Color Red--%>
                        <p>With <b>escapeXml='false'</b>: <c:out value="${resultHTML}" escapeXml="false"/></p>
<%--        в браузере отобразиться(сам html): <font color='red'><b>Test Color Red</b></font>--%>
                        <p>With <b>escapeXml='true'</b> : <c:out value="${resultHTML}" escapeXml="true"/></p>

                    </c:if>


<%--У jstl есть возможность использования форматирования для разных видов данных.
Например для числового формата или даты используется следующая запись:
Вместо даты вида Thu Mar 31 23:19:25 MSK 2016 мы получаем приведенную к шаблону дату.
То же самое с числовым форматом
Date format: 26 ноя 2022
Number Format: 666 777 999--%>
                    <br />
                    <c:set var="dateVar" value="<%=new java.util.Date()%>"/>
                    Date format: <span><fmt:formatDate value="${dateVar}" pattern="dd MMM yyyy"/> </span>
                    <br />
                    <c:set var="number" value="666777999" />
                    Number Format: <b><fmt:formatNumber type="number" groupingUsed="true" value="${number}"/></b>
                    <br/>




                    <br />
<%--    проверочный тэг <c:catch :--%>
<%--    создали переменную которая берет значение
из возврата от несуществующего метода в проверочном теге
и в данном случае,тк метода не существует, тег <c:catch положит в
эту переменную саму ошибку:
javax.el.ELException: Function [:someNotExistedMethod] not found
и далее мы эту ошибку покажем в браузере (<c:if...)--%>
                    <c:catch var="exceptionVar">
                        ${someNotExistedMethod()}
                    </c:catch>

                    <b>
                        <c:if test="${not empty exceptionVar}">
                            <p style="color:red">Exception msg example: </p>${exceptionVar}
                        </c:if>
                    </b>
                </div>
            </div>
            <!-- /.row -->

            <hr>

        </div>
        <!-- /.container -->

    </jsp:body>
</page:template>
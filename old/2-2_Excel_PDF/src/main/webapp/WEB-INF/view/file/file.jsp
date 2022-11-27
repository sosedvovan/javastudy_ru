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
                    <h1 class="page-header">Пример загрузки файла
                        <small>pdf или excel</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">Пример загрузки файла</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <c:url value="/uploadFile" var="fileUploadControllerURL" />
            <!-- Content Row -->
            <div class="row">

                <div class="col-lg-12">
                    <p>Пример загрузки файла с помощью Spring MVC </p>
                    <form action="${fileUploadControllerURL}" method="post"
                          enctype="multipart/form-data">
                        <table>
                            <tr>
                                <td><b>File:</b></td>
                                <td><input type="file" name="file"></td>
                                <td><input type="submit" value="загрузить файл"></td>
                            </tr>
                        </table>
                    </form>

                    <br />

                    <c:url value="/excel" var="excelController"/>
                    <c:url value="/pdf" var="pdfController"/>
                    <a href="${excelController}">Excel</a>
                    <br />
                    <a href="${pdfController}">PDF</a>

                </div>

            </div>
            <!-- /.row -->

            <hr>

        </div>
        <!-- /.container -->
    </jsp:body>
</page:template>


<%--* Рассмотрим как можно загрузить файл в приложении Spring MVC.
 * Также рассмотрим создание .xls и .pdf документов с помощью Spring MVC
 * Рассмотреть каким образом можно загружать на сервер различные файлы в приложении на основе Spring MVC.
 * Изучить применение библиотек Apache POI и iText для создания документов Microsoft и PDF соответственно
 *
 * Для этой задачи были добавлены java классы для загрузки файла (FileUploadController),
 * создания excel и pdf документов (ExcelDocument, PDFDocument), класс-модель (Cat) и контроллер,
 * который будет обрабатывать запросы с jsp страницы (ExcelPDFController).
 * Для отображения результата используется представление /file/file.jsp.
 * Дополнительно, начиная с этой части, будет использоваться шаблоны для формирования jsp страниц,
 * чтобы не дублировать повторяющиеся части страницы (здесь header и footer вынесены в шаблон).--%>
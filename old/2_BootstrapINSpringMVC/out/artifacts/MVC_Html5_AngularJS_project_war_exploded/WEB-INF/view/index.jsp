<%--Подключение Bootstrap
В нашем проекте мы будем использовать популярный фреймворк Bootstrap 3.3.6. Существует способ подключения bootstrap
с помощью jar зависимости в maven. Вы можете перейти на сайт webjars.org и посмотреть как это сделать.
В этом проекте используется более хардкорный метод — скачивание ресурсов и копирование в соответствующие пакеты.--%>
<%--Зависимости bootstrap
На сайте проекта bootstrap необходимо скачать как минимум: bootstrap.css, bootstrap.js. Здесь были добавлены еще
несколько js и css файлов (версии min — т.е. сжатые). Вы можете скопировать их в свой проект в соответствующие каталоги
(resources/css, js, fonts и т.д.).--%>
<%-- К достоинствам jsp относится его полная совместимость в html. Поэтому вы можете просто открыть index.html из темы
 шаблона и скопировать его содержимое к вам в jsp файл (но нужно оставить базовые настройки jsp файла,
 которые находятся в начале файла!). Так и было сделано здесь со страницами index.jsp и about.jsp.--%>
<%--Создание jsp представления.
Обратите внимание, что в структуре этой части проекта файл index.jsp лежит внутри WEB-INF,
т.е. он не доступен по прямой ссылке из браузера. но Страница будет загружаться, т.к.
на нее будет настроена переадресация из welcome-file-list внутри web.xml. В дальнейшем эта страница
перекочует в корень веб проекта. --%>

<%--то jsp из html делаем след. образом:--%>
<%-- в вверх файла добавляем 3-и обязательные строчки --%>
<%-- в <head> в <title> пишем своё название страницы, <meta> здесь удалили, а в about оставили,
     также  указаны пути к файлам стилей и javascript файла фреймворка bootstrap(если использ. на данной странице),
     так же Здесь прописаны пространства имен--%>

<%--ОБЯЗАТЕЛЬНАЯ ЧАСТЬ для jsp страницы (прописаны пространства имен, а также указаны пути к файлам стилей и
    javascript файла фреймворка bootstrap), остальной код был скопирован из index.html шаблона:--%>
<%--<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
  <head>
    <title>Javastudy.ru MVC_HTML5_Angular</title>
    <spring:url value="resources/css/bootstrap.css" var="bootstrap"/>
    <spring:url value="/resources/css/modern-business.css" var="startertemplate"/>
    <link href="${bootstrap}" rel="stylesheet" />
    <link href="${startertemplate}" rel="stylesheet" />
  </head>--%>


<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
  <head>
    <title>Javastudy.ru MVC_HTML5_Angular</title>
    <spring:url value="resources/css/bootstrap.css" var="bootstrap"/>
    <spring:url value="/resources/css/modern-business.css" var="startertemplate"/>
    <link href="${bootstrap}" rel="stylesheet" />
    <link href="${startertemplate}" rel="stylesheet" />
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
          <li>
            <a href="about.html">About</a>
          </li>
          <li>
            <a href="services.html">Lessons</a>
          </li>
          <li>
            <a href="contact.html">Contact</a>
          </li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tutorial<b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li>
                <a href="portfolio-1-col.html">Lesson 1</a>
              </li>
              <li>
                <a href="portfolio-2-col.html">Lesson 2</a>
              </li>
              <li>
                <a href="portfolio-3-col.html">Lesson 3</a>
              </li>
              <li>
                <a href="portfolio-4-col.html">Lesson 5</a>
              </li>
              <li>
                <a href="portfolio-item.html">Lesson 5</a>
              </li>
            </ul>
          </li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li>
                <a href="blog-home-1.html">Blog Home 1</a>
              </li>
              <li>
                <a href="blog-home-2.html">Blog Home 2</a>
              </li>
              <li>
                <a href="blog-post.html">Blog Post</a>
              </li>
            </ul>
          </li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Other Pages <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li>
                <a href="full-width.html">Full Width Page</a>
              </li>
              <li>
                <a href="sidebar.html">Sidebar Page</a>
              </li>
              <li>
                <a href="faq.html">FAQ</a>
              </li>
              <li>
                <a href="404.html">404</a>
              </li>
              <li>
                <a href="pricing.html">Pricing Table</a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
      <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
  </nav>

  <!-- Header Carousel -->
  <header id="myCarousel" class="carousel slide">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class=""></li>
      <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item">
        <div class="fill" style="background-image:url('http://placehold.it/1900x1080&amp;text=Slide One');"></div>
        <div class="carousel-caption">
          <h2>Caption 1</h2>
        </div>
      </div>
      <div class="item active">
        <div class="fill" style="background-image:url('http://placehold.it/1900x1080&amp;text=Slide Two');"></div>
        <div class="carousel-caption">
          <h2>Caption 2</h2>
        </div>
      </div>
      <div class="item">
        <div class="fill" style="background-image:url('http://placehold.it/1900x1080&amp;text=Slide Three');"></div>
        <div class="carousel-caption">
          <h2>Caption 3</h2>
        </div>
      </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="icon-prev"></span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="icon-next"></span>
    </a>
  </header>

  <!-- Page Content -->
  <div class="container">

    <!-- Marketing Icons Section -->
    <div class="row">
      <div class="col-lg-12">
        <h1 class="page-header">
          Welcome to Modern Business
        </h1>
      </div>
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4><i class="fa fa-fw fa-check"></i> Bootstrap v3.2.0</h4>
          </div>
          <div class="panel-body">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
            <a href="#" class="btn btn-default">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4><i class="fa fa-fw fa-gift"></i> Free &amp; Open Source</h4>
          </div>
          <div class="panel-body">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
            <a href="#" class="btn btn-default">Learn More</a>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4><i class="fa fa-fw fa-compass"></i> Easy to Use</h4>
          </div>
          <div class="panel-body">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
            <a href="#" class="btn btn-default">Learn More</a>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->

    <!-- Portfolio Section -->
    <div class="row">
      <div class="col-lg-12">
        <h2 class="page-header">Portfolio Heading</h2>
      </div>
      <div class="col-md-4 col-sm-6">
        <a href="portfolio-item.html">
          <img class="img-responsive img-portfolio img-hover" src="http://placehold.it/700x450" alt="">
        </a>
      </div>
      <div class="col-md-4 col-sm-6">
        <a href="portfolio-item.html">
          <img class="img-responsive img-portfolio img-hover" src="http://placehold.it/700x450" alt="">
        </a>
      </div>
      <div class="col-md-4 col-sm-6">
        <a href="portfolio-item.html">
          <img class="img-responsive img-portfolio img-hover" src="http://placehold.it/700x450" alt="">
        </a>
      </div>
      <div class="col-md-4 col-sm-6">
        <a href="portfolio-item.html">
          <img class="img-responsive img-portfolio img-hover" src="http://placehold.it/700x450" alt="">
        </a>
      </div>
      <div class="col-md-4 col-sm-6">
        <a href="portfolio-item.html">
          <img class="img-responsive img-portfolio img-hover" src="http://placehold.it/700x450" alt="">
        </a>
      </div>
      <div class="col-md-4 col-sm-6">
        <a href="portfolio-item.html">
          <img class="img-responsive img-portfolio img-hover" src="http://placehold.it/700x450" alt="">
        </a>
      </div>
    </div>
    <!-- /.row -->

    <!-- Features Section -->
    <div class="row">
      <div class="col-lg-12">
        <h2 class="page-header">Modern Business Features</h2>
      </div>
      <div class="col-md-6">
        <p>The Modern Business template by Start Bootstrap includes:</p>
        <ul>
          <li><strong>Bootstrap v3.2.0</strong>
          </li>
          <li>jQuery v1.11.0</li>
          <li>Font Awesome v4.1.0</li>
          <li>Working PHP contact form with validation</li>
          <li>Unstyled page elements for easy customization</li>
          <li>17 HTML pages</li>
        </ul>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
      </div>
      <div class="col-md-6">
        <img class="img-responsive" src="http://placehold.it/700x450" alt="">
      </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Call to Action Section -->
    <div class="well">
      <div class="row">
        <div class="col-md-8">
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
        </div>
        <div class="col-md-4">
          <a class="btn btn-lg btn-default btn-block" href="#">Call to Action</a>
        </div>
      </div>
    </div>

    <hr>

    <!-- Footer -->
    <footer>
      <div class="row">
        <div class="col-lg-12">
          <p>Copyright © Your Website 2014</p>
        </div>
      </div>
    </footer>

  </div>
  <!-- /.container -->

  <!-- jQuery -->
  <script src="/resources/js/jquery.js"></script>

  <!-- Bootstrap Core JavaScript -->
  <script src="/resources/js/bootstrap.min.js"></script>

  <!-- Script to Activate the Carousel -->
  <script>
    $('.carousel').carousel({
      interval: 5000 //changes the speed
    })
  </script>




  </body>
</html>

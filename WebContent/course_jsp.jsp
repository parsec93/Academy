<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="icon" href="img/favicon.png" type="image/png" />
    <title>강의안내 - JSP</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/flaticon.css" />
    <link rel="stylesheet" href="css/themify-icons.css" />
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
    <!-- main css -->
    <link rel="stylesheet" href="css/style.css" />
  </head>

  <body>
    <!--================ Start Header Menu Area =================-->
    <jsp:include page="header_footer/header.jsp" />
    <!--================ End Header Menu Area =================-->

    <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="overlay"></div>
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-6">
              <div class="banner_content text-center">
                <h2>JSP</h2>
                <div class="page_link">
                  <a href="courses.jsp">강의안내</a>
                  <a href="coures_java.jsp">JAVA</a>
                  <a href="coures_oracle.jsp">ORACLE</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

    <!--================ Start Course Details Area =================-->
    <section class="course_details_area section_gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 course_details_left">
                    <div class="main_image">
                        <img class="img-fluid" src="img/courses/course-details.jpg" alt="">
                    </div>
                    <div class="content_wrapper">
                        <h4 class="title">교육목표</h4>
                        <div class="content">
                            컴퓨터 프로그래밍 언어로 각 업무에 맞는 소프트웨어의 기능에 관한 설계, 구현 및 테스트를 수행하고, 사용자에게 배포하며, 
                            버전관리를 통해 제품의 성능을 향상시키고, 서비스를 개선할 수 있다.
                            전자정부프레임워크 기반 정보시스템 개발을 위해 필요한 기능 및 아키텍처를 이용하여 효율적인 어플리케이션 구축을 할 수 있다.
                            데이터베이스 구현을 위하여 DBMS(Data Base Management System) 설치, 데이터베이스 생성, 데이터베이스 오브젝트를계획, 설계하고 구현할 수 있다.
                            관계형 데이터베이스에서 SQL을 사용하여 목적에 적합한 데이터를 정의하고, 조작하며, 제어할 수 있다.
                            UI 웹표준 지침에 따라 화면과 폼, 메뉴 등의 구조와 흐름을 구현하여 반영할 수 있다.
                            <br>
                            <br>

                        </div>

                        <h4 class="title">주요 훈련 내용</h4>
                        <div class="content">
                            전자정부 프레임워크 소개(아키텍처,프레임워크,오픈소스)<br />
                            전자정부프레임워크 환경설정<br />
                            전자정부 프레임워크(AOP, MVC, Web , Data JPA)<br />
                            MyBatis 프레임워크(설정, CRUD구현,동적SQL,어노테이션)<br />
                            공통컴포넌트 적용방법<br />
                            템플릿 프로그램 실습
                            <br>
                            <br>
                        </div>

                        <h4 class="title">수강후기</h4>
                        <div class="content">
                            <ul class="course_list">
                                <li class="justify-content-between d-flex">
                                    <a href="#" class="course_text">수강후기 내용내ㅔ용ㄹㅇㅇㄹ...</a>
                                    <a class="primary-btn text-uppercase" href='javascript:void(0);' onClick='return false'>김XX</a>
                                </li>
                                <li class="justify-content-between d-flex">
                                    <a href="#" class="course_text">수강후기 내용내ㅔ용ㄹㅇㅇㄹ...</a>
                                    <a class="primary-btn text-uppercase" href='javascript:void(0);' onClick='return false'>김XX</a>
                                </li>
                                <li class="justify-content-between d-flex">
                                    <a href="#" class="course_text">수강후기 내용내ㅔ용ㄹㅇㅇㄹ...</a>
                                    <a class="primary-btn text-uppercase" href='javascript:void(0);' onClick='return false'>김XX</a>
                                </li>
                                <li class="justify-content-between d-flex">
                                    <a href="#" class="course_text">수강후기 내용내ㅔ용ㄹㅇㅇㄹ...</a>
                                    <a class="primary-btn text-uppercase" href='javascript:void(0);' onClick='return false'>김XX</a>
                                </li>
                                <li class="justify-content-between d-flex">
                                    <a href="#" class="course_text">수강후기 내용내ㅔ용ㄹㅇㅇㄹ...</a>
                                    <a class="primary-btn text-uppercase" href='javascript:void(0);' onClick='return false'>김XX</a>
                                </li>
                                

                            </ul>
                        </div>
                        
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Previous">
                                        <span aria-hidden="true">
                                            <i class="ti-angle-left"></i>
                                        </span>
                                    </a>
                                </li>
                                <li class="page-item"><a href="#" class="page-link">01</a></li>
                                <li class="page-item active"><a href="#" class="page-link">02</a></li>
                                <li class="page-item"><a href="#" class="page-link">03</a></li>
                                <li class="page-item"><a href="#" class="page-link">04</a></li>
                                <li class="page-item"><a href="#" class="page-link">09</a></li>
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Next">
                                        <span aria-hidden="true">
                                            <i class="ti-angle-right"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        
                    </div>
                </div>


                <div class="col-lg-4 right-contents">
                    <ul>
                        <li>
                            <a class="justify-content-between d-flex" href="#">
                                <p>교육과정</p>
                                <span class="or">JSP를 아라보자~</span>
                            </a>
                        </li>
                        <li>
                            <a class="justify-content-between d-flex" href="#">
                                <p>교육비용</p>
                                <span>얼마일까용</span>
                            </a>
                        </li>
                        <li>
                            <a class="justify-content-between d-flex" href="#">
                                <p>교육시간</p>
                                <span>오전오후시간어떠케,,</span>
                            </a>
                        </li>
                        <li>
                            <a class="justify-content-between d-flex" href="#">
                                <p>교육기간</p>
                                <span>2019.09.21 ~ 2019.10.20</span>
                            </a>
                        </li>
                    </ul>
                    <a href="#" class="primary-btn2 text-uppercase enroll rounded-0 text-white">수강신청</a>

                    <h4 class="title">교직원소개</h4>
                    <div class="content">
<!--                         <div class="review-top row pt-40"> -->
<!--                             <div class="col-lg-12"> -->
<!--                                 <h6 class="mb-15">Provide Your Rating</h6> -->
<!--                                 <div class="d-flex flex-row reviews justify-content-between"> -->
<!--                                     <span>Quality</span> -->
<!--                                     <div class="star"> -->
<!--                                         <i class="ti-star checked"></i> -->
<!--                                         <i class="ti-star checked"></i> -->
<!--                                         <i class="ti-star checked"></i> -->
<!--                                         <i class="ti-star"></i> -->
<!--                                         <i class="ti-star"></i> -->
<!--                                     </div> -->
<!--                                     <span>Outstanding</span> -->
<!--                                 </div> -->
<!--                                 <div class="d-flex flex-row reviews justify-content-between"> -->
<!--                                     <span>Puncuality</span> -->
<!--                                     <div class="star"> -->
<!--                                         <i class="ti-star checked"></i> -->
<!--                                         <i class="ti-star checked"></i> -->
<!--                                         <i class="ti-star checked"></i> -->
<!--                                         <i class="ti-star"></i> -->
<!--                                         <i class="ti-star"></i> -->
<!--                                     </div> -->
<!--                                     <span>Outstanding</span> -->
<!--                                 </div> -->
<!--                                 <div class="d-flex flex-row reviews justify-content-between"> -->
<!--                                     <span>Quality</span> -->
<!--                                     <div class="star"> -->
<!--                                         <i class="ti-star checked"></i> -->
<!--                                         <i class="ti-star checked"></i> -->
<!--                                         <i class="ti-star checked"></i> -->
<!--                                         <i class="ti-star"></i> -->
<!--                                         <i class="ti-star"></i> -->
<!--                                     </div> -->
<!--                                     <span>Outstanding</span> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="feedeback"> -->
<!--                             <h6>Your Feedback</h6> -->
<!--                             <textarea name="feedback" class="form-control" cols="10" rows="10"></textarea> -->
<!--                             <div class="mt-10 text-right"> -->
<!--                                 <a href="#" class="primary-btn2 text-right rounded-0 text-white">Submit</a> -->
<!--                             </div> -->
<!--                         </div> -->
                        <div class="comments-area mb-30">
                            <div class="comment-list">
                                <div class="single-comment single-reviews justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                        <div class="thumb">
                                            <img src="img/blog/c1.jpg" alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="#">홍진숙</a>
<!--                                                 <div class="star"> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star"></span> -->
<!--                                                     <span class="ti-star"></span> -->
<!--                                                 </div> -->
                                            </h5>
                                            <p class="comment">
                                                JAVA, JSP, Spring, Android<br />
                                                NCS 프로그래밍 언어활용<br />
                                                NCS 애플리케이션 구현
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="comment-list">
                                <div class="single-comment single-reviews justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                        <div class="thumb">
                                            <img src="img/blog/c2.jpg" alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="#">신상국</a>
<!--                                                 <div class="star"> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star"></span> -->
<!--                                                     <span class="ti-star"></span> -->
<!--                                                 </div> -->
                                            </h5>
                                            <p class="comment">
                                                JAVA, JSP Model1 & Model2<br />
                                                JavaScript, JQuery, Ajax<br />
                                                BootStrap<br />
                                                Spring framework<br />
                                                MyBatis framework<br />
                                                Android, 사물인터넷 IOT<br />
                                                NCS 프로그래밍 언어활용<br />
                                                NCS 애플리케이션 구현​ 
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="comment-list">
                                <div class="single-comment single-reviews justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                        <div class="thumb">
                                            <img src="img/blog/c3.jpg" alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="#">이연태</a>
<!--                                                 <div class="star"> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star"></span> -->
<!--                                                     <span class="ti-star"></span> -->
<!--                                                 </div> -->
                                            </h5>
                                            <p class="comment">
                                                시스코 네트워크(CCNA, CCNP)<br />구축 및 운영 관리<br />
                                                정보보안(방화벽, 패킷분석)<br />
                                                자바 프로그래밍<br />
                                                JSP 프로그래밍<br />
                                                안드로이드 프로그래밍
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================ End Course Details Area =================-->
    
    <!--================ Start footer Area  =================-->
    <jsp:include page="header_footer/footer.jsp" />
    <!--================ End footer Area  =================-->
      
          <!-- Optional JavaScript -->
          <!-- jQuery first, then Popper.js, then Bootstrap JS -->
          <script src="js/jquery-3.2.1.min.js"></script>
          <script src="js/popper.js"></script>
          <script src="js/bootstrap.min.js"></script>
          <script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
          <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
          <script src="js/owl-carousel-thumb.min.js"></script>
          <script src="js/jquery.ajaxchimp.min.js"></script>
          <script src="js/mail-script.js"></script>
          <!--gmaps Js-->
          <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
          <script src="js/gmaps.min.js"></script>
          <script src="js/theme.js"></script>
        </body>
      </html>
<%@page import="vo.LectureBean"%>
<%@page import="java.util.ArrayList"%>
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
    <title>강의안내 - ORACLE</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/flaticon.css" />
    <link rel="stylesheet" href="css/themify-icons.css" />
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
    <!-- main css -->
    <link rel="stylesheet" href="css/style.css" />
    <%
ArrayList<LectureBean> review = (ArrayList<LectureBean>)request.getAttribute("review");
%>
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
                <h2>ORACLE</h2>
                <div class="page_link">
                  <a href="courses.jsp">강의안내</a>
                  <a href="coures_java.jsp">JAVA</a>
                  <a href="coures_jsp.jsp">JSP</a>
                  <a href="coures_network.jsp">NETWORK</a>
                  <a href="coures_web.jsp">WEB</a>
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
                        <img class="img-fluid" src="img/courses/course-details3.png" alt="">
                    </div>
                    <div class="content_wrapper">
                        <h4 class="title">교육목표</h4>
                        <div class="content">
                            데이터베이스 구현을 위하여 오라클 DBMS 설치, 데이터베이스 생성, 데이터베이스 오브젝트를 계획, 설계하고 구현하는능력을 함양할 수 있다.
                            실무 중심의 데이터베이스 관리를 통해  데이터베이스 관리자 양성 및 보수교육을 목표로 한다.
                            데이터베이스 관리자의 소양을 테스트하는 OCP(Oracle Certified Professional) 국제공인자격증 취득을 목표로 한다.
                            
                            <br>
                            <br>

                        </div>

                        <h4 class="title">주요 훈련 내용</h4>
                        <div class="content">
                            기본 SQL구문, 심화 SQL구문, 오브젝트 설계 및 구현<br />
                            데이터베이스 전체 구조 이해, 오라클 DBMS설치, 데이터베이스 생성<br />
                            데이터베이스 저장공간 관리, 유저 관리, 데이터 충돌 관리, 메모리 관리<br />
                            데이터베이스 다중화, 데이터베이스 Backup & Recovery
                            <br>
                            <br>
                        </div>

                        <h4 class="title">수강후기</h4>
                        <div class="content">
                            <ul class="course_list">
                          <%   if(review == null){%>
                          <h1>작성된 후기가 없습니다.</h1>
                          <%}else{ 
                          
                          	for(int i=0; i<review.size();i++){
                          	LectureBean lb = (LectureBean)review.get(i);
                          	%>
                                <li class="justify-content-between d-flex">
                                    <a class="course_text" href='javascript:void(0);' onClick='return false'><b>[<%=lb.getLecture_subject() %>]</b>&nbsp;<%= lb.getLecture_content() %></a>
                                    <a class="primary-btn text-uppercase" href='javascript:void(0);' onClick='return false'><%=lb.getLecture_teacher() %></a>
                                </li>
<!--                                 <li class="justify-content-between d-flex"> -->
<!--                                     <a class="course_text" href='javascript:void(0);' onClick='return false'>수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기 -->
<!--                                     수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기 -->
<!--                                     수강후기수강후기수강후기수강후기수강후기수강후기</a> -->
<!--                                     <a class="primary-btn text-uppercase" href='javascript:void(0);' onClick='return false'>김XX</a> -->
<!--                                 </li> -->
<!--                                 <li class="justify-content-between d-flex"> -->
<!--                                     <a class="course_text" href='javascript:void(0);' onClick='return false'>수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기 -->
<!--                                     수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기 -->
<!--                                     수강후기수강후기수강후기수강후기수강후기수강후기</a> -->
<!--                                     <a class="primary-btn text-uppercase" href='javascript:void(0);' onClick='return false'>김XX</a> -->
<!--                                 </li> -->
<!--                                 <li class="justify-content-between d-flex"> -->
<!--                                     <a class="course_text" href='javascript:void(0);' onClick='return false'>수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기 -->
<!--                                     수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기 -->
<!--                                     수강후기수강후기수강후기수강후기수강후기수강후기</a> -->
<!--                                     <a class="primary-btn text-uppercase" href='javascript:void(0);' onClick='return false'>김XX</a> -->
<!--                                 </li> -->
<!--                                 <li class="justify-content-between d-flex"> -->
<!--                                     <a class="course_text" href='javascript:void(0);' onClick='return false'>수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기 -->
<!--                                     수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기수강후기 -->
<!--                                     수강후기수강후기수강후기수강후기수강후기수강후기</a> -->
<!--                                     <a class="primary-btn text-uppercase" href='javascript:void(0);' onClick='return false'>김XX</a> -->
<!--                                 </li> -->
                                <%} %>
							<%} %>
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
                                <span class="or">ORACLE를 아라보자~</span>
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
                                            <img src="img/courses/author1.png" alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="#">송지태</a>
<!--                                                 <div class="star"> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star"></span> -->
<!--                                                     <span class="ti-star"></span> -->
<!--                                                 </div> -->
                                            </h5>
                                            <p class="comment">
                                                데이터베이스 SQL 활용<br />
                                                데이터베이스 구축<br />
                                                데이터베이스 보안 
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="comment-list">
                                <div class="single-comment single-reviews justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                        <div class="thumb">
                                            <img src="img/courses/author2.png" alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="#">정지윤</a>
<!--                                                 <div class="star"> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star"></span> -->
<!--                                                     <span class="ti-star"></span> -->
<!--                                                 </div> -->
                                            </h5>
                                            <p class="comment">
                                                NCS 기반 SQL활용<br />
                                                NCS 기반 데이터베이스 구현<br />
                                                NCS 기반 데이터베이스 운영<br />
                                                NCS 기반 데이터베이스 보안<br />
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
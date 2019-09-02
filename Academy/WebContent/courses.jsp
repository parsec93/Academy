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
    <title>강의 안내</title>
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
                <h2>강의 안내</h2>
                <div class="page_link">
                  <a href="#">JAVA</a>
                  <a href="#">JSP</a>
                  <a href="#">ORACLE</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

    <!--================ Start Popular Courses Area =================-->
    <div class="popular_courses section_gap_top">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-5">
            <div class="main_title">
              <h2 class="mb-3">9월 개강 임박 수업</h2>
              <p>
                해당 강의를 누르시면 자세한 정보를 확인할 수 있습니다.
              </p>
            </div>
          </div>
        </div>
        <div class="row">
          <!-- single course -->
          <div class="col-lg-12">
            <div class="owl-carousel active_course">
              <div class="single_course">
                <div class="course_head">
                  <img class="img-fluid" src="img/courses/c1.jpg" alt="" />
                </div>
                <div class="course_content">
                  <span class="price">9월</span>
                  <span class="tag mb-4 d-inline-block">JAVA</span>
                  <h4 class="mb-3">
                    <a href="course-details.html">자바,빅데이터 전문가 양성</a>
                  </h4>
                  <p>
                    Front-end, Back-end를 모두 갖춘<br />
                    Full-stack 개발자 양성 과정<br />
                    빅데이터 분석과 활용으로 경쟁력 확보
          
                  </p>
                  <div
                    class="course_meta d-flex justify-content-lg-between align-items-lg-center flex-lg-row flex-column mt-4"
                  >
                    <div class="authr_meta">
                      <img src="img/courses/author1.png" alt="" />
                      <span class="d-inline-block ml-2">권민섭</span>
                    </div>
                    
                  </div>
                </div>
              </div>

              <div class="single_course">
                <div class="course_head">
                  <img class="img-fluid" src="img/courses/c2.jpg" alt="" />
                </div>
                <div class="course_content">
                  <span class="price">9월</span>
                  <span class="tag mb-4 d-inline-block">PYTHON</span>
                  <h4 class="mb-3">
                    <a href="course-details.html">빅데이터 전문가 양성</a>
                  </h4>
                  <p>
                    코딩교육 의무화시대<br />
                    최고의 프로그래밍언어 파이썬 교육으로
                    빅데이터 전문가를 양성합니다.
                  </p>
                  <div
                    class="course_meta d-flex justify-content-lg-between align-items-lg-center flex-lg-row flex-column mt-4"
                  >
                    <div class="authr_meta">
                      <img src="img/courses/author2.png" alt="" />
                      <span class="d-inline-block ml-2">권근호</span>
                    </div>
                    
                  </div>
                </div>
              </div>

              <div class="single_course">
                <div class="course_head">
                  <img class="img-fluid" src="img/courses/c3.jpg" alt="" />
                </div>
                <div class="course_content">
                  <span class="price">9월</span>
                  <span class="tag mb-4 d-inline-block">ORACLE</span>
                  <h4 class="mb-3">
                    <a href="course-details.html">오라클 DBA 양성</a>
                  </h4>
                  <p>
                    어디에서도 배울 수 없는 데이터베이스 실무 교육으로
                    경력직 우대하는 DBA 전문가로 진입할 수 있는 유일한 기회
                    
                  </p>
                  <div
                    class="course_meta d-flex justify-content-lg-between align-items-lg-center flex-lg-row flex-column mt-4"
                  >
                    <div class="authr_meta">
                      <img src="img/courses/author3.png" alt="" />
                      <span class="d-inline-block ml-2">김영진</span>
                    </div>
                   
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--================ End Popular Courses Area =================-->

   

    <!--================ Start Feature Area =================-->
    <section class="feature_area section_gap_top">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-5">
            <div class="main_title">
              <h2 class="mb-3">Hello, World!</h2>
              <p>
                학원만의 차별화된 최고의 교육 및 상담을 받아보세요.
              </p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-6">
            <div class="single_feature">
              <div class="icon"><span class="flaticon-student"></span></div>
              <div class="desc">
                <h4 class="mt-3 mb-2">JAVA</h4>
                <p>
                    언어의 기초문법, 라이브러리 활용으로
					프로그래밍의 구조를 학습합니다.
                </p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="single_feature">
              <div class="icon"><span class="flaticon-book"></span></div>
              <div class="desc">
                <h4 class="mt-3 mb-2">ORACLE</h4>
                <p>
                  오라클 데이터베이스를 활용한 인프라스트럭처 전문가를 양성합니다.
                </p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="single_feature">
              <div class="icon"><span class="flaticon-earth"></span></div>
              <div class="desc">
                <h4 class="mt-3 mb-2">JSP</h4>
                <p>
                  Java 언어를 기반으로 하는 Server Side 스크립트 언어를 배우게 됩니다.

                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================ End Feature Area =================-->
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

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
    <title>edustage</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/flaticon.css" />
    <link rel="stylesheet" href="css/themify-icons.css" />
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
    <!-- main css -->
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <%String isMember =(String)request.getAttribute("isMember"); %>
  <body>
    <!--================ Start Header Menu Area =================-->
    <jsp:include page="header_footer/header_main.jsp" >
    	<jsp:param name="isMember" value="<%=isMember %>"/>
    </jsp:include>

    <!--================ End Header Menu Area =================-->

    <!--================ Start Home Banner Area =================-->
    <section class="home_banner_area">
      <div class="banner_inner">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <div class="banner_content text-center">
                <p class="text-uppercase">
                  검증된 전문가와 커리큘럼의 맞춤형교육
                </p>
                <h2 class="text-uppercase mt-4 mb-5">
                  4차 산업혁명 대비 과정<%=isMember %>
                </h2>
                <div>
                  <a href="#" class="primary-btn2 mb-3 mb-sm-0">강의소개</a>
                  <a href="#" class="primary-btn ml-sm-3 ml-0">수강신청</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================ End Home Banner Area =================-->

    <!--================ Start Feature Area =================-->
    <section class="feature_area section_gap_top">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-5">
            <div class="main_title">
              <h2 class="mb-3">Hello, World!</h2>
              <p>
                EDUSTAGE만의 차별화된 최고의 교육 및 상담을 받아보세요.
              </p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-6">
            <div class="single_feature">
<!--               <div class="icon"><span class="flaticon-student"></span></div> -->
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
<!--               <div class="icon"><span class="flaticon-book"></span></div> -->
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
<!--               <div class="icon"><span class="flaticon-earth"></span></div> -->
              <div class="desc">
                <h4 class="mt-3 mb-2">JSP</h4>
                <p>
                  Java 언어를 기반으로 하는 Server Side 스크립트 언어를 배우게 됩니다.

                </p>
              </div>
            </div>
          </div>
          
          <!-- 추가 -->
          
          <div class="col-lg-4 col-md-6">
            <div class="single_feature">
<!--               <div class="icon"><span class="flaticon-earth"></span></div> -->
              <div class="desc">
                <h4 class="mt-3 mb-2">Network</h4>
                <p>
                  기본부터 시작하여 물리적 보호구역을 통제하고 
                  사무실 및 시스템을 보호하기위한 보안 프로그래밍을 구축합니다.

                </p>
              </div>
            </div>
          </div>
          
          <div class="col-lg-4 col-md-6">
            <div class="single_feature">
<!--               <div class="icon"><span class="flaticon-earth"></span></div> -->
              <div class="desc">
                <h4 class="mt-3 mb-2">WEB</h4>
                <p>
                  HTML5.0 + CSS3를 활용한 웹표준코딩으로 
                  웹접근성, 호환성을 가진 웹사이트 제작기술을 배우게 됩니다.

                </p>
              </div>
            </div>
          </div>
          
          <div class="col-lg-4 col-md-6">
            <div class="single_feature">
<!--               <div class="icon"><span class="flaticon-earth"></span></div> -->
              <div class="desc">
                <h4 class="mt-3 mb-2">취업지원</h4>
                <p>
                  여러분의 평생 IT 직무로 가져 갈 수 있도록 정확한 직무와 IT 기업을 안내하겠습니다.

                </p>
              </div>
            </div>
          </div>
          
          
        </div>
      </div>
    </section>
    <!--================ End Feature Area =================-->

<!--================ Start Popular Courses Area =================-->
    <div class="popular_courses section_gap_top">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-5">
            <div class="main_title">
              <h2 class="mb-3">9월 강의 안내</h2>
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
                  <img class="img-fluid" src="img/courses/c1.png" alt="" />
                </div>
                <div class="course_content">
                  <span class="price">9월</span>
                  <span class="tag mb-4 d-inline-block">JAVA</span>
                  <h4 class="mb-3">
                    <a href="course_java.jsp">자바 프로그래밍 언어 활용</a>
                  </h4>
                  <p>
                    자바 응용소프트웨어 개발에 사용되는 자바 프로그래밍 언어의
                    기초문법을 적용하고 언어의 특징과 라이브러리를 활용하여
                    기본 응용소프트웨어를 구현하는 능력을 함양할 수 있다.
          
                  </p>
                  <div class="course_meta d-flex justify-content-lg-between align-items-lg-center flex-lg-row flex-column mt-4">
                    <div class="authr_meta">
                      <img src="img/courses/author1.png" alt="" />
                      <span class="d-inline-block ml-2">이연태</span>
                    </div>
                    
                  </div>
                </div>
              </div>

              

              
              
              <div class="single_course">
                <div class="course_head">
                  <img class="img-fluid" src="img/courses/c3.png" alt="" />
                </div>
                <div class="course_content">
                  <span class="price">9월</span>
                  <span class="tag mb-4 d-inline-block">ORACLE</span>
                  <h4 class="mb-3">
                    <a href="course_oracle.jsp">오라클 패키지 과정(OCP12c)</a>
                  </h4>
                  <p>
                    데이터베이스 구현을 위하여 오라클 DBMS 설치, 데이터베이스 생성, 
                    데이터베이스 오브젝트를 계획, 설계하고 구현하는 능력을 함양할 수 있다.
                    
                    
                  </p>
                  <div
                    class="course_meta d-flex justify-content-lg-between align-items-lg-center flex-lg-row flex-column mt-4"
                  >
                    <div class="authr_meta">
                      <img src="img/courses/author1.png" alt="" />
                      <span class="d-inline-block ml-2">송지태</span>
                    </div>
                   
                  </div>
                </div>
              </div>
              
              <div class="single_course">
                <div class="course_head">
                  <img class="img-fluid" src="img/courses/c2.png" alt="" />
                </div>
                <div class="course_content">
                  <span class="price">9월</span>
                  <span class="tag mb-4 d-inline-block">JSP</span>
                  <h4 class="mb-3">
                    <a href="course_jsp.jsp">자바 스프링 프레임워크</a>
                  </h4>
                  <p>
                    컴퓨터 프로그래밍 언어로 각 업무에 맞는 소프트웨어의 기능에 관한 설계, 구현 및 테스트를 수행, 사용자에게 배포, 
                    버전관리를 통해 제품의 성능을 향상시키고, 서비스를 개선할 수 있다.
                    
                    
                  </p>
                  <div
                    class="course_meta d-flex justify-content-lg-between align-items-lg-center flex-lg-row flex-column mt-4"
                  >
                    <div class="authr_meta">
                      <img src="img/courses/author2.png" alt="" />
                      <span class="d-inline-block ml-2">홍진숙</span>
                    </div>
                   
                  </div>
                </div>
              </div>
              
              
              <div class="single_course">
                <div class="course_head">
                  <img class="img-fluid" src="img/courses/c4.png" alt="" />
                </div>
                <div class="course_content">
                  <span class="price">9월</span>
                  <span class="tag mb-4 d-inline-block">Network</span>
                  <h4 class="mb-3">
                    <a href="course_oracle.jsp">사물인터넷(IoT) 기반<br >유무선 네트워크 구축</a>
                  </h4>
                  <p>
                    프로그래밍, 데이터베이스, 서버 기초 기술을 습득하고, 
                    사물인터넷(IoT)의 기반이 되는 유,무선 네트워크 및 보안 기술과 장비 실습을 통해 
                    실무 환경을 경험할 수 있도록 통합 프로젝트를 진행하는 실무형 엔지니어 양성 과정이다.
                    
                    
                  </p>
                  <div
                    class="course_meta d-flex justify-content-lg-between align-items-lg-center flex-lg-row flex-column mt-4">
                    <div class="authr_meta">
                      <img src="img/courses/author1.png" alt="" />
                      <span class="d-inline-block ml-2">이상용</span>
                    </div>
                   
                  </div>
                </div>
              </div>
              
              <div class="single_course">
                <div class="course_head">
                  <img class="img-fluid" src="img/courses/c2.png" alt="" />
                </div>
                <div class="course_content">
                  <span class="price">9월</span>
                  <span class="tag mb-4 d-inline-block">JSP</span>
                  <h4 class="mb-3">
                    <a href="course_jsp.jsp">자바 서버프로그램 구현</a>
                  </h4>
                  <p>
                  자바(JAVA) 서버프로그램 구현(JSP)에 필요한 환경을 구성하고, 
                  자바 프로그래밍 언어와 도구를 활용하여 공통모듈, 업무 프로그램과 배치 프로그램을 구현하는 능력을 함양할 수 있다. 
                    
                  </p>
                  <div
                    class="course_meta d-flex justify-content-lg-between align-items-lg-center flex-lg-row flex-column mt-4"
                  >
                    <div class="authr_meta">
                      <img src="img/courses/author2.png" alt="" />
                      <span class="d-inline-block ml-2">홍진숙</span>
                    </div>
                    
                  </div>
                </div>
              </div>
              
              <div class="single_course">
                <div class="course_head">
                  <img class="img-fluid" src="img/courses/c5.png" alt="" />
                </div>
                <div class="course_content">
                  <span class="price">9월</span>
                  <span class="tag mb-4 d-inline-block">웹표준</span>
                  <h4 class="mb-3">
                    <a href="course_oracle.jsp">반응형 웹표준(HTML5,CSS3)</a>
                  </h4>
                  <p>
                    UI 요구사항을 확인하여 설계한 UI 설계를 기반으로 HTML5와 CSS3.0 
                    웹표준과 웹접근성을 이용해서 웹디자이너가 만든 디자인시안을 동적인 반응형 웹페이지를 구현할 수 있다.
                    
                    
                  </p>
                  <div
                    class="course_meta d-flex justify-content-lg-between align-items-lg-center flex-lg-row flex-column mt-4"
                  >
                    <div class="authr_meta">
                      <img src="img/courses/author2.png" alt="" />
                      <span class="d-inline-block ml-2">홍진숙</span>
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

    <!--================ Start Trainers Area =================-->
    <section class="trainer_area section_gap_top">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-5">
            <div class="main_title">
              <h2 class="mb-3">강사 소개</h2>
              <p>
                
              </p>
            </div>
          </div>
        </div>
        <div class="row justify-content-center d-flex align-items-center">
          <div class="col-lg-3 col-md-6 col-sm-12 single-trainer">
            <div class="thumb d-flex justify-content-sm-center">
              <img class="img-fluid" src="img/trainer/t1.png" alt="" />
            </div>
            <div class="meta-text text-sm-center">
              <h4>홍진숙</h4>
              <p class="designation">자바프로그래밍</p>
              <div class="mb-4">
                <p>
                  백견이 불여일타!<br />
                  손이 저절로 움직여 코딩 할 수 있도록
                  노련함이 느껴지는 교육을 진행하겠습니다. 
                </p>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 col-sm-12 single-trainer">
            <div class="thumb d-flex justify-content-sm-center">
              <img class="img-fluid" src="img/trainer/t2.png" alt="" />
            </div>
            <div class="meta-text text-sm-center">
              <h4>이연태</h4>
              <p class="designation">네트워크&보안</p>
              <div class="mb-4">
                <p>
                  프로그래밍 & 네트워크<br />정보보안에 대한<br />
                  폭 넓은 지식을 쉽고 빠르게<br />전달해 드립니다!
                </p>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 col-sm-12 single-trainer">
            <div class="thumb d-flex justify-content-sm-center">
              <img class="img-fluid" src="img/trainer/t3.png" alt="" />
            </div>
            <div class="meta-text text-sm-center">
              <h4>송지태</h4>
              <p class="designation">DB</p>
              <div class="mb-4">
                <p>
                  오라클 DBMS!<br />
                  부담없이 친근하게 다가가도록 하겠습니다!
                  폭 넓은 지식을 제공해 드립니다.
                </p>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 col-sm-12 single-trainer">
            <div class="thumb d-flex justify-content-sm-center">
              <img class="img-fluid" src="img/trainer/t4.png" alt="" />
            </div>
            <div class="meta-text text-sm-center">
              <h4>김희영</h4>
              <p class="designation">NCS 직업기초 및 취업 관리</p>
              <div class="mb-4">
                <p>
                  정답을 드리기보다 경우의 수를 같이 고민하고 대비하고자 합니다.
                  같이 길을 찾을 수 있게 도와드리겠습니다.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================ End Trainers Area =================-->

    <!--================ Start Events Area =================-->
<!--     <div class="events_area"> -->
<!--       <div class="container"> -->
<!--         <div class="row justify-content-center"> -->
<!--           <div class="col-lg-5"> -->
<!--             <div class="main_title"> -->
<!--               <h2 class="mb-3 text-white">수강 후기</h2> -->
<!--               <p> -->
<!--                 교육생들의 생생한 교육현장을 함께하세요. -->
<!--               </p> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--         <div class="row"> -->
<!--           <div class="col-lg-6 col-md-6"> -->
<!--             <div class="single_event position-relative"> -->
<!--               <div class="event_thumb"> -->
<!--                 <img src="img/event/e1.jpg" alt="" /> -->
<!--               </div> -->
<!--               <div class="event_details"> -->
<!--                 <div class="d-flex mb-4"> -->
<!--                   <div class="date"><span>6</span>month</div> -->

<!--                   <div class="time-location"> -->
<!--                     <p> -->
<!--                       <span class="ti-time mr-2"></span> 04.01 ~ 09.01 -->
<!--                     </p> -->
<!--                     <p> -->
<!--                       <span class="ti-location-pin mr-2"></span> 자바 개발자 양성 -->
<!--                     </p> -->
<!--                   </div> -->
<!--                 </div> -->
<!--                 <p> -->
<!--                   국비과정에 대해서 부정적인 얘기들을 많이 들어서 반신반의 하는 마음으로 왔지만,  -->
<!--                   시간이 지나면서 마음이 바뀌고··· -->
<!--                 </p> -->
<!--                 <a href="#" class="primary-btn rounded-0 mt-3">자세히 보기</a> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="col-lg-6 col-md-6"> -->
<!--             <div class="single_event position-relative"> -->
<!--               <div class="event_thumb"> -->
<!--                 <img src="img/event/e2.jpg" alt="" /> -->
<!--               </div> -->
<!--               <div class="event_details"> -->
<!--                 <div class="d-flex mb-4"> -->
<!--                   <div class="date"><span>2</span> month</div> -->

<!--                   <div class="time-location"> -->
<!--                     <p> -->
<!--                       <span class="ti-time mr-2"></span> 06.01 ~ 08.01 -->
<!--                     </p> -->
<!--                     <p> -->
<!--                       <span class="ti-location-pin mr-2"></span> ORACLE 전문가 -->
<!--                     </p> -->
<!--                   </div> -->
<!--                 </div> -->
<!--                 <p> -->
<!--                   전공자지만 전공 부분에 있어서 부족하다고 느껴 학원에서 프로젝트를 준비하면서 취업준비를 병행하기 위해 신청하였는데··· -->
                  
<!--                 </p> -->
<!--                 <a href="#" class="primary-btn rounded-0 mt-3">자세히 보기</a> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->

<!--           <div class="col-lg-12"> -->
<!--             <div class="text-center pt-lg-5 pt-3"> -->
<!--               <a href="#" class="event-link"> -->
<!--                 수강후기 더보기 <img src="img/next.png" alt="" /> -->
<!--               </a> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
    <!--================ End Events Area =================-->

    <!--================ Start Testimonial Area =================-->
    <div class="testimonial_area section_gap">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-5">
            <div class="main_title">
              <h2 class="mb-3">수상 이력</h2>
              <p>
                성공적인 인생 스토리를 응원합니다.
              </p>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="testi_slider owl-carousel">
            <div class="testi_item">
              <div class="row">
                <div class="col-lg-4 col-md-6">
                  <img src="img/testimonials/Innovative.png" alt="" />
                </div>
                <div class="col-lg-8">
                  <div class="testi_text">
                    <h4>MOST INNOVATEIVE</h4>
                    <p>
                      2017 최고의 혁신상 수상
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="testi_item">
              <div class="row">
                <div class="col-lg-4 col-md-6">
                  <img src="img/testimonials/bestFX.png" alt="" />
                </div>
                <div class="col-lg-8">
                  <div class="testi_text">
                    <h4>BEST FX</h4>
                    <p>
                      2017 최고의 효과
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="testi_item">
              <div class="row">
                <div class="col-lg-4 col-md-6">
                  <img src="img/testimonials/forex.png" alt="" />
                </div>
                <div class="col-lg-8">
                  <div class="testi_text">
                    <h4>BEST ONLINE</h4>
                    <p>
                      BEST ONLINE <br>
                      FOREX TRADING
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="testi_item">
              <div class="row">
                <div class="col-lg-4 col-md-6">
                  <img src="img/testimonials/customer.png" alt="" />
                </div>
                <div class="col-lg-8">
                  <div class="testi_text">
                    <h4>BEST CUSTOMER&SERIVCE</h4>
                    <p>
                      2017 BEST CUSTOMER<br>
                      SERVICE
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--================ End Testimonial Area =================-->

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

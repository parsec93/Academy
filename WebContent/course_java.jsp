<%@page import="vo.BoardPageInfo"%>
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
    <title>강의안내 - JAVA</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/flaticon.css" />
    <link rel="stylesheet" href="css/themify-icons.css" />
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
    <!-- main css -->
    <link rel="stylesheet" href="css/style.css" />
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<!-- <script type="text/javascript"> -->
<!-- // $document.ready(function(){ -->
<!-- // 	$.ajax({ -->
<!-- // 		url:'./review.al', -->
<!-- // 		data:{lecture:'java'}, -->
<!-- // 		method:"GET", -->
<!-- // 		dataType:"json", -->
<!-- // 		success:function(json){ -->
<!-- // 			$(json).find('행이름').each(function(){ -->
<!-- // 				var name = $(this).find('열이름').text(); -->
<!-- // 				var lecture = $(this).find('열이름').text(); -->
<!-- // 				var review = $(this).find('열이름').text(); -->
				
<!-- // 				$('#content').append("<ul><li>" + lecture + "</li><li>" + review + "</li><li>" + name + "</li></ul>"); -->
<!-- // 			}); -->
<!-- // 		} -->
<!-- // 	}); -->
<!-- // }); -->

<!-- </script> -->
<%
request.setCharacterEncoding("UTF-8");
ArrayList<LectureBean> review = (ArrayList<LectureBean>)request.getAttribute("review");
BoardPageInfo boardPageInfo = (BoardPageInfo)request.getAttribute("boardPageInfo");

int listCount = boardPageInfo.getListCount();
int nowPage = boardPageInfo.getPage();
int startPage = boardPageInfo.getStartPage();
int endPage = boardPageInfo.getEndPage();
int maxPage = boardPageInfo.getMaxPage();
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
                <h2>JAVA</h2>
                <div class="page_link">
                  <a href="courses.jsp">강의안내</a>
                  <a href="coures_jsp.jsp">JSP</a>
                  <a href="coures_oracle.jsp">ORACLE</a>
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
                        <img class="img-fluid" src="img/courses/course-details.png" alt="">
                    </div>
                    <div class="content_wrapper">
                        <h4 class="title">교육목표</h4>
                        <div class="content">
                            자바 응용소프트웨어 개발에 사용되는 자바 프로그래밍 언어의 기초문법을 적용하고 언어의 특징과 라이브러리를 활용하여 
                            기본 응용소프트웨어를 구현하는 능력을 함양할 수 있다.
                            실습 위주의 개인 과제수행을 통하여 실무에 바로 적용할 수 있는 응용소프트웨어 개발 능력을 함양할 수 있다.
                            OCJP 국제공인자격증 취득이 가능하도록 합니다.
                            <br>
                            <br>

                        </div>

                        <h4 class="title">주요 훈련 내용</h4>
                        <div class="content">
                           	JAVA 언어의 기본 문법 및 객체지향 프로그래밍 개념<br />
                            웹 애플리케이션 학습<br />
                            JAVA 언어로 구현하는 Web 서버 응용 프로그램 학습
                            
                            <br>
                            <br>
                        </div>

                        <h4 class="title">수강후기</h4>
                        <div class="content">
                            <ul class="course_list">
                          <%   if(review == null){%>
                 
                          <%}else{ 
                          
                          	for(int i = review.size()-1 ; i >= 0 ; i--){
                          	LectureBean lb = (LectureBean)review.get(i);
                          	
                          		if(lb.getLecture_content() == null){%>
                          
                          		<%}else {
                          	%>
                                <li class="justify-content-between d-flex">
                                    <a class="course_text" href='javascript:void(0);' onClick='return false'><b>[<%=lb.getLecture_subject() %>]</b>&nbsp;<%= lb.getLecture_content() %></a>
                                    <a class="primary-btn text-uppercase" href='javascript:void(0);' onClick='return false'><%=lb.getLecture_teacher() %></a>
                                </li>
                                <%} 
								} 
							}%>
                            </ul>
                        </div>
                        
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                		<%if(nowPage <= 1 ) { %>
					                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Previous">
                                        <span aria-hidden="true">
                                            <i class="ti-angle-left"></i>
                                        </span>
                                    </a>
                                </li>
						<%} else { %>
						                                <li class="page-item">
                                    <a href="review.al?lecture=java&page=<%=nowPage -1 %>" class="page-link" aria-label="Previous">
                                        <span aria-hidden="true">
                                            <i class="ti-angle-left"></i>
                                        </span>
                                    </a>
                                </li>
						<%} %>
		
					<%for(int i = startPage ; i <= endPage; i++) {
			if(i == nowPage) {%>
				[<%=i %>]
			<%} else { %>
				<li class="page-item active"><a href = "review.al?lecture=java&page=<%=i %>">[<%=i %>]</a></li>
			<%} %>
		<%} %>
		
		<%if(nowPage >= maxPage){ %>
			                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Next">
                                        <span aria-hidden="true">
                                            <i class="ti-angle-right"></i>
                                        </span>
                                    </a>
                                </li>
		<%} else {  %>
		                                <li class="page-item">
                                    <a href="a href="review.al?lecture=java&page=<%=nowPage +1 %>" class="page-link" aria-label="Next">
                                        <span aria-hidden="true">
                                            <i class="ti-angle-right"></i>
                                        </span>
                                    </a>
                                </li>
		<%} %>


                            </ul>
                        </nav>
                        
                    </div>
                </div>


                <div class="col-lg-4 right-contents">
                    <ul>
                        <li>
                            <a class="justify-content-between d-flex" href="#">
                                <p>교육과정</p>
                                <span class="or">JAVA/android</span>
                            </a>
                        </li>
                        <li>
                            <a class="justify-content-between d-flex" href="#">
                                <p>교육비용</p>
                                <span>과정별상이</span>
                            </a>
                        </li>
                        <li>
                            <a class="justify-content-between d-flex" href="#">
                                <p>교육시간</p>
                                <span>오전반/오후반/저녁</span>
                            </a>
                        </li>
                        <li>
                            <a class="justify-content-between d-flex" href="#">
                                <p>교육기간</p>
                                <span>매월 1일 시작</span>
                            </a>
                        </li>
                    </ul>
                    <a href="enrolment.jsp" class="primary-btn2 text-uppercase enroll rounded-0 text-white">수강신청</a>

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
                                            <img src="img/courses/author2.png" alt="">
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
                                            <img src="img/courses/author1.png" alt="">
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
                                            <img src="img/courses/author1.png" alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="#">정규태</a>
<!--                                                 <div class="star"> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star checked"></span> -->
<!--                                                     <span class="ti-star"></span> -->
<!--                                                     <span class="ti-star"></span> -->
<!--                                                 </div> -->
                                            </h5>
                                            <p class="comment">
                                                JAVA 8 재직자, 실업자 교육<br />
                                                JSP Model1 / Model2(MVC)<br />
                                                Spring 프레임워크 (MVC 패턴)
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
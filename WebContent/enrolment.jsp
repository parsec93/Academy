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
    <title>수강 신청</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/flaticon.css" />
    <link rel="stylesheet" href="css/themify-icons.css" />
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
    <!-- login css -->
    <link rel="stylesheet" href="css/style.css" />
    <!-- enrolment css -->
    <link rel="stylesheet" href="css/enrolment.css" />
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
                <h2>수강신청</h2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->
	
	

	<div class="class-combine_lecture-main">
    <!-- Contain-Area -->
    <div class="clearfix content-box">

        <!-- AREA: 강좌검색영역 -->
        <div class="clearfix lecture-title-area">
            <div class="lecture-title">
                <strong>강좌 검색하기</strong>
            </div>
        </div>

        <!-- Search Filter -->
        <form action="" class="clearfix">
            <!-- Lecture Explorer -->
            <div class="clearfix lecture-select lecture-select-depth-5">
                <!-- COMMENT: lecture-select-depth-*은 필터단계에 따른 하위 select-division 수와 맞춰야 한다. -->
                
                <div class="select-division">
                    <!-- COMMENT: 단계 활성화(active), 선택됨(selected). -->
                    <strong>과목 <i class="arrow-right"></i></strong>
                    <ul class="lecture-select-area lecture-select-subject" id="select_subject">
                                            <li class=""><a href="#none" data-idx="0">JAVA</a></li>
                                            <li class="active"><a href="#none" data-idx="1">oracle</a></li>
                                            <li class=""><a href="#none" data-idx="2">jsp</a></li>

                                        </ul>
                </div>
                
                <div class="select-division">
                    <strong>시간 <i class="arrow-right"></i></strong>
                    <ul class="lecture-select-area lecture-select-type" id="select_type">
                                            <li class="active"><a href="#none" data-idx="0">평일 오전</a></li>
                                            <li class=""><a href="#none" data-idx="1">평일 오후</a></li>
                                            <li class=""><a href="#none" data-idx="2">종일반</a></li>
                                            <li class=""><a href="#none" data-idx="3">평일 저녁</a></li>
                                            <li class=""><a href="#none" data-idx="4">주말반</a></li>
                                        </ul>
                </div>
                
                <div class="select-division">
                    <strong>커리큘럼 유형 <i class="arrow-right"></i></strong>
                    <ul class="lecture-select-area lecture-select-curriculum" id="select_curriculum">
                    <li class="active"><a href="#none" data-idx="">전체</a></li>
                                            <li><a href="#none" data-idx="0">ㅇㅇ?멀로하지</a></li>
                                            <li><a href="#none" data-idx="1">ㅇㅇ?멀로하지2?</a></li>
                                            <li><a href="#none" data-idx="2">최신경향 문제풀이??</a></li>
                                            <li><a href="#none" data-idx="3">모의고사ㅋㅋ</a></li>
                                            <li><a href="#none" data-idx="4">머하징ㅋ</a></li>
                                        </ul>
                </div>
                
                
            </div>
        </form>
        <!-- // Search Filter -->

		<div id="lecture_list" style="margin-top:20px;">
			<!-- clearfix lecture-title-area -->
			<div class="clearfix lecture-title-area">
				<div class="lecture-title">
					<img src="img/enrolment/testimg01.jpg" alt=""  style="width:36px;"/>
					<strong>권민섭ㅡㅡ</strong>
				</div>
			
			</div>
			
			<!-- clearfix lecture-list-area -->
			<div class="clearfix lecture-list-area">
			
				<!-- 리스트목록 추가하고싶으면 여기div 에서부터 복사해서 쓰면됨! clearfix lecture-division 시작-->
				<div class="clearfix lecture-division">
					<div class="lecture-summary">
						<p class="summary-title">
							<strong>토익</strong>
							<strong>기본</strong>
							<strong>750+</strong>
						</p>
						<div class="summary-image">
							<img src="img/enrolment/testimg02.png" alt="" style="width:120px;" />
							
						</div>
						<div class="summary-info">
							<ul class="clearfix class-combine_badge-list">
								<li class="badge badge-color-type-1">BEST</li>
							
							</ul>
							<a href="#" class="summary-info-title">[정재현의 속성반] 토익 all-in-one -빈출 유형만 발라낸 속성반 !저자직강!</a>
							<ul class="summary-info-hash ellipsis">
								<li>&nbsp;</li>
							</ul>
							<div class="summary-division-data">
								<dl class="summary-data-focus">
									<dt>정재현</dt>
									<dd>
										<span class="blt-check"></span>
									</dd>
								</dl>
								<dl class="summary-data-focus">
									<dt>수강기간</dt>
									<dd>45일</dd>
								</dl>
<!-- 								<dl> -->
<!-- 									<dt>타임라인</dt> -->
<!-- 									<dd>2</dd> -->
<!-- 								</dl> -->
							
							</div>
						
						</div>
						<div class="summary-button">
							<ul class="summary-button-list">
								<li>
									<a href="#" class="ot_paly">OT</a>
								
								</li>
								<li>
									<a href="#" class="prev_play">맛보기</a>
								
								</li>
<!-- 								<li> -->
<!-- 									<a href="#">바로재생</a> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<a href="#">교재</a> -->
<!-- 								</li> -->
							
							</ul>
						
						</div>
						<ul class="summary-order">
							<li>
								<div class="summary-order-detail clearfix">
									<input type="checkbox" class="order-check order-lecture">
									<label class="label-order">
										<strong>강좌</strong>
									</label>
									<div class="check-order-lecture">
										<p class="order-price">
											<strong class="price-discount">
											"130,000"
											</strong>
										</p>
									</div>
									
								</div>
							</li>
							<li>
								<div class="summary-order-detail clearfix">
									<input type="checkbox" class="order-check">
									<label class="label-order">
										<strong>교재</strong>
									</label>
									<div class="check-order-books">
										<p class="order-price">
											<strong class="price-discount">
											"26,000"
											
											</strong>
											<span class="total-books">
											"2"
											</span>
										</p>
									</div>
									
								
								</div>
							</li>
						
						
						</ul>
					
					</div>
					<div class="book-list">
						<strong>교재</strong>
						<ul class="clearfix book-list-order">
							<li>
								<a href="#">몰라몰라</a>
								<div class="summary-order-detail">
									<input type="checkbox" class="order-check">
									<label class="label-order">
										<strong>교재</strong>
									</label>
									<div class="check-order-lecture">
										<p class="order-price">
											<span class="price-percent">10</span>
											<span class="price-original">18,800</span>
											<strong class="price-discount">16,000</strong>
										</p>
									
									</div>
								
								</div>
							</li>
							<li>
								<a href="#" class="btn-popup-textbook"></a>
								<div class="summary-order-detail">
									<input type="checkbox" class="order-check">
									<label class="label-order">
										<strong>교재</strong>
									</label>
									<div class="check-order-lecture">
										<p class="order-price">
											<span class="price-percent">10</span>
											<span class="price-original">18,800</span>
											<strong class="price-discount">16,000</strong>
										</p>
									
									</div>
								
								</div>
							</li>
						</ul>
					</div>		
				</div> <!--  clearfix lecture-division end -->
				
				
				<!-- 리스트목록 추가하고싶으면 여기div 에서부터 복사해서 쓰면됨! clearfix lecture-division 시작-->
				<div class="clearfix lecture-division">
					<div class="lecture-summary">
						<p class="summary-title">
							<strong>토익</strong>
							<strong>기본</strong>
							<strong>750+</strong>
						</p>
						<div class="summary-image">
							<img src="img/enrolment/testimg02.png" alt="" style="width:120px;" />
							
						</div>
						<div class="summary-info">
							<ul class="clearfix class-combine_badge-list">
								<li class="badge badge-color-type-1">BEST</li>
							
							</ul>
							<a href="#" class="summary-info-title">[정재현의 속성반] 토익 all-in-one -빈출 유형만 발라낸 속성반 !저자직강!</a>
							<ul class="summary-info-hash ellipsis">
								<li>&nbsp;</li>
							</ul>
							<div class="summary-division-data">
								<dl class="summary-data-focus">
									<dt>정재현</dt>
									<dd>
										<span class="blt-check"></span>
									</dd>
								</dl>
								<dl class="summary-data-focus">
									<dt>수강기간</dt>
									<dd>45일</dd>
								</dl>
<!-- 								<dl> -->
<!-- 									<dt>타임라인</dt> -->
<!-- 									<dd>2</dd> -->
<!-- 								</dl> -->
							
							</div>
						
						</div>
						<div class="summary-button">
							<ul class="summary-button-list">
								<li>
									<a href="#" class="ot_paly">OT</a>
								
								</li>
								<li>
									<a href="#" class="prev_play">맛보기</a>
								
								</li>
<!-- 								<li> -->
<!-- 									<a href="#">바로재생</a> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<a href="#">교재</a> -->
<!-- 								</li> -->
							
							</ul>
						
						</div>
						<ul class="summary-order">
							<li>
								<div class="summary-order-detail clearfix">
									<input type="checkbox" class="order-check order-lecture">
									<label class="label-order">
										<strong>강좌</strong>
									</label>
									<div class="check-order-lecture">
										<p class="order-price">
											<strong class="price-discount">
											"130,000"
											</strong>
										</p>
									</div>
									
								</div>
							</li>
							<li>
								<div class="summary-order-detail clearfix">
									<input type="checkbox" class="order-check">
									<label class="label-order">
										<strong>교재</strong>
									</label>
									<div class="check-order-books">
										<p class="order-price">
											<strong class="price-discount">
											"26,000"
											
											</strong>
											<span class="total-books">
											"2"
											</span>
										</p>
									</div>
									
								
								</div>
							</li>
						
						
						</ul>
					
					</div>
					<div class="book-list">
						<strong>교재</strong>
						<ul class="clearfix book-list-order">
							<li>
								<a href="#">몰라몰라</a>
								<div class="summary-order-detail">
									<input type="checkbox" class="order-check">
									<label class="label-order">
										<strong>교재</strong>
									</label>
									<div class="check-order-lecture">
										<p class="order-price">
											<span class="price-percent">10</span>
											<span class="price-original">18,800</span>
											<strong class="price-discount">16,000</strong>
										</p>
									
									</div>
								
								</div>
							</li>
							<li>
								<a href="#" class="btn-popup-textbook"></a>
								<div class="summary-order-detail">
									<input type="checkbox" class="order-check">
									<label class="label-order">
										<strong>교재</strong>
									</label>
									<div class="check-order-lecture">
										<p class="order-price">
											<span class="price-percent">10</span>
											<span class="price-original">18,800</span>
											<strong class="price-discount">16,000</strong>
										</p>
									
									</div>
								
								</div>
							</li>
						</ul>
					</div>		
				</div> <!--  clearfix lecture-division end -->
				
				
				<!-- 리스트목록 추가하고싶으면 여기div 에서부터 복사해서 쓰면됨! clearfix lecture-division 시작-->
				<div class="clearfix lecture-division">
					<div class="lecture-summary">
						<p class="summary-title">
							<strong>토익</strong>
							<strong>기본</strong>
							<strong>750+</strong>
						</p>
						<div class="summary-image">
							<img src="img/enrolment/testimg02.png" alt="" style="width:120px;" />
							
						</div>
						<div class="summary-info">
							<ul class="clearfix class-combine_badge-list">
								<li class="badge badge-color-type-1">BEST</li>
							
							</ul>
							<a href="#" class="summary-info-title">[정재현의 속성반] 토익 all-in-one -빈출 유형만 발라낸 속성반 !저자직강!</a>
							<ul class="summary-info-hash ellipsis">
								<li>&nbsp;</li>
							</ul>
							<div class="summary-division-data">
								<dl class="summary-data-focus">
									<dt>정재현</dt>
									<dd>
										<span class="blt-check"></span>
									</dd>
								</dl>
								<dl class="summary-data-focus">
									<dt>수강기간</dt>
									<dd>45일</dd>
								</dl>
<!-- 								<dl> -->
<!-- 									<dt>타임라인</dt> -->
<!-- 									<dd>2</dd> -->
<!-- 								</dl> -->
							
							</div>
						
						</div>
						<div class="summary-button">
							<ul class="summary-button-list">
								<li>
									<a href="#" class="ot_paly">OT</a>
								
								</li>
								<li>
									<a href="#" class="prev_play">맛보기</a>
								
								</li>
<!-- 								<li> -->
<!-- 									<a href="#">바로재생</a> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<a href="#">교재</a> -->
<!-- 								</li> -->
							
							</ul>
						
						</div>
						<ul class="summary-order">
							<li>
								<div class="summary-order-detail clearfix">
									<input type="checkbox" class="order-check order-lecture">
									<label class="label-order">
										<strong>강좌</strong>
									</label>
									<div class="check-order-lecture">
										<p class="order-price">
											<strong class="price-discount">
											"130,000"
											</strong>
										</p>
									</div>
									
								</div>
							</li>
							<li>
								<div class="summary-order-detail clearfix">
									<input type="checkbox" class="order-check">
									<label class="label-order">
										<strong>교재</strong>
									</label>
									<div class="check-order-books">
										<p class="order-price">
											<strong class="price-discount">
											"26,000"
											
											</strong>
											<span class="total-books">
											"2"
											</span>
										</p>
									</div>
									
								
								</div>
							</li>
						
						
						</ul>
					
					</div>
					<div class="book-list">
						<strong>교재</strong>
						<ul class="clearfix book-list-order">
							<li>
								<a href="#">몰라몰라</a>
								<div class="summary-order-detail">
									<input type="checkbox" class="order-check">
									<label class="label-order">
										<strong>교재</strong>
									</label>
									<div class="check-order-lecture">
										<p class="order-price">
											<span class="price-percent">10</span>
											<span class="price-original">18,800</span>
											<strong class="price-discount">16,000</strong>
										</p>
									
									</div>
								
								</div>
							</li>
							<li>
								<a href="#" class="btn-popup-textbook"></a>
								<div class="summary-order-detail">
									<input type="checkbox" class="order-check">
									<label class="label-order">
										<strong>교재</strong>
									</label>
									<div class="check-order-lecture">
										<p class="order-price">
											<span class="price-percent">10</span>
											<span class="price-original">18,800</span>
											<strong class="price-discount">16,000</strong>
										</p>
									
									</div>
								
								</div>
							</li>
						</ul>
					</div>		
				</div> <!--  clearfix lecture-division end -->
				
				<!-- 리스트목록 추가하고싶으면 여기div 에서부터 복사해서 쓰면됨! clearfix lecture-division 시작-->
				<div class="clearfix lecture-division">
					<div class="lecture-summary">
						<p class="summary-title">
							<strong>토익</strong>
							<strong>기본</strong>
							<strong>750+</strong>
						</p>
						<div class="summary-image">
							<img src="img/enrolment/testimg02.png" alt="" style="width:120px;" />
							
						</div>
						<div class="summary-info">
							<ul class="clearfix class-combine_badge-list">
								<li class="badge badge-color-type-1">BEST</li>
							
							</ul>
							<a href="#" class="summary-info-title">[정재현의 속성반] 토익 all-in-one -빈출 유형만 발라낸 속성반 !저자직강!</a>
							<ul class="summary-info-hash ellipsis">
								<li>&nbsp;</li>
							</ul>
							<div class="summary-division-data">
								<dl class="summary-data-focus">
									<dt>정재현</dt>
									<dd>
										<span class="blt-check"></span>
									</dd>
								</dl>
								<dl class="summary-data-focus">
									<dt>수강기간</dt>
									<dd>45일</dd>
								</dl>
<!-- 								<dl> -->
<!-- 									<dt>타임라인</dt> -->
<!-- 									<dd>2</dd> -->
<!-- 								</dl> -->
							
							</div>
						
						</div>
						<div class="summary-button">
							<ul class="summary-button-list">
								<li>
									<a href="#" class="ot_paly">OT</a>
								
								</li>
								<li>
									<a href="#" class="prev_play">맛보기</a>
								
								</li>
<!-- 								<li> -->
<!-- 									<a href="#">바로재생</a> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<a href="#">교재</a> -->
<!-- 								</li> -->
							
							</ul>
						
						</div>
						<ul class="summary-order">
							<li>
								<div class="summary-order-detail clearfix">
									<input type="checkbox" class="order-check order-lecture">
									<label class="label-order">
										<strong>강좌</strong>
									</label>
									<div class="check-order-lecture">
										<p class="order-price">
											<strong class="price-discount">
											"130,000"
											</strong>
										</p>
									</div>
									
								</div>
							</li>
							<li>
								<div class="summary-order-detail clearfix">
									<input type="checkbox" class="order-check">
									<label class="label-order">
										<strong>교재</strong>
									</label>
									<div class="check-order-books">
										<p class="order-price">
											<strong class="price-discount">
											"26,000"
											
											</strong>
											<span class="total-books">
											"2"
											</span>
										</p>
									</div>
									
								
								</div>
							</li>
						
						
						</ul>
					
					</div>
					<div class="book-list">
						<strong>교재</strong>
						<ul class="clearfix book-list-order">
							<li>
								<a href="#">몰라몰라</a>
								<div class="summary-order-detail">
									<input type="checkbox" class="order-check">
									<label class="label-order">
										<strong>교재</strong>
									</label>
									<div class="check-order-lecture">
										<p class="order-price">
											<span class="price-percent">10</span>
											<span class="price-original">18,800</span>
											<strong class="price-discount">16,000</strong>
										</p>
									
									</div>
								
								</div>
							</li>
							<li>
								<a href="#" class="btn-popup-textbook"></a>
								<div class="summary-order-detail">
									<input type="checkbox" class="order-check">
									<label class="label-order">
										<strong>교재</strong>
									</label>
									<div class="check-order-lecture">
										<p class="order-price">
											<span class="price-percent">10</span>
											<span class="price-original">18,800</span>
											<strong class="price-discount">16,000</strong>
										</p>
									
									</div>
								
								</div>
							</li>
						</ul>
					</div>		
				</div> <!--  clearfix lecture-division end -->
				
				<!-- 리스트목록 추가하고싶으면 여기div 에서부터 복사해서 쓰면됨! clearfix lecture-division 시작-->
				<div class="clearfix lecture-division">
					<div class="lecture-summary">
						<p class="summary-title">
							<strong>토익</strong>
							<strong>기본</strong>
							<strong>750+</strong>
						</p>
						<div class="summary-image">
							<img src="img/enrolment/testimg02.png" alt="" style="width:120px;" />
							
						</div>
						<div class="summary-info">
							<ul class="clearfix class-combine_badge-list">
								<li class="badge badge-color-type-1">BEST</li>
							
							</ul>
							<a href="#" class="summary-info-title">[정재현의 속성반] 토익 all-in-one -빈출 유형만 발라낸 속성반 !저자직강!</a>
							<ul class="summary-info-hash ellipsis">
								<li>&nbsp;</li>
							</ul>
							<div class="summary-division-data">
								<dl class="summary-data-focus">
									<dt>정재현</dt>
									<dd>
										<span class="blt-check"></span>
									</dd>
								</dl>
								<dl class="summary-data-focus">
									<dt>수강기간</dt>
									<dd>45일</dd>
								</dl>
<!-- 								<dl> -->
<!-- 									<dt>타임라인</dt> -->
<!-- 									<dd>2</dd> -->
<!-- 								</dl> -->
							
							</div>
						
						</div>
						<div class="summary-button">
							<ul class="summary-button-list">
								<li>
									<a href="#" class="ot_paly">OT</a>
								
								</li>
								<li>
									<a href="#" class="prev_play">맛보기</a>
								
								</li>
<!-- 								<li> -->
<!-- 									<a href="#">바로재생</a> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<a href="#">교재</a> -->
<!-- 								</li> -->
							
							</ul>
						
						</div>
						<ul class="summary-order">
							<li>
								<div class="summary-order-detail clearfix">
									<input type="checkbox" class="order-check order-lecture">
									<label class="label-order">
										<strong>강좌</strong>
									</label>
									<div class="check-order-lecture">
										<p class="order-price">
											<strong class="price-discount">
											"130,000"
											</strong>
										</p>
									</div>
									
								</div>
							</li>
							<li>
								<div class="summary-order-detail clearfix">
									<input type="checkbox" class="order-check">
									<label class="label-order">
										<strong>교재</strong>
									</label>
									<div class="check-order-books">
										<p class="order-price">
											<strong class="price-discount">
											"26,000"
											
											</strong>
											<span class="total-books">
											"2"
											</span>
										</p>
									</div>
									
								
								</div>
							</li>
						
						
						</ul>
					
					</div>
					<div class="book-list">
						<strong>교재</strong>
						<ul class="clearfix book-list-order">
							<li>
								<a href="#">몰라몰라</a>
								<div class="summary-order-detail">
									<input type="checkbox" class="order-check">
									<label class="label-order">
										<strong>교재</strong>
									</label>
									<div class="check-order-lecture">
										<p class="order-price">
											<span class="price-percent">10</span>
											<span class="price-original">18,800</span>
											<strong class="price-discount">16,000</strong>
										</p>
									
									</div>
								
								</div>
							</li>
							<li>
								<a href="#" class="btn-popup-textbook"></a>
								<div class="summary-order-detail">
									<input type="checkbox" class="order-check">
									<label class="label-order">
										<strong>교재</strong>
									</label>
									<div class="check-order-lecture">
										<p class="order-price">
											<span class="price-percent">10</span>
											<span class="price-original">18,800</span>
											<strong class="price-discount">16,000</strong>
										</p>
									
									</div>
								
								</div>
							</li>
						</ul>
					</div>		
				</div> <!--  clearfix lecture-division end -->
			
			
			</div>
		</div>
		
		<!-- // Search Filter end -->
    </div>
    <!-- // Contain-Area -->
</div>
	
	

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

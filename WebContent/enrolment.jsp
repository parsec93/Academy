<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<!--     <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script> -->
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
	
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://www.conects.com/js/course/common_player.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="//www.conects.com/js/course/online.js"></script>

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
            <div class="clearfix lecture-select lecture-select-depth-3">
                <!-- COMMENT: lecture-select-depth-*은 필터단계에 따른 하위 select-division 수와 맞춰야 한다. -->
                
                <div class="select-division">
                    <!-- COMMENT: 단계 활성화(active), 선택됨(selected). -->
                    <strong>과목 <i class="arrow-right"></i></strong>
                    <ul class="lecture-select-area lecture-select-subject" id="select_subject">
                    						<li class="active"><a href="#none" data-idx="0">전체</a></li>
                                            <li class=""><a href="#none" data-idx="1">JAVA</a></li>
                                            <li class=""><a href="#none" data-idx="2">ORACLE</a></li>
                                            <li class=""><a href="#none" data-idx="3">JSP</a></li>
                                            <li class=""><a href="#none" data-idx="4">Network</a></li>
                                            <li class=""><a href="#none" data-idx="5">Web</a></li>

                                        </ul>
                </div>
                
                <div class="select-division">
                    <strong>요일 <i class="arrow-right"></i></strong>
                    <ul class="lecture-select-area lecture-select-day" id="select_day">
                    						<li class="active"><a href="#none" data-idx="0">전체</a></li>
                                            <li class=""><a href="#none" data-idx="1">월,수,금</a></li>
                                            <li class=""><a href="#none" data-idx="2">화,목</a></li>
                                        </ul>
                </div>
                
                <div class="select-division">
                    <strong>시간 <i class="arrow-right"></i></strong>
                    <ul class="lecture-select-area lecture-select-time" id="select_time">
                    						<li class="active"><a href="#none" data-idx="0">전체</a></li>
                  						    <li class=""><a href="#none" data-idx="1">오전반</a></li>
                                            <li class=""><a href="#none" data-idx="2">오후반</a></li>
                                            <li class=""><a href="#none" data-idx="3">저녁반</a></li>
                                        </ul>
                </div>
                
                
            </div>
        </form>
        <!-- // Search Filter -->
        
        
        
        <script type="text/javascript">
        
        var sId = '<%=(String)session.getAttribute("sId")%>';
        console.log(sId+"여기맞니");
var app = (function(){
	
	var click_type = null;
	
	// 카테고리 기본값
	// 카테고리 인덱스에 따라서 검색
	var category = {};
	category.category_1st = 0;
	category.category_2nd = 0;
	category.category_3rd = 0;
	
	
	var category1_value = 0;
	var category2_value = 0;
	var category3_value = 0;
	
	
	
	// ajax function
	function _ajax(obj){
		console.log(obj.type);
		console.log(obj.url);
		console.log(obj.data);
		$.ajax({
			type : obj.type,
			url  : obj.url,
			data : obj.data,

			
			
			success : function(data){
				   console.log("석세스");
				   console.log(data);
				   var i = 1;
				   
				   $('#lecture_list_area').empty();
				   if(data=="[]"){
					   $('#lecture_list_area').append("해당되는 강의가 없습니다");
				   } else{
				   $.each(JSON.parse(data)	, function(index, item) {
						
					   
					   console.log(item.subject);
					   console.log(item.course);	
					   console.log(item.day);
					   console.log(item.termday);
					   console.log(item.time);
					   console.log(item.fee);
					   console.log(item.teacher);
					   console.log(item.lecture_id);
					   var image;
						   if(item.course=="java"){
							  image = "java.png";
						   }else if(item.course=="jsp"){
							   image = "jsp.png";
						   }else if(item.course=="oracle"){
							   image = "oracle.png";
						   }

					
						$('#lecture_list_area').append(
								'<div style="display:none;">'+item.lecture_id+'</div>'+
								'<div class="clearfix lecture-division">'+
								'<div class="lecture-summary">'+
								'<p class="summary-title">' +
									
									'<strong>'+item.course+'</strong>'+

								'</p>'+
								
								'<div class="summary-image">'+
								'<img src="img/enrolment/'+image+'" alt="" style="width:120px;" />'+
								
								'</div>'+
		
		

								'<div class="summary-info">'+
									'<ul class="clearfix class-combine_badge-list">'+
										'<li class="badge badge-color-type-1">BEST</li>'+
									
									'</ul>'+
									'<a href="#" class="summary-info-title">'+item.subject+'</a>'+
									'<ul class="summary-info-hash ellipsis">'+
										'<li>&nbsp;</li>'+
									'</ul>'+
									'<div class="summary-division-data">'+
										'<dl class="summary-data-focus">'+
											'<dt>'+item.teacher+'</dt>'+
											'<dd>'+
												'<span class="blt-check"></span>'+
											'</dd>'+
										'</dl>'+
										'<dl class="summary-data-focus">'+
											'<dt>수강기간 </dt>'+
											'<dd>'+"&nbsp"+item.termday+"일"+'</dd>'+
										'</dl>'+

									
									'</div>'+
								
								'</div>'+
								
								'<ul class="summary-order">'+
									'<li>'+
										'<div class="summary-order-detail clearfix">'+
											'<input type="checkbox" class="check_lecture" style="display:none" name="ckb" value='+item.lecture_id+'>'+										
											'<label class="label-order">'+
												'<strong>강좌</strong>'+
											'</label>'+
											'<div class="check-order-lecture">'+
												'<p class="order-price">'+
													'<strong class="price-discount">'+
													item.fee+
													'</strong>'+
												'</p>'+
											'</div>'+
											
										'</div>'+
									'</li>'+

								
								'</ul>'+
							
							'</div>'+

						'</div>' 
						
						
						);
						
	                });
				   
				   if(sId !== "null"){	
						$("input[name=ckb]").attr('style', "display:block;");
						
						$('#lecture_list_area').append('<input type="button" id="btn_pay" value="결제" onclick="requestPay()">');
						$('#lecture_list_area').append('<input type="button" id="btn_basket" value="장바구니" onclick="fnGetdata()">');
				  		}
				   }
 
			},error : function(){

				alert('오류가 발생하였습니다.');
				
			}
			
			
           	 });
		
		  
	
	}
	
	


	
	return {
		init : function(){
			
			// 강좌 검색하기 클릭 이벤트
			$(document).on("click", ".lecture-select-area li a",function(){
				
				$(this).parent().addClass('active').siblings().removeClass('active');
				var idx = $(this).data('idx');
				var ul_id = $(this).parent().parent().attr('id');
				if(ul_id == 'select_subject') app.select_subject(idx);
				else if(ul_id == 'select_day') app.select_day(idx);
				else if(ul_id == 'select_time') app.select_time(idx);
			});
			

			app.select_subject(category.category_1st);
		},
		select_subject : function(category_1st){
			
			click_type = 'subject';
			category.category_1st = category_1st;
			category1_value = category_1st;
			category.category_2nd = category2_value; // 수업요일 첫번째
			category.category_3rd = category3_value; // 수업시간 첫번째
			_ajax({type:'POST', url:'./enrolment.le', data:{category1 : category.category_1st, category2 : category.category_2nd, category3 : category.category_3rd}});
		},
		select_day : function(category_2nd){
			click_type = 'day';
			category.category_2nd = category_2nd; //수업요일 선택
			category2_value = category_2nd;
			category.category_3rd = category3_value; // 수업시간 첫번째
			_ajax({type:'POST', url:'./enrolment.le', data:{category1 : category.category_1st, category2 : category.category_2nd, category3 : category.category_3rd}});
		},
		select_time : function(category_3rd){
			click_type = 'time';
			category.category_3rd = category_3rd; // 수업시간 선택
			category3_value = category_3rd;
			_ajax({type:'POST', url:'./enrolment.le', data:{category1 : category.category_1st, category2 : category.category_2nd, category3 : category.category_3rd}});
		}
	}
	

	
}

	
)();

function requestPay(){
	var amount_payment = 0;
	var buy_email = "";
	var buy_name = "";
	var buy_phone = "";
	var buy_add = "";
	var buy_postcode = "";
	$('input:checkbox[name=ckb]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
		var value = $(this).parent().children("div").children("p").children("strong").text();
	 	value *= 1;
	 	amount_payment += value;
	 	
    });
	
	function memberInfo(){
	$.ajax({
		type : "POST",
		url  : "memberInfo.al",
		data : sId,

			
			
		success : function(data){
			
			
				  console.log("석세스");
				  console.log(data);
				  
				  function payment(){
		        		var chkArray2 = new Array();
		        
		        			
		        			$('input:checkbox[name=ckb]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
		        		        chkArray2.push(this.value);
		        		    });
		        		    $('#hiddenValue').val(chkArray2);
		        		    
		        		   
		        		    jQuery.ajaxSettings.traditional = true;
		        		    
		        		    $.ajax({
		        				type : 'POST',
		        				url  : 'payment.al',
		        				data : {
		        				'chkArray2':	chkArray2
		        					},
		        					
		        				 success: function() {
		        					  
		        					 return true;
		        				 },
		        				 error: function() {
		        							
		        					 
		        					 return false;
		        				 }

		        		    });
		        		   
		        		    
		        
				  }
				  
				  
				  var i = 1;
	
				   $.each(JSON.parse(data)	, function(index, item) {
					   buy_email = item.member_email;
					   buy_name = item.member_name;
					   buy_phone = item.member_phone;
					   buy_add = item.member_add1;
					   buy_postcode = item.member_postcode;
					   
						console.log(buy_email);
						console.log(buy_name);
						console.log(buy_phone);
						console.log(buy_add);
						console.log(buy_postcode);
					   
					   IMP.init('imp50126132');
						
						IMP.request_pay({
						 
							
						
					   	pg : 'html5_inicis',
					   	pay_method : 'card',
					  	merchant_uid : 'merchant_' + new Date().getTime(),
					  	name : '수강료 결제',
					    amount : amount_payment,
					   	buyer_email : buy_email,
					    buyer_name : buy_name,
					    buyer_tel : buy_phone,
					    buyer_addr : buy_add,
					    buyer_postcode : buy_postcode
			
						}, function(rsp) {
					    	if ( rsp.success ) {
					        	var msg = '결제가 완료되었습니다.';
					        	msg += '고유ID : ' + rsp.imp_uid;
					        	msg += '상점 거래ID : ' + rsp.merchant_uid;
					        	msg += '결제 금액 : ' + rsp.paid_amount;
					        	msg += '카드 승인번호 : ' + rsp.apply_num;
					        	
								 payment();
								 app.init();
					        	
					        	
					        	
					        	
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					    }
						

					    alert(msg);
				   });
					    
				   });
						
				   
						
	            
				   
				   
 
			},error : function(){

				alert('오류가 발생하였습니다.');
				
			}
			
			
           });
	
	}
	
		
	
	
	memberInfo();


	
	
}



$(document).ready(function(){
	app.init();
	

});

function fnGetdata(){
    var chkArray = new Array(); // 배열 선언

    $('input:checkbox[name=ckb]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
        chkArray.push(this.value);
    });
    $('#hiddenValue').val(chkArray);
    
   
    jQuery.ajaxSettings.traditional = true;

    
    $.ajax({
		type : 'POST',
		url  : 'basket.al',
		data : {
		'chkArray':	chkArray
			},
			
		 success: function() {
			 alert('장바구니에 추가되었습니다.');    	
		 },
		 error: function() {
					
			 alert('오류가 발생하였습니다.');
		 }


    });
    
}





</script>

<form>



</form>


			<!-- clearfix lecture-title-area -->
			<div class="clearfix lecture-title-area">
				<div class="lecture-title">
					<strong>강의목록</strong>
				</div>
			
			</div>
			
		<div id="lecture_list" style="margin-top:20px;">

			<!-- clearfix lecture-list-area -->
			<div class="clearfix lecture-list-area" id="lecture_list_area">
			
	
			
			
			</div>
			
			<input type="hidden" name="hiddenValue" id="hiddenValue" value=""/>
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
<!--     <script src="js/jquery-3.2.1.min.js"></script> -->
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

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
    <title>오시는 길</title>
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
                <h2>오시는 길</h2>
<!--                 <div class="page_link"> -->
<!--                   <a href="index.html">Home</a> -->
<!--                   <a href="contact.html">Contact</a> -->
<!--                 </div> -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

    <!--================Contact Area =================-->
    <section class="contact_area section_gap">
      <div class="container">
<!--         <div -->
<!--           id="mapBox" -->
<!--           class="mapBox" -->
<!--           data-lat="40.701083" -->
<!--           data-lon="-74.1522848" -->
<!--           data-zoom="13" -->
<!--           data-info="PO Box CT16122 Collins Street West, Victoria 8007, Australia." -->
<!--           data-mlat="40.701083" -->
<!--           data-mlon="-74.1522848" -->
<!--         ></div> -->
<div class="mapwrap">
<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d13047.982132145402!2d129.06387384445802!3d35.156732154596945!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x8e030b4b8ef4a2dd!2z7JWE7J207Yuw7JyMIOu2gOyCsOq1kOycoeyEvO2EsA!5e0!3m2!1sko!2skr!4v1567239896228!5m2!1sko!2skr" 
width="100%" height="450" frameborder="0" 
style="border:0;" allowfullscreen=""></iframe>
</div>

        <div class="row">
          <div class="col-lg-3">
            <div class="contact_info">
              <div class="info_item">
                <i class="ti-home"></i>
                <h6>대한민국 부산광역시</h6>
                <p>부산 진구 동천로 109<br />삼한골든게이트빌딩 7층</p>
              </div>
              <div class="info_item">
                <i class="ti-headphone"></i>
                <h6><a href="#">051-803-0909</a></h6>
                <p>상담전화 AM 9 ~  PM 6</p>
              </div>
              <div class="info_item">
                <i class="ti-email"></i>
                <h6><a href="#">support@support.com</a></h6>
                <p>언제든지 문의하세요!</p>
              </div>
            </div>
          </div>
          <div class="col-lg-9">
            <form
              class="row contact_form"
              action="contact_process.php"
              method="post"
              id="contactForm"
              novalidate="novalidate"
            >
              <div class="col-md-6">
                <div class="form-group">
                  <input
                    type="text"
                    class="form-control"
                    id="name"
                    name="name"
                    placeholder="이름"
                    onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Enter your name'"
                    required=""
                  />
                </div>
                <div class="form-group">
                  <input
                    type="email"
                    class="form-control"
                    id="email"
                    name="email"
                    placeholder="이메일"
                    onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Enter email address'"
                    required=""
                  />
                </div>
                <div class="form-group">
                  <input
                    type="text"
                    class="form-control"
                    id="subject"
                    name="subject"
                    placeholder="제목"
                    onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Enter Subject'"
                    required=""
                  />
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <textarea
                    class="form-control"
                    name="message"
                    id="message"
                    rows="1"
                    placeholder="메세지"
                    onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Enter Message'"
                    required=""
                  ></textarea>
                </div>
              </div>
              <div class="col-md-12 text-right">
                <button type="submit" value="submit" class="btn primary-btn">
                  보내기
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    <!--================Contact Area =================-->

    <!--================ start footer Area  =================-->
    <jsp:include page="header_footer/footer.jsp" />
    <!--================ End footer Area  =================-->

    <!--================Contact Success and Error message Area =================-->
    <div id="success" class="modal modal-message fade" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <i class="ti-close"></i>
            </button>
            <h2>Thank you</h2>
            <p>Your message is successfully sent...</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Modals error -->

    <div id="error" class="modal modal-message fade" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <i class="ti-close"></i>
            </button>
            <h2>Sorry !</h2>
            <p>Something went wrong</p>
          </div>
        </div>
      </div>
    </div>
    <!--================End Contact Success and Error message Area =================-->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/stellar.js"></script>
    <script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
    <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
    <script src="js/owl-carousel-thumb.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/mail-script.js"></script>
    <!--gmaps Js-->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
    <script src="js/gmaps.min.js"></script>
    <script src="js/contact.js"></script>
    <script src="js/theme.js"></script>
  </body>
</html>

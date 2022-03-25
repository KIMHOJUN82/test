<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "kr.go.cdc.common.util.CommonUtil"
    import = "kr.go.cdc.common.util.CheckInval" %>
<%
   String ctxpath = request.getContextPath();
   /* PARAMETER */
   String sPrepage = CommonUtil.null2Void((String)session.getAttribute("prepage"));
   session.setAttribute("prepage", "");

   sPrepage = CheckInval.cleanXSSFilter(sPrepage);

   response.setHeader("cache-control","no-store"); // http 1.1   
   response.setHeader("Pragma","no-cache");        // http 1.0   
   response.setDateHeader("Expires",0);            // proxy server 에 cache방지.
   response.addHeader("X-Content-Type-Options", "nosniff");
   response.setHeader("X-XSS-Protection", "1; mode=block");

   Cookie cookie = new Cookie("name", "Javaking"); //쿠키객체를 생성함과 동시에 쿠키 이름과 값을 설정
   cookie.setMaxAge(60); //유효시간을 10분으로 설정
   response.addCookie(cookie); //생성한 쿠키를 클라이언트로 전송

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate" />
   <meta http-equiv="Content-Security-Policy" content="script-src  'self' 'unsafe-inline' 'unsafe-eval' data: *.google-analytics.com;
                                                       style-src   'self' 'unsafe-inline';
                                                       img-src     'self' data: *.cdc.go.kr/ *.kdca.go.kr/ http://127.0.0.1:8080 *.google-analytics.com ; 
                                                       connect-src 'self' wss://localhost:10531/ wss://127.0.0.1:10531/ wss://127.0.0.1:22094/ https://127.0.0.1:22094/ wss://127.0.0.1:31026/ wss://127.0.0.1:31027/ wss://127.0.0.1:31028/ wss://127.0.0.1:31029/; " />

   <title>예방접종 도우미</title>
   <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/common/css/main.css?version=20160919" />
   <link rel="stylesheet" type="text/css" href="<%=ctxpath%>/common/css/layer_popup.css?version=20160919" />
   <script type="text/javascript" src="<%=ctxpath%>/common/js/common.js"></script>
   <script type="text/javascript" src="<%=ctxpath%>/common/js/jquery-1.4.4.min.js"></script>
   <%-- <script type="text/javascript" src="<%=ctxpath%>/common/js/jquery.DOMwindow.js"></script> --%>
   <script type="text/javascript" src="<%=ctxpath%>/common/js/IRDataQualityJS.js"></script>
   <script type="text/javascript"> top.document.title = "질병관리본부 예방접종도우미"; </script>
   <script type="text/javascript">

   var _gaq = _gaq || [];
   _gaq.push(['_setAccount', 'UA-4364970-2']);
   _gaq.push(['_trackPageview']);

   (function() {
     var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
     ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
     var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
   })();

   document.oncontextmenu = new Function('return false');      // 우클릭방지
   //document.ondragstart = new Function('reutrn false');        // 드래그 방지
   document.onselectstart = new Function('return false');      // 복사 방지

/*    //쿠키저장 함수
   function setCookie( name, value, expiredays ) { 
       var todayDate = new Date(); 
       todayDate.setDate( todayDate.getDate() + expiredays ); 
       document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
    } */
    $(document).ready(function(){
      $("#promotionBanner .btnClose").click(function(){
         $('#promotionBanner').slideUp(500);
      });
   });
   
   </script>
   <style type="text/css">
       #promotionBanner {width: 980px; height: 100px; color: #f1f1f1; margin: 0 auto; position: relative;}
      .popContents {margin-bottom:-4px; overflow: hidden; text-align: center; display: inline-block; position: absolute;}
      .popClose { font-size: 9pt; display: inline-block; position: absolute;}
      #chkday {color: #5a5a5a;}
      label[for=chkday] { cursor: pointer; color: black;}
   </style>
<%@ include file="/common/jsp/infuseyon_check.jsp" %>

<!-- 2016.11.09 kang si jung - body page로 이전 -->
<%-- <jsp:include page="/common/jsp/popup_layer.jsp" flush="true" /> --%>
</head>
<% if("".equals(sPrepage) && CommonUtil.null2Void((String)request.getAttribute("isIndex")).equals("ok")) { out.print(""); %>
<body id="main">
<%-- <jsp:include page="/common/jsp/popup/20120625/popup.jsp" flush="true" /> --%>

<div>
   <div id="promotionBanner">
      <div class="popContents">
         <img src="./common/images/index_banner.gif" height="100"/>
      </div>
      <div class="popClose">
         <!-- <input type="checkbox" value="checkbox" name="chkbox" id="chkday" style="position: absolute; margin-left: 790px; height: 80px;"/> -->
         <label for="chkday"><button class="btnClose" style="font-size :23px; background-color: transparent; border: 0; border-radius :0; margin-left: 947px;">ⓧ</button></label>
         <!-- <label for="chkday"><button class="btnClose" style="background-color: transparent; border: 0; border-radius :0; height: 80px; margin-left: 800px;">X</button></label> -->
         <!-- <a href="#" class="btnClose" style="margin-left: 980px; font-weight: bold; font-size: 15px;">X</a> --> 
      </div>
   </div>
</div>

<div id="wrap">
   <script type="text/javascript">
/*     cookiedata = document.cookie;
    if ( cookiedata.indexOf("topPop=done") < 0 ){
        document.all['promotionBanner'].style.display = "block";
        } 
    else {
        document.all['promotionBanner'].style.display = "none"; 
    } */
   </script>
   <!-- 메인 메뉴  -->
   <div id="mainMenu">
      <jsp:include page="/common/jsp/topMenu.jsp" flush="true" />
   </div>
   <!-- 메인 페이지 -->
   <div id="container">
      <!-- 퀵 메뉴-->
      <div id="aside">
         <jsp:include page="/common/jsp/quickMenu.jsp" flush="true" />
      </div>
      <!-- 실제 컨텐츠 페이지 -->
      <div id="contents">
         <jsp:include page="/common/jsp/body.jsp" flush="true" />
      </div>
   </div>
   <hr />
   <!-- 하단 정보 -->
   <div id="footer">
      <jsp:include page="/common/jsp/main_footer.jsp" flush="true" />
   </div>
</div>
</body>
<% } else { %>
<%-- <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <meta http-equiv='Cache-Control' content='no-store, no-cache, must-revalidate'/>
   <title>예방접종 도우미</title>
   <script type="text/javascript">
      if("<%=sPrepage %>" != "") {
         location.replace("<%=sPrepage %>");
      }
   </script>
</head> --%>
<body id="main">
   <script type="text/javascript">
      if("<%= sPrepage %>" != "") {
         location.replace("<%= sPrepage %>");
      } else {
         location.href = "<%=ctxpath%>/index.html";
      }
   </script>
</body>
<% } %>
</html>
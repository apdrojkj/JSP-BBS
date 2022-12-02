<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>윈도우팝업</title>


<script type="text/JavaScript">

function getCookie(name) {
    var Found = false
    var start, end
    var i = 0

    // cookie 문자열 전체를 검색
    while(i <= document.cookie.length) {
      start = i
      end = start + name.length
      // name과 동일한 문자가 있다면
      if(document.cookie.substring(start, end) == name) {
        Found = true
        break;
      }
      i++
    }

    // name 문자열을 cookie에서 찾았다면
    if(Found == true) {
      start = end + 1
      end = document.cookie.indexOf(";", start)
      // 마지막 부분이라는 것을 의미(마지막에는 ";"가 없다)
      if(end < start)
      end = document.cookie.length
      // name에 해당하는 value값을 추출하여 리턴한다.
      return document.cookie.substring(start, end)
    }
    // 찾지 못했다면
    return ""
  }

  function openPopup1() {
    var eventCookie=getCookie("testCookie");  // 쿠키이름_cook 은 임의로 꼭 변경하세요.
    if (eventCookie != "no")
    window.open('popup.jsp','_blank','height=500, border=0, toolbar=no, location=no, menubar=no, scrollbars=auto');
    //팝업창의 주소, 같은 도메인에 있어야 한다.
    var eventCookie=getCookie("testCookie2");  // 쿠키이름_cook 은 임의로 꼭 변경하세요.
    if (eventCookie != "no")
    window.open('popup2.jsp','_blank','height=500, border=0, toolbar=no, location=no, menubar=no, scrollbars=auto');
  }

// 오픈 팝업을 한번에 처리하려면 오픈팝업 메서드 안에 이렇게 한번에 처리
// 따로하려면 밑에 코드 주석 풀고 오픈팝업 메서드이름을 1,2로 지정해주고 -> 바디태그안에 -> onload 안에 두개 다 써주기 -> 밑에 예시



    /* function getCookie(name) {
    var Found = false
    var start, end
    var i = 0

    // cookie 문자열 전체를 검색
    while(i <= document.cookie.length) {
      start = i
      end = start + name.length
      // name과 동일한 문자가 있다면
      if(document.cookie.substring(start, end) == name) {
        Found = true
        break;
      }
      i++
    }

    // name 문자열을 cookie에서 찾았다면
    if(Found == true) {
      start = end + 1
      end = document.cookie.indexOf(";", start)
      // 마지막 부분이라는 것을 의미(마지막에는 ";"가 없다)
      if(end < start)
      end = document.cookie.length
      // name에 해당하는 value값을 추출하여 리턴한다.
      return document.cookie.substring(start, end)
    }
    // 찾지 못했다면
    return ""
  }

  function openPopup2() {
    var eventCookie=getCookie("testCookie2");  // 쿠키이름_cook 은 임의로 꼭 변경하세요.
    if (eventCookie != "no")
    window.open('popup2.jsp','_blank','height=500, border=0, toolbar=no, location=no, menubar=no, scrollbars=auto');
    //팝업창의 주소, 같은 도메인에 있어야 한다.
  } */

</script>

</head>
<body onload="openPopup();" >
<!-- <body onload="openPopup1(); openPopup2();" > -->

</body>
</html>
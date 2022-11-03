<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee JSP</title>
</head>
<body>
 <c:set var="UID" value="${param.uid}" />
 <c:set var="FName" value="${param.firstname}" />
 <c:set var="LName" value="${param.lastname}" />
 <c:set var="Age" value="${param.age}" />

<sql:setDataSource var="sample" driver="com.mysql.cj.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/mydemo?serverTimezone=Asia/Taipei"
     user="root"  password="1234"/> 
 
<sql:update dataSource="${sample}" var="result">
       INSERT INTO mydemo.Employees(id,age,firstname,lastname)
        VALUES ( ${UID}, ${Age} ,'${FName}','${LName}' )
</sql:update> 
<sql:query dataSource="${sample}" var="result">
      SELECT * from mydemo.Employees
</sql:query> 
<table border="1" width="60%">
<tr>
   <th>Emp ID</th>
   <th>First Name</th>
   <th>Last Name</th>
   <th>Age</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.id}"/></td>
   <td><c:out value="${row.firstname}"/></td>
   <td><c:out value="${row.lastname}"/></td>
   <td><c:out value="${row.age}"/></td>
</tr>
</c:forEach>
</table> 
</body>
</html>
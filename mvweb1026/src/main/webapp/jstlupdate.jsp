<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<html>
<head>
<title>Update Operation</title>
</head>
<body>
 
<sql:setDataSource var="sample" driver="com.mysql.cj.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/mydemo?serverTimezone=Asia/Taipei"
     user="root"  password="Sm558862"/> 
 
<c:set var="empId" value="${param.uid}"/>
<c:set var="lname" value="${param.lastname}"/>
<c:set var="fname" value="${param.firstname}"/>
<c:set var="age" value="${param.age}"/> 
<sql:update dataSource="${sample}">
        update  mydemo.Employees set  lastname ='${lname}',firstname='${fname}',
                age=${age}  where ID= ${empId} 
</sql:update>
 
<sql:query dataSource="${sample}" var="result">
   SELECT * from mydemo.Employees
</sql:query>
 
<table border="1" width="100%">
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

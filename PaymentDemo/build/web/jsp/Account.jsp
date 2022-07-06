<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
    </head>
    <body>
        <h1>Danh sách tài khoản</h1>
        <table border="1">

	<thead>
		<tr>
			<th>Mã tài khoản</th>
			<th>Số tài khoản</th>
			<th>Tên tài khoản</th>
			<th>Số dư</th>
			<th>Ngày tạo</th>
			<th>Trạng thái</th>
		</tr>
	</thead>
	<tbody>
        <c:forEach items="${listAccount}" var="account">
		<tr>
			<td>${account.accountId}</td>
			<td>${account.accNo}</td>
			<td>${account.accName}</td>
                         <td><fmt:formatNumber type="number"  maxFractionDigits="3" value="${account.availableBalance}" /></td>
                                                   
			
			<td>${account.createDate}</td>
                        <c:if test="${account.status == 'True'}">
                            <td>Kích hoạt</td>
                        </c:if>
                         <c:if test="${account.status == 'False'}">
                            <td>Không kích hoạt</td>
                        </c:if>
                           
			
		</tr>
        </c:forEach>
	</tbody>
</table>
    </body>
</html>

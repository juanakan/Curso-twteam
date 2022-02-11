<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core"   prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="buscarAlumnos" method="get">
			Seleccione curso:
			<select name="idCurso">
			<c:forEach var="curso" items="${requestScope.cursos}">
				<option value="${curso.idCurso}">${curso.denominacion}</option>
			</c:forEach>
			<br>
			<input type="submit" value="Buscar"><br><br>
			<table border="1" class="table table-striped">
			<thead><tr><th>Nombre</th><th>Email</th><th>Edad</th></tr></thead>
			<tbody>
			<c:forEach var="con" items="${requestScope.alumnos}">
				<tr>				
					<td>${con.nombre}</td>
					<td>${con.email}</td>
					<td>${con.edad}</td>
				</tr>
			
			</c:forEach>
			</tbody>
		</table>
		<br><br>
		<a href="toInicio">Volver</a>
		</form>
	</div>
</body>
</html>
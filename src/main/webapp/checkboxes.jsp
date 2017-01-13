<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello User Application</title>
</head>
<body>
	<form action="checkboxesSubmit.jsp" method="POST">
		Select the fruits you like to eat:<br/>
		<input type="checkbox" name="fruit" value="Banana" /> Banana<br/>
		<input type="checkbox" name="fruit" value="Apple" /> Apple<br/>
		<input type="checkbox" name="fruit" value="Orange"/> Orange<br/>
		<input type="checkbox" name = "fruit" value="Guava"/> Guava<br/>
		<input type="checkbox" name="fruit" value="Kiwi" /> Kiwi<br/>
		<input type="submit" value="Submit"/>
	</form>
</body>
</html>
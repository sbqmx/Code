<%--@elvariable id="contacts" type="java.util.Set<com.wrox.Contact" --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Address Book + <fmt:message key="title.browser" /></title>
</head>
<body>
	<h2>Address Book Contacts</h2>
	<p>说明：左侧div区域用EL表达式显示内容，右侧div区域用<b>&lt;fmt&gt;</b>标签显示内容。</p>
	<p>用法：通过在地址栏增加<b>?empty</b>查看空地址簿时页面展示;i18n国际化与本地化展示，需通过<b>?language=usa</b>查看美国区域或<b>?language=french</b>查看法国区域的相应显示。不写language参数则以中文显示。</p>
	<!-- 国际化本地化设置：web.xml的上下文参数配置，接下来在resources文件夹下建立对于的properties类型文件，然后在ListServlet的doGet()方法中根据language参数设置区域 -->
	<div style="background-color: fuchsia;float: left;">
		<h2>Address Book Contacts</h2>
		<c:choose>
			<c:when test="${fn:length(contacts)==0 }">
				<i>There are no contacts in the address book.</i>
			</c:when>
			<c:otherwise>
				<c:forEach items="${contacts }" var="contact">
					<b>
						<c:out value="${contact.lastName }, ${contact.firstName }" />
					</b><br />
					<c:out value="${contact.address }" /><br />
					<c:out value="${contact.phoneNumber }" /><br />
					<c:if test="${contact.birthday !=null }" >
						Birthday: ${contact.birthday }<br />
					</c:if>
					Created: ${contact.dateCreated }<br /><br/>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<div style="background-color:lime; float: left;">
		<h2><fmt:message key="title.page" /></h2>
		<c:choose>
		<c:when test="${fn:length(contacts)==0 }">
			<i><fmt:message key="message.noContacts" /></i>
		</c:when>
		<c:otherwise>
			<c:forEach items="${contacts }" var="contact">
				<b>
					<c:out value="${contact.lastName }, ${contact.firstName }" />
				</b><br />
				<c:out value="${contact.address }" /><br />
				<c:out value="${contact.phoneNumber }" /><br />
				<c:if test="${contact.birthday !=null }" >
					<fmt:message key="label.birthday" />;
					${contact.birthday.month.getDisplayName('FULL', pageContext.response.locale) }&nbsp;${contact.birthday.dayOfMonth }<br/>
				</c:if>
				<fmt:message key="label.creationDate" />:
				<fmt:formatDate value="${contact.oldDateCreated }" type="both" dateStyle="long" timeStyle="long" />
				<br /><br/>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</div>
</body>
</html>
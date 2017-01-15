<%--@elvariable id="ticketId type="java.lang.String" --%>
<%--@elvariable id="ticket" type="com.wrox.Ticket" --%>
<template:basic htmlTitle="${ticket.subject }" bodyTitle="Ticket #${ticketId }: ${ticket.subject }">
	<i>Customer Name - <c:out value="${ticket.customerName }"/><br/>
	Created <wrox:formatDate value="${ticket.dateCreated }" type="both" timeStyle="long" dateStyle="full" />
	</i><br/><br/>
	<c:out value="${ticket.body }"/><br/><br/>
	<c:if test="${ticket.getNumberOfAttachments()>0 }">
		Attachments:
		<c:forEach items="${ticket.attachments }" var="attachment" varStatus="status">
			<c:if test="${!status.first }">,</c:if>
			<a href="<c:url value="/tickets">
                        <c:param name="action" value="download" />
                        <c:param name="ticketId" value="${ticketId }" />
                        <c:param name="attachment" value="${attachment.name }" />
                    </c:url>"><c:out value="${attachment.name }" /></a>
		</c:forEach><br/><br/>
	</c:if>
</template:basic>
<%-- 原代码，新代码使用了自定义标签
<%
    //String ticketId = (String)request.getAttribute("ticketId");
    Ticket ticket = (Ticket)request.getAttribute("ticket");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer Support</title>
    </head>
    <body>
    	<a href="<c:url value="login?logout"/>">注销</a>
        <h2>Ticket #${ticketId }: ${ticket.subject}</h2>
        <i>Customer Name - ${ticket.customerName }</i><br /><br />
        ${ticket.body }<br /><br />
        <%
            if(ticket.getNumberOfAttachments() > 0)
            {
                %>Attachments: <%
                int i = 0;
                for(Attachment a : ticket.getAttachments())
                {
                    if(i++ > 0)
                        out.print(", ");
                    %><a href="<c:url value="/tickets">
                        <c:param name="action" value="download" />
                        <c:param name="ticketId" value="${ticketId }" />
                        <c:param name="attachment" value="<%= a.getName() %>" />
                    </c:url>"><%= a.getName() %></a><%
                }
                %><br /><br /><%
            }
        %>
        <a href="<c:url value="/tickets" />">Return to list tickets</a>
    </body>
</html> --%>

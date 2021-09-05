<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ attribute name="color" %>
<%@ attribute name="size" %>

<p style="font-size:${size}; color:${color};"><jsp:doBody /></p>
" Einige Abkürzungen um JSPs mit JSTL Core Tags komfortabler zu editieren.
" Jörn Horstmann <joern_h@gmx.net>
" 2005-12-20

inoreab <buffer> ctag <%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
inoreab <buffer> ftag <%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
inoreab <buffer> btag <%@taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
inoreab <buffer> htag <%@taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
inoreab <buffer> ptag <%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>

inoreab <buffer> ctyp <%@page contentType="text/html; charset=utf-8" %>

inoreab <buffer> cfor <c:forEach items="${}" var="" varStatus="status"><CR></c:forEach><CR><UP><UP><END><C-O>F}

inoreab <buffer> ccho <c:choose><CR><c:when test="${}"><CR></c:when><CR><c:otherwise><CR></c:otherwise><CR></c:choose><UP><UP><UP><UP><END><C-O>F}
inoreab <buffer> cwhe <c:when test="${}"><CR></c:when><CR><UP><UP><END><C-O>F}
inoreab <buffer> ciff <c:if test="${}"><CR></c:if><UP><END><LEFT><LEFT><LEFT>
inoreab <buffer> cout <c:out value="${}" /><LEFT><LEFT><LEFT><LEFT><LEFT>
inoreab <buffer> cou2 <c:out value='${}' /><LEFT><LEFT><LEFT><LEFT><LEFT>

inoreab <buffer> bmsg <bean:message key="" /><LEFT><LEFT><LEFT><LEFT>
inoreab <buffer> bwri <bean:write property="" /><LEFT><LEFT><LEFT><LEFT>

inoreab <buffer> hfrm <html:form action=""><CR></html:form><UP><END><LEFT><LEFT>
inoreab <buffer> herr <html:errors property="" /><LEFT><LEFT><LEFT><LEFT>
inoreab <buffer> htxt <html:text property="" /><LEFT><LEFT><LEFT><LEFT>
inoreab <buffer> hpwd <html:password property="" /><LEFT><LEFT><LEFT><LEFT>
inoreab <buffer> hsub <html:submit property="" /><LEFT><LEFT><LEFT><LEFT>

" Einige Abkürzungen um XSLT-Dateien konfortabler zu editieren.
" Jörn Horstmann <joern_h@gmx.net>
" 2005-08-08

" stylesheet
inoreab <buffer> xsty <?xml version="1.0" encoding="utf-8" ?><CR><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><CR></xsl:stylesheet><C-O>O

" output=xml
inoreab <buffer> xxml <xsl:output method="xml" indent="yes" encoding="utf-8" />

" output=txt
inoreab <buffer> xtxt <xsl:output method="text" indent="no" encoding="utf-8" />

" strip-space
inoreab <buffer> xssp <xsl:strip-space elements="" /><C-O>F"

" preserve-space
inoreab <buffer> xpsp <xsl:preserve-space elements="" /><C-O>F"

" template+name
inoreab <buffer> xtpn <xsl:template name=""><CR></xsl:template><CR><UP><UP><END><C-O>F"

" template+match
inoreab <buffer> xtpm <xsl:template match=""><CR></xsl:template><CR><UP><UP><END><C-O>F"

inoreab <buffer> xfor <xsl:for-each select=""><CR></xsl:for-each><CR><UP><UP><END><C-O>F"

" param, param+select, param+block
inoreab <buffer> xpar <xsl:param name="" /><C-O>F"
inoreab <buffer> xpas <xsl:param name="" select="." /><C-O>3F"
inoreab <buffer> xpab <xsl:param name=""></xsl:param><C-O>F"

inoreab <buffer> xcho <xsl:choose><CR><xsl:when test=""><CR></xsl:when><CR><xsl:otherwise><CR></xsl:otherwise><CR></xsl:choose><UP><UP><UP><UP><END><C-O>F"
inoreab <buffer> xwhe <xsl:when test=""><CR></xsl:when><CR><UP><UP><END><C-O>F"
inoreab <buffer> xiff <xsl:if test=""><CR></xsl:if><UP><END><C-O>F"

inoreab <buffer> xcal <xsl:call-template name="" /><C-O>F"
inoreab <buffer> xcab <xsl:call-template name=""><CR></xsl:call-template><UP><END><C-O>F"

" apply, apply+select
inoreab <buffer> xapp <xsl:apply-templates />
inoreab <buffer> xaps <xsl:apply-templates select="" /><C-O>F"

" with-param, with-param+select, with-param+block
inoreab <buffer> xwpa <xsl:with-param name="" /><C-O>F"
inoreab <buffer> xwps <xsl:with-param name="" select="" /><C-O>3F"
inoreab <buffer> xwpb <xsl:with-param name=""></xsl:with-param><C-O>F"

" variable, variable+select, variable+block
inoreab <buffer> xvar <xsl:variable name="" /><C-O>F"
inoreab <buffer> xvas <xsl:variable name="" select="" /><C-O>3F"
inoreab <buffer> xvab <xsl:variable name=""></xsl:variable><C-O>F"

" value-of+select, value-of+block
inoreab <buffer> xvos <xsl:value-of select="" /><C-O>F"
inoreab <buffer> xvob <xsl:value-of><CR></xsl:value-of><CR><UP><C-O>O

inoreab <buffer> xtex <xsl:text></xsl:text><C-O>F<

inoreab <buffer> xatv <xsl:attribute name="" value="" /><C-O>3F"
inoreab <buffer> xatb <xsl:attribute name=""></xsl:attribute><C-O>F"

inoreab <buffer> xcos <xsl:copy-of select="" /><C-O>F"
inoreab <buffer> xcob <xsl:copy-of><CR></xsl:copy-of><C-O>O

<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: BOOLEANerr14 -->
  <!-- Document: http://www.w3.org/TR/xpath -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 3.4 -->
  <!-- Creator: David Marston -->
  <!-- Purpose: Give lang() function too many arguments -->
  <!-- ExpectedException: expected one argument -->
  <!-- ExpectedException: FuncLang only allows 1 arguments -->

<xsl:template match="/">
  <out><xsl:apply-templates select="doc/p"/></out>
</xsl:template>

<xsl:template match="p">
  <xsl:value-of select="lang('en','us')"/><xsl:text>, </xsl:text>
</xsl:template>

</xsl:stylesheet>

<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: SORT17 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 10 -->
  <!-- Purpose: Test for xsl:sort on strings without specifying case-order, different language. -->

<xsl:template match="doc">
  <out>
    <xsl:for-each select="item">
      <xsl:sort lang="lt-LT"/>
      <xsl:copy-of select="."/><xsl:text>
</xsl:text>
    </xsl:for-each>
  </out>
</xsl:template>

</xsl:stylesheet>

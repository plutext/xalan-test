<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: POS63 -->
  <!-- Document: http://www.w3.org/TR/xpath -->
  <!-- DocVersion: 19990922 -->
  <!-- Section: 2.4 -->
  <!-- Purpose: Test of less-than-or-equal-to with position(). -->

<xsl:template match="doc">
  <out>
  <xsl:for-each select="a[position() &lt;=3]">
    <xsl:value-of select="."/>
  </xsl:for-each>
  </out>
</xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: POS20 -->
  <!-- Document: http://www.w3.org/TR/xpath -->
  <!-- DocVersion: 19990922 -->
  <!-- Section: 2.4 -->
  <!-- Purpose: Test of positional indexing. -->

<xsl:template match="doc">
  <out>
    <xsl:value-of select="a[3]"/>
  </out>
</xsl:template>

</xsl:stylesheet>

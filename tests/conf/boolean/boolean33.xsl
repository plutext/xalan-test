<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: BOOL33 -->
  <!-- Document: http://www.w3.org/TR/xpath -->
  <!-- DocVersion: 19990922 -->
  <!-- Section: 4.3 -->
  <!-- Purpose: Test of boolean() function, converting a non-empty string to true -->

<xsl:template match="doc">
  <out>
    <xsl:value-of select="boolean('0')"/>
  </out>
</xsl:template>

</xsl:stylesheet>

<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: conditionalerr09 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 9.1 -->
  <!-- Creator: David Marston -->
  <!-- Purpose: Test xsl:if that lacks the required "test" attribute. -->
  <!-- ExpectedException: xsl:if must have a test attribute -->

<xsl:template match="/">
  <out>
    <xsl:if>
      <xsl:text>string</xsl:text>
    </xsl:if>
  </out>
</xsl:template>

</xsl:stylesheet>

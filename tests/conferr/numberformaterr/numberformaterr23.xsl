<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: NUMBERFORMATerr23 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 12.3 -->
  <!-- Creator: David Marston -->
  <!-- Purpose: Put grouping separator adjacent to pattern-separator. -->
  <!-- ExpectedException: java.lang.RuntimeException: Malformed format string -->
  <!-- ExpectedException: Malformed format string: ######,;000,000 -->

<xsl:template match="doc">
  <out>
    <xsl:value-of select="format-number(-90232,'######,;000,000')"/>
  </out>
</xsl:template>

</xsl:stylesheet>

<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- FileName: predicate54 -->
  <!-- Document: http://www.w3.org/TR/xpath -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 3.4 -->
  <!-- Purpose: Test ((a or b) and (c or d)) combination of logical expressions in a predicate-->

<xsl:template match="foo">

  <xsl:text>Test:  ((a or b) and (c or d)):&#xa;</xsl:text>
  <xsl:text>Match: </xsl:text>
  <xsl:for-each select="bar[(@a='1' or @b='1') and (@c='1' or @d='1')]">
    <xsl:value-of select="@seq"/><xsl:text> </xsl:text>
  </xsl:for-each>
  <xsl:text>&#xa;</xsl:text>

</xsl:template>

</xsl:stylesheet>
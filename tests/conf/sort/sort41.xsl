<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: sort41 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 10 -->
  <!-- Creator: David Marston -->
  <!-- Purpose: Test multi-level sorting when the first-level sort key
                isn't available. -->

<xsl:key name="MonthNum" match="monthtab/entry/number" use="../name" />

<xsl:template match="doc">
  <out>
    <xsl:text>Birthdays as found...
</xsl:text>
    <xsl:for-each select="birthday">
      <xsl:value-of select="@person"/><xsl:text>: </xsl:text>
      <xsl:value-of select="month"/><xsl:text> </xsl:text>
      <xsl:value-of select="day"/><xsl:text>
</xsl:text>
    </xsl:for-each>
    <xsl:text>
Birthdays in chronological order...
</xsl:text>
<xsl:for-each select="birthday">
      <!-- there is no 'mo' to look up -->
      <xsl:sort select="key('MonthNum',mo)" data-type="number" />
      <xsl:sort select="day" data-type="number" />
      <xsl:value-of select="@person"/><xsl:text>: </xsl:text>
      <xsl:value-of select="month"/><xsl:text> </xsl:text>
      <xsl:value-of select="day"/><xsl:text>
</xsl:text>
    </xsl:for-each>
  </out>
</xsl:template>

</xsl:stylesheet>

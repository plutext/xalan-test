<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: MATCHerr05 -->
  <!-- Document: http://www.w3.org/TR/xpath -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 5.4 -->
  <!-- Purpose: Put a disallowed attribute on xsl:template. -->
  <!-- Creator: David Marston -->
  <!-- ExpectedException: XSL Error: xsl:template has an illegal attribute: level -->
  <!-- ExpectedException: "level" attribute is not allowed on the xsl:template element! -->

<xsl:template match="doc">
  <out>
    <xsl:value-of select="title"/><xsl:text>
</xsl:text>
    <xsl:apply-templates select="title">
      <xsl:sort select="."/>
    </xsl:apply-templates>
  </out>
</xsl:template>

<xsl:template match="text()"><!-- To suppress empty lines --><xsl:apply-templates/></xsl:template>

<xsl:template match="*[@title]" level="single">
  <xsl:text>Found a node
</xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="p">
  <xsl:text>Found a P node; there should not be one!
</xsl:text>
  <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>

<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:ped="http://www.tester.com">

<xsl:output indent="yes"/>

  <!-- FileName: lreerr08 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 7.1.2 Creating Elements with xsl:element. -->
  <!-- Creator: David Marston -->
  <!-- Purpose: Test error reporting if name attribute of xsl:element is empty. -->
  <!-- ExpectedException: Illegal element name -->
  <!-- ExpectedException: Illegal value used for attribute name -->

<xsl:template match="doc">
  <xsl:element name="">foo</xsl:element>
</xsl:template>

</xsl:stylesheet>

<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: variableman06 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 11.2 Values of Variables and Parameters -->
  <!-- Purpose: Test external setting of top-level param, then passing value to top-level variable
     via value-of. Show that order of these top-level elements doesn't matter. Run from special
     bat file which contains the following additional option
     -param input 'testing'. -->
  <!-- Author: David Marston -->

<xsl:variable name="tata" select="$input"/>

<xsl:param name="input" select="defaultvalue"/>

<xsl:template match="/">
  <out>
    <xsl:value-of select="$tata"/>
  </out>
</xsl:template>

</xsl:stylesheet>
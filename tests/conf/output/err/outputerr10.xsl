<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: OUTPerr10 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 7.2 Creating Text -->
  <!-- Purpose: Put xsl:text at top level, which is illegal. -->
  <!-- ExpectedException: (StylesheetHandler) xsl:text not allowed inside a stylesheet! -->
  <!-- ExpectedException: org.apache.xalan.xslt.XSLProcessorException: (StylesheetHandler) xsl:text not allowed inside a stylesheet! -->

<xsl:text>boo</xsl:text>

<xsl:template match="/">
 <out>This should fail</out>
</xsl:template>

</xsl:stylesheet>
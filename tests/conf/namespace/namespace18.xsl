<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: nspc18 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 2.4 -->
  <!-- Purpose: Test exclude-result-prefixes, attribute level -->

<xsl:template match="/">
  <out xmlns:anamespace="foo.com"  xsl:exclude-result-prefixes="anamespace">
    <p>
      <xsl:attribute name="test" namespace="foo2.com">true</xsl:attribute>
    </p>
  </out>
</xsl:template>
 
</xsl:stylesheet>

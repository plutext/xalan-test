<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: STRerr17 -->
  <!-- Document: http://www.w3.org/TR/xpath -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 4.2 String Functions  -->
  <!-- Purpose: Test of 'translate()' with too many arguments -->
  <!-- ExpectedException: The translate() function takes three arguments -->

<xsl:template match="/">
  <out>
    <xsl:value-of select="translate('bar','abc','ABC','output')"/>
  </out>
</xsl:template>

</xsl:stylesheet>

<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" 
                xmlns:ns1="ns1">

  <!-- FileName: WHTE06 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19990922 -->
  <!-- Section: 3.4 -->
  <!-- Purpose: Test element specifier that has a namespace qualifier. -->

<xsl:strip-space elements="ns1:test"/>
  
<xsl:template match="doc">
  <out>
    <xsl:apply-templates select="*"/>
  </out>
</xsl:template>
   
</xsl:stylesheet>

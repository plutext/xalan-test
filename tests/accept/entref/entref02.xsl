<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: entref02 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 3.4 -->
  <!-- Creator: Paul Dick -->
  <!-- Purpose: Test use of whitespace character entities. -->

<xsl:template match="/">
<out>,
<a>&#32;a</a><b>&#09;b</b><c>&#13;c</c><d>&#10;d</d>
</out>
</xsl:template>

</xsl:stylesheet>

<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:set="http://exslt.org/sets"
    exclude-result-prefixes="set">
<xsl:output method="xml" encoding="UTF-8" indent="yes" />

  <!-- FileName: librarySet01.xsl -->
  <!-- Creator: Morris Kwan -->
  <!-- Purpose: Test of the set:leading() extension function -->

<xsl:template match="/">
  <out>
    <test desc="selects 1, 2">
      <xsl:copy-of select="set:leading(/doc/*, /doc/str)"/>
    </test>
    <test desc="selects 1, 2, a, 3, 4">
      <xsl:copy-of select="set:leading(/doc/*, /doc/abc)"/>
    </test>
    <test desc="selects nothing">
      <xsl:copy-of select="set:leading(/doc/num, /doc/str)"/>
    </test>
  </out>
</xsl:template>

</xsl:stylesheet>
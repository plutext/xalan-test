<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:p1="testguys.com">

  <!-- FileName: namespace96 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 7.1.2 Creating Elements -->
  <!-- Creator: David Marston -->
  <!-- Purpose: Issue prefixed name in current default namespace, rather than the one assigned to tha prefix at outer level -->

<xsl:template match = "/">
  <out>
    <xsl:element name="p1:foo" namespace="other.com" xmlns="other.com">
      <yyy/>
    </xsl:element>
  </out>
</xsl:template>

</xsl:stylesheet>

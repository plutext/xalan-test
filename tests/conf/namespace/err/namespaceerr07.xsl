<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:baz1="http://xsl.lotus.com/ns1"
                xmlns:baz2="http://xsl.lotus.com/ns2">

  <!-- FileName: namespaceerr07 -->
  <!-- Document: http://www.w3.org/TR/xpath -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 4.1 Node Set Functions. -->
  <!-- Creator: David Marston -->
  <!-- Purpose: Test of 'namespace-uri()' with too many arguments. -->
  <!-- ExpectedException: namespace-uri() has too many arguments. -->
  <!-- ExpectedException: FuncNamespace only allows 1 arguments --><!-- Note: why isn't the error about FuncNamespaceURI? -sc -->

<xsl:template match="baz2:doc">
  <out>
    <xsl:value-of select="namespace-uri(baz2:b,..)"/>
  </out>
</xsl:template>

</xsl:stylesheet>
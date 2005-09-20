<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:pre="http://example.com"
  exclude-result-prefixes="pre">

  <!-- FileName: namespace142 -->
  <!-- Document: http://www.w3.org/TR/xpath -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 4.1 -->
  <!-- Creator: David Marston -->
  <!-- Purpose: Test name functions on default-namespace declaration. Should be null strings. -->

<xsl:output method="xml" encoding="UTF-8" indent="no" />

<xsl:template match="pre:doc">
  <out>
    <xsl:value-of select="count(namespace::*[name(.)!='xml'])"/><xsl:text> namespace node qualifies:&#10;</xsl:text>
    <xsl:text>name|</xsl:text><xsl:value-of select="name(namespace::*[name(.)!='xml'])"/><xsl:text>|</xsl:text>
    <xsl:text>namespace-uri|</xsl:text><xsl:value-of select="namespace-uri(namespace::*[name(.)!='xml'])"/><xsl:text>|</xsl:text>
    <xsl:text>local-name|</xsl:text><xsl:value-of select="local-name(namespace::*[name(.)!='xml'])"/><xsl:text>|</xsl:text>
  </out>
</xsl:template>


  <!-- Copyright 1999-2004 The Apache Software Foundation.
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and limitations under the License. -->

</xsl:stylesheet>

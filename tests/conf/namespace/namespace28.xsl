<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: namespace28 -->
  <!-- Document: http://www.w3.org/TR/xpath -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 4.1 -->
  <!-- Purpose: Test of local-name and name() on namespace axis. -->
  <!-- Creator: David Marston -->
  <!-- The local-name() function should work on this axis, returning the same value as name().
     The XML parser has freedom to present namespaces in any order it wants.
     The input should have only one namespace if you want consistent results across parsers. -->

<xsl:output method="xml" encoding="UTF-8" indent="no" />

<xsl:template match="doc">
  <out>
    <xsl:value-of select="local-name(namespace::*[1])"/>
    <xsl:text>=</xsl:text>
    <xsl:value-of select="local-name(namespace::*[1])"/>
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

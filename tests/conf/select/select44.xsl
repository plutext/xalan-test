<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: select44 -->
  <!-- Document: http://www.w3.org/TR/Xpath -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 3.3 Node Sets -->
  <!-- Purpose: NodeSet union using the ancestor-or-self axis -->
  <!-- Creator: Carmelo Montanez --><!-- Heavily modified from Expression004 in NIST suite -->

<xsl:template match="/">
  <out>
    <xsl:for-each select="//child"><!-- 8 different ones -->
      <xsl:apply-templates select="ancestor-or-self::sub | ancestor-or-self::sub-sub"/>
    </xsl:for-each>
  </out>
</xsl:template>

<xsl:template match="*">
  <xsl:value-of select="@pos"/><xsl:text>,</xsl:text>
</xsl:template>

</xsl:stylesheet>

  <!-- Copyright 1999-2004 The Apache Software Foundation.
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and limitations under the License. -->



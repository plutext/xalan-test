<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: conflictres05 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 5.5 -->
  <!-- Creator: Paul Dick -->
  <!-- Purpose: Test for conflict resolution between simple and non-simple node patterns. -->

  <!-- No conflict warnings should be seen. -->	       
<!-- May be obsolete; wording of spec has changed. -->

<xsl:template match="doc">
  <out>
    <xsl:apply-templates select="foo"/>
  </out>
</xsl:template>

<xsl:template match="doc/foo">
  <xsl:text>Match of non-simple '/'</xsl:text>
</xsl:template>

<xsl:template match="foo">
  <xsl:text>Match-of-qualified-name</xsl:text>
</xsl:template>

<xsl:template match="*">
  <xsl:text>Match-of-wildcard</xsl:text>
</xsl:template>

<xsl:template match="node()">
  <xsl:text>Match-of-node-type</xsl:text>
</xsl:template>


  <!-- Copyright 1999-2004 The Apache Software Foundation.
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and limitations under the License. -->

</xsl:stylesheet>

<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: variable64 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 11.6 -->
  <!-- Creator: Joseph Kesselman -->
  <!-- Purpose: test with-param as RTF copied from global variable (also RTF) -->

<xsl:output method="xml" encoding="UTF-8" indent="no"/>

<xsl:variable name="ax"><xsl:value-of select="//Test/@a"/>x</xsl:variable>
<xsl:variable name="by"><xsl:value-of select="//Test/@b"/>y</xsl:variable>

<xsl:template match="/">
  <out>
    <xsl:call-template name="preview"/>

    <xsl:call-template name="doNothing">
      <xsl:with-param name="dummy">
        <xsl:value-of select="$by"/>
      </xsl:with-param>
    </xsl:call-template>

    <xsl:text>
</xsl:text>
    <after>ax="<xsl:value-of select='$ax'/>"</after>
  </out>
</xsl:template>

<xsl:template name="preview">
  <before>ax="<xsl:value-of select='$ax'/>"</before>
</xsl:template>

<xsl:template name="doNothing">
  <xsl:param name="dummy"/>
</xsl:template>


  <!-- Copyright 1999-2004 The Apache Software Foundation.
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and limitations under the License. -->

</xsl:stylesheet>

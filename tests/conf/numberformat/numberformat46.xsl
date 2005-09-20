<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: NumberFormat46 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 12.3 -->
  <!-- Creator: David Marston -->
  <!-- Purpose: Test whether a default decimal-format defined in an include is applied here. -->

<xsl:include href="x45import.xsl"/>

<xsl:template match="doc">
  <out>
    <xsl:text>&#10;</xsl:text>
    <one>
      <xsl:value-of select="format-number(12345.67,'000.000,###')"/>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="format-number(-98765.4321,'##0.000,000')"/>
    </one>
    <xsl:text>&#10;</xsl:text>
    <xsl:call-template name="sub"/>
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

<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: NUMBERFORMAT24 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 12.3 -->
  <!-- Creator: David Marston -->
  <!-- Purpose: Test of import that does an import, providing two named decimal-formats. Three formats should not conflict. -->

<xsl:import href="newminus.xsl"/>

<xsl:template match="doc">
  <out>
    <xsl:value-of select="format-number(-26931.4,'###.###,###','periodgroup')"/>
    <xsl:text>  </xsl:text>
    <xsl:value-of select="format-number(-42857.1,'###,###.###','newminus')"/>
    <xsl:text>  </xsl:text>
    <xsl:value-of select="format-number(-73816.9,'###,###.###')"/>
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

<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: node13 -->
  <!-- Document: http://www.w3.org/TR/xpath -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 5.1 Root node -->
  <!-- Creator: David Marston -->
  <!-- Purpose: Test for access to comments hanging off the root. -->

<xsl:template match="/">
  <out>
    <xsl:text>
Comments on the root node:</xsl:text>
    <xsl:for-each select="comment()">
      <xsl:text>
</xsl:text><xsl:value-of select="."/>
    </xsl:for-each>
    <xsl:text>
</xsl:text>
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

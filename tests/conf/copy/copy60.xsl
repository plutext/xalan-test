<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: copy60 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 11.3 Using Values of Variables & Parameters with xsl:copy-of. -->
  <!-- Creator: David Bertoni -->
  <!-- Purpose: Use copy-of to put a node-set and RTF in a PI, where some members are text nodes. -->
  <!-- Invalid nodes (non-text) and their content should be ignored. -->

<xsl:output method="xml" indent="no" encoding="UTF-8"/>

<xsl:variable name="rTreeFrag">
  <xsl:copy-of select="/"/>
</xsl:variable>

<xsl:template match="doc">
  <out>
    <xsl:processing-instruction name="pi1">
      <xsl:copy-of select="node()"/>
    </xsl:processing-instruction>
    <xsl:processing-instruction name="pi2">
      <xsl:copy-of select="$rTreeFrag"/>
    </xsl:processing-instruction>
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

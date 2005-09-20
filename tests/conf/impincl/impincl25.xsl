<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- FileName: impincl25 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 5.6 -->
  <!-- Creator: David Marston -->
  <!-- Purpose: Show apply-imports matching a template deeper into the import tree. -->

<xsl:import href="fragments/imp25b.xsl"/>

<xsl:output method="xml" encoding="UTF-8"/>

<xsl:template match="/doc">
  <out>
    <xsl:text>Match on /doc in top xsl</xsl:text>
    <xsl:apply-imports/>
  </out>
</xsl:template>

<xsl:template match="bar">
  <xsl:text> - match on bar in top xsl</xsl:text>
</xsl:template>


  <!-- Copyright 1999-2004 The Apache Software Foundation.
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and limitations under the License. -->

</xsl:stylesheet>

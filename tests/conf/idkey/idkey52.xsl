<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: idkey52 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 12.2 -->
  <!-- Creator: David Marston -->
  <!-- Purpose: Test combination of key() and document() on multiple files. -->

      <!-- Compare to idkey18 -->

<xsl:key name="bib" match="entry" use="@name" />

<xsl:template match="doc">
 <root>
  <xsl:apply-templates/>
 </root>
</xsl:template>

<xsl:template match="bibref">
  Got a bibref for <xsl:value-of select="."/>...
  <xsl:variable name="lookup" select="."/>
  <xsl:for-each select="document(refdoc)">
    <xsl:apply-templates select="key('bib',$lookup)"/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="refdoc"><!-- suppress default action -->
  <xsl:apply-templates/>
</xsl:template>


  <!--
   * Licensed to the Apache Software Foundation (ASF) under one
   * or more contributor license agreements. See the NOTICE file
   * distributed with this work for additional information
   * regarding copyright ownership. The ASF licenses this file
   * to you under the Apache License, Version 2.0 (the  "License");
   * you may not use this file except in compliance with the License.
   * You may obtain a copy of the License at
   *
   *     http://www.apache.org/licenses/LICENSE-2.0
   *
   * Unless required by applicable law or agreed to in writing, software
   * distributed under the License is distributed on an "AS IS" BASIS,
   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   * See the License for the specific language governing permissions and
   * limitations under the License.
  -->

</xsl:stylesheet>

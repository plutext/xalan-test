<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: MDocs06 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 12.1 Multiple Source Documents -->
  <!-- Creator: David Marston -->
  <!-- Purpose: Test document() function with two arguments: node-set, node-set. -->

<xsl:template match="first"><!-- Document node of file passed to processor -->
  <out>
    <xsl:apply-templates/><!-- Should get defaultcontent element -->
  </out>
</xsl:template>

<xsl:template match="defaultcontent"><!-- contains places and second -->
  <!-- Two 'places' elements contain names of the other two files as text. -->
  <xsl:apply-templates select="document(places,second)/*">
    <xsl:with-param name="arg1" select="'top'" />
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="doc"><!-- Document node of file A -->
  <xsl:param name="arg1">doc-start</xsl:param>
  <xsl:value-of select="$arg1"/>
  <xsl:text>, Done with doc
</xsl:text>
</xsl:template>

<xsl:template match="outer"><!-- Document node of file B -->
  <xsl:param name="arg1">outer-start</xsl:param>
  <xsl:value-of select="$arg1"/>
  <xsl:text>, Done with outer</xsl:text>
</xsl:template>

<xsl:template match="body"><!-- Other two files have body elements, but no apply goes here -->
  <xsl:param name="arg1">problem</xsl:param>
  <xsl:value-of select="$arg1"/>
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

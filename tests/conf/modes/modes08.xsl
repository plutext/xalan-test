<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: MODES08 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 5.7 Modes -->
  <!-- Purpose: Test of several modes being available. -->

<xsl:template match="doc">
  <out><xsl:text>&#010;</xsl:text>
    <xsl:apply-templates select="a" mode="a"/>
    <xsl:apply-templates select="a" mode="b"/>
    <xsl:apply-templates select="a" mode="c"/>
    <xsl:apply-templates select="a" mode="d"/>
    <xsl:apply-templates select="a" mode="e"/>
    <xsl:apply-templates select="b" mode="a"/>
    <xsl:apply-templates select="b" mode="b"/>
  </out>
</xsl:template>

<xsl:template match="a" mode="a">
  <xsl:text>modeA: </xsl:text><xsl:value-of select="."/>
  <xsl:text>&#010;</xsl:text>
</xsl:template>

<xsl:template match="a" mode="b">
  <xsl:text>modeB: </xsl:text><xsl:value-of select="."/>
  <xsl:value-of select="@test"/>
  <xsl:text>&#010;</xsl:text>
</xsl:template>

<xsl:template match="a" mode="c">
  <xsl:text>modeC: </xsl:text><xsl:value-of select="."/>
  <xsl:text>&#010;</xsl:text>
</xsl:template>

<xsl:template match="a" mode="d">
  <xsl:text>modeD: </xsl:text><xsl:value-of select="."/>
  <xsl:value-of select="@test"/>
  <xsl:text>&#010;</xsl:text>
</xsl:template>

<xsl:template match="a" mode="e">
  <xsl:text>modeE: </xsl:text><xsl:value-of select="."/>
  <xsl:text>&#010;</xsl:text>
</xsl:template>

<xsl:template match="*" mode="a">
  <xsl:text>modeA: </xsl:text><xsl:value-of select="."/>
  <xsl:text>&#010;</xsl:text>
</xsl:template>

<xsl:template match="*" mode="b">
  <xsl:text>modeB: </xsl:text><xsl:value-of select="."/>
  <xsl:text>&#010;</xsl:text>
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

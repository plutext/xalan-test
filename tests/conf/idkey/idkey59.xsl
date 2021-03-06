<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: idkey59 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 12.2 -->
  <!-- Creator: Frank Weiss -->
  <!-- Purpose: Test xsl:key with union in "use" attribute. -->

<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

<xsl:key name="key1" match="div" use="x | y | z"/>

<xsl:template match="/">
  <out>
    <h1>Coordinate 25 (4 hits, 3 sections):</h1>
    <xsl:for-each select="key('key1', 25)">
      <title>
        <xsl:value-of select="title"/>
      </title>
    </xsl:for-each>
    <h1>Coordinate 39 (1 hit):</h1>
    <xsl:for-each select="key('key1', 39)">
      <title>
        <xsl:value-of select="title"/>
      </title>
    </xsl:for-each>
    <h1>Coordinate 44 (2 hits, 2 sections):</h1>
    <xsl:for-each select="key('key1', 44)">
      <title>
        <xsl:value-of select="title"/>
      </title>
    </xsl:for-each>
    <h1>Coordinate 75 (2 hits, 2 sections):</h1>
    <xsl:for-each select="key('key1', 75)">
      <title>
        <xsl:value-of select="title"/>
      </title>
    </xsl:for-each>
  </out>
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

<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: conditional17 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 9.2 -->
  <!-- Creator: David Marston -->
  <!-- Purpose: Test that only the content of the first matching xsl:when is instantiated. -->

<xsl:template match="doc">
  <out>
    <xsl:choose>
      <xsl:when test="foo &lt; 2">1</xsl:when>
      <xsl:when test="foo &lt; 4">2</xsl:when>
      <xsl:when test="foo &lt; 8">3</xsl:when>
      <xsl:when test="foo &lt; 16">4</xsl:when>
      <xsl:when test="foo &lt; 32">5</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
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

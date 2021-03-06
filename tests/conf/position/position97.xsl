<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: position97 -->
  <!-- Document: http://www.w3.org/TR/xpath -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 3.3 -->
  <!-- Creator: Joerg Heinicke, trimmed by David Marston -->
  <!-- Purpose: Use a (number-valued) variable in a predicate, but inside a for-each. -->
  <!-- Also tests that weird sentence: "The predicate filters the node-set with respect to
    the child axis" because .//description[2] means the second description that is a child
    of the a (or b) node under which you found the description currently being considered. -->

<xsl:output method="xml" indent="no" encoding="UTF-8"/>

<xsl:template match="root">
  <out>
  <xsl:text>
</xsl:text>
    <xsl:apply-templates select="base//description"/>
  </out>
</xsl:template>
  
<xsl:template match="description">
  <xsl:variable name="pos" select="position()"/>
  <tr row="{$pos}">
    <xsl:for-each select="/root/base">
      <td>
        <xsl:copy-of select="@side"/>
        <xsl:value-of select=".//description[$pos]"/>
      </td>
    </xsl:for-each>
  </tr>
  <xsl:text>
</xsl:text>
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

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0" >

<!-- User mark@ssglimited.com (Mark Peterson) claims in Xalan-J 2.2.0:
The XSL file, below, should make $flights= {"1","2"}, but it contains {"1"} - 
when using the XML example file shown below.
xml-xalan CVS 11-Feb-02 9AM returns <out>1<br/></out> -sc
-->

<xsl:variable name="flights" select="/report/colData[@colId='F' and not(.=preceding::colData)]"/>

<xsl:template match="/report">
<out>
    <xsl:for-each select="$flights">
        <xsl:value-of select="." /><br />
    </xsl:for-each>
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

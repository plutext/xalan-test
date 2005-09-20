<xsl:stylesheet 
      xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'
      xmlns:bar="http://apache.org/bar"
      exclude-result-prefixes="bar">
      
  <xsl:include href="inc1/inc1.xsl"/>
      
  <xsl:param name="a-param">default param value</xsl:param>
  
  <xsl:template match="bar:element">
    <bar>
      <param-val>
        <xsl:value-of select="$a-param"/><xsl:text>, </xsl:text>
        <xsl:value-of select="$my-var"/>
      </param-val>
      <data><xsl:apply-templates/></data>
    </bar>
  </xsl:template>
      
  <xsl:template 
      match="@*|*|text()|processing-instruction()">
    <xsl:copy>
      <xsl:apply-templates 
         select="@*|*|text()|processing-instruction()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Copyright 1999-2004 The Apache Software Foundation.
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and limitations under the License. -->

</xsl:stylesheet>

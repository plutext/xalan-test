<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- CaseName: numberingerr07 -->
  <!-- Author: David Marston -->
  <!-- Purpose: Put xsl:number at top level, which is illegal. -->
  <!-- SpecCitation: Rec="XSLT" Version="1.0" type="OASISptr1" place="id(stylesheet-element)/p[3]/text()[1]" -->
  <!-- Scenario: operation="message" StandardError="xsl:number not allowed inside a stylesheet" -->
  <!-- ExpectedException: xsl:number is not allowed in this position in the stylesheet -->

<xsl:number count="item" from="ol"/>

<xsl:template match="doc">
  <out>This should fail</out>
</xsl:template>


  <!-- Copyright 1999-2004 The Apache Software Foundation.
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and limitations under the License. -->

</xsl:stylesheet>

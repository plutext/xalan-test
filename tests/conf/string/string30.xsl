<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:baz1="http://xsl.lotus.com/ns1"
                xmlns:baz2="http://xsl.lotus.com/ns2">

  <!-- FileName: str30 -->
  <!-- Document: http://www.w3.org/TR/xpath -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 4.1 Node Set Functions. -->
  <!-- Purpose: Test of 'namespace-uri()'. -->


<xsl:template match="baz2:doc">
	<out>
		<xsl:value-of select="namespace-uri(baz1:a/@baz2:attrib1)" xmlns:baz1="http://xsl.lotus.com/ns1" xmlns:baz2="http://xsl.lotus.com/ns2"/>
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

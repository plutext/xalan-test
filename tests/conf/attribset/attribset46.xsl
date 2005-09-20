<?xml version="1.0" ?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="impattset46a.xsl" /> 
<xsl:import href="impattset46b.xsl" /> 


<!-- FileName: attribset45 -->
<!-- Document: http://www.w3.org/TR/xslt -->
<!-- DocVersion: 19991116 -->
<!-- Section: 12.1 -->
<!-- Creator: Paul Dick  -->
<!-- Purpose: Basic test of import precedence based on Richard Titmuss's test
     with attribute sets. Here the imported attribute sets have additional non-
     conflicting attributes as well.  -->


<xsl:template match="/">
<out>
	<foo xsl:use-attribute-sets="bar" /> 
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

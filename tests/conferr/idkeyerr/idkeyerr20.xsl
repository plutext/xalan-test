<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- FileName: idkeyerr20 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- VersionDrop: 1.1 will outlaw this trick. -->
  <!-- Creator: David Marston -->
  <!-- Section: 12.2 -->
  <!-- Purpose: Test for xsl:key that uses key() on a different keyspace in its match attribute. -->
  <!-- ExpectedException: recursive key() calls are not allowed -->

<xsl:key name="allowdiv" match="div" use="@allow"/>
<xsl:key name="titles" match="key('allowdiv','yes')" use="title"/>

<xsl:template match="doc">
 <root>
  <xsl:value-of select="key('titles', 'Introduction')/p"/>
  <xsl:value-of select="key('titles', 'Stylesheet Structure')/p"/>
  <!-- The next one is an empty node-set -->
  <xsl:value-of select="key('titles', 'Expressions')/p"/>
 </root>
</xsl:template>


  <!-- Copyright 1999-2004 The Apache Software Foundation.
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and limitations under the License. -->

</xsl:stylesheet>

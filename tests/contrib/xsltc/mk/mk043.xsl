<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="1.0"
>

  <!-- Test FileName: mk043.xsl -->
  <!-- Source Attribution: 
       This test was written by Michael Kay and is taken from 
       'XSLT Programmer's Reference' published by Wrox Press Limited in 2000;
       ISBN 1-861003-12-9; copyright Wrox Press Limited 2000; all rights reserved. 
       Now updated in the second edition (ISBN 1861005067), http://www.wrox.com.
       No part of this book may be reproduced, stored in a retrieval system or 
       transmitted in any form or by any means - electronic, electrostatic, mechanical, 
       photocopying, recording or otherwise - without the prior written permission of 
       the publisher, except in the case of brief quotations embodied in critical articles or reviews.
  -->
  <!-- Example: any xml, list-elements.xsl -->
  <!-- Chapter/Page: 7-489 -->
  <!-- Purpose: Listing the element names that appear in a doc -->

<xsl:template match="/">
<html><body>
<h1>Table of elements</h1>
<table border="1" cellpadding="5">
<tr><td>Element</td><td>Prefix</td><td>Local name</td><td>Namespace URI</td></tr>
    <xsl:apply-templates select="//*">
         <xsl:sort select="namespace-uri()"/>
         <xsl:sort select="local-name()"/>
    </xsl:apply-templates>
</table></body></html>
</xsl:template>

<xsl:template match="*">
     <xsl:variable name="prefix">
        <xsl:choose>
        <xsl:when test="contains(name(), ':')">
           <xsl:value-of select="substring-before(name(),':')"/>
        </xsl:when>
        <xsl:otherwise/>
        </xsl:choose>
     </xsl:variable>
     <tr>
     <td><xsl:value-of select="name()"/></td>
     <td><xsl:value-of select="$prefix"/></td>
     <td><xsl:value-of select="local-name()"/></td>
     <td><xsl:value-of select="namespace-uri()"/></td>
     </tr>
</xsl:template>

  <!-- Copyright 1999-2004 The Apache Software Foundation.
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and limitations under the License. -->

</xsl:transform>

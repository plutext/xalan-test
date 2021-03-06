<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="1.0"
>

  <!-- Test FileName: mk040.xsl -->
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
  <!-- Example: booklist.xml, authors.xml, author-biogs.xsl -->
  <!-- Chapter/Page: 7-472 -->
  <!-- Purpose: Using keys -->

<xsl:key name="biog" match="author" use="@name"/>
<xsl:variable name="biogs" select="document('./inc/authors.xml')"/>

<xsl:template match="/">
  <html><body>
    <xsl:variable name="all-books" select="//book"/>
    <xsl:for-each select="$all-books">
      <h1><xsl:value-of select="title"/></h1>
      <h2>Author<xsl:if test="count(author)!=1">s</xsl:if></h2>
      <xsl:for-each select="author">
         <xsl:variable name="name" select="."/>
         <h3><xsl:value-of select="$name"/></h3>
         <xsl:for-each select="$biogs">
           <xsl:variable name="auth" select="key('biog', $name)"/>
           <p><xsl:value-of select="concat($auth/born, ' - ', $auth/died)"/></p>
           <p><xsl:value-of select="$auth/biog"/></p>
         </xsl:for-each>
      </xsl:for-each>
    </xsl:for-each>
  </body></html>
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

</xsl:transform>

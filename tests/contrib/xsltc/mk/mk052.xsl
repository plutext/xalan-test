<xsl:stylesheet 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="1.0">

  <!-- Test FileName: mk052.xsl -->
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
  <!-- Example: number-list.xml, number-total.xsl -->
  <!-- Chapter/Page: 8-553 -->
  <!-- Purpose: Totaling a list of numbers -->
  
<xsl:template name="total-numbers">
   <xsl:param name="list"/>
   <xsl:variable name="wlist" 
      select="concat(normalize-space($list), ' ')"/>
   <xsl:choose>
      <xsl:when test="$wlist!=' '">
         <xsl:variable name="first" 
            select="substring-before($wlist, ' ')"/>
         <xsl:variable name="rest" 
            select="substring-after($wlist, ' ')"/>
         <xsl:variable name="total">
            <xsl:call-template name="total-numbers">
               <xsl:with-param name="list" select="$rest"/>
            </xsl:call-template>
         </xsl:variable>
         <xsl:value-of select="number($first) + number($total)"/>
      </xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
   </xsl:choose>
</xsl:template>

<xsl:template match="/">
   <xsl:call-template name="total-numbers">
      <xsl:with-param name="list" select="."/>
   </xsl:call-template>
</xsl:template>


</xsl:stylesheet>

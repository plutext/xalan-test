<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- From MKay Ref manual p-276; was simplified style sheet; converted it -->

  <!-- Test FileName: mk027.xsl -->
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
  <!-- Example: products.xml, products.xsl -->
  <!-- Chapter/Page: 4-276 -->
  <!-- Purpose: Sorting on the result of a calculation -->

<xsl:template match="/">
<xsl:for-each select="products/product">
   <xsl:sort select="sum(region/@sales)"
                                data-type="number"
                                order="descending"/>
   <product name="{@name}" sales="{format-number(sum(region/@sales), '$####0.00')}"/>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>

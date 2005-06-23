<?xml version="1.0"?> 
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:math="http://exslt.org/math"
                extension-element-prefixes="math">

<!-- Test math:atan() -->

<xsl:variable name="zero" select="0"/>
<xsl:variable name="nzero" select="-0"/>
<xsl:variable name="num1" select="1.99"/>
<xsl:variable name="num2" select="3.1428475"/>
<xsl:variable name="temp1" select="-7"/>
<xsl:variable name="temp2" select="-9.99999"/>
<xsl:variable name="rad1" select="1.0"/>
<xsl:variable name="rad2" select="25"/>
<xsl:variable name="rad3" select="0.253"/>
<xsl:variable name="rad4" select="-0.888"/>
<xsl:variable name="input1" select="number(//number[1])"/>
<xsl:variable name="input2" select="number(//number[2])"/>
<xsl:variable name="input3" select="$input1 div $zero"/>

<xsl:template match="/">
   <out>

      ArcTan value of zero is:
      <xsl:value-of select="math:atan($zero)"/><br/>
      ArcTan value of nzero is:
      <xsl:value-of select="math:atan($nzero)"/><br/>
      ArcTan value of num1 is:
      <xsl:value-of select="math:atan($num1)"/><br/>
      ArcTan value of num2 is:
      <xsl:value-of select="math:atan($num2)"/><br/>
      ArcTan value of temp1 is:
      <xsl:value-of select="math:atan($temp1)"/><br/>
      ArcTan value of temp2 is:
      <xsl:value-of select="math:atan($temp2)"/><br/>
      ArcTan value of rad1 is:
      <xsl:value-of select="math:atan($rad1)"/><br/>
      ArcTan value of rad2 is:
      <xsl:value-of select="math:atan($rad2)"/><br/>
      ArcTan value of rad3 is:
      <xsl:value-of select="math:atan($rad3)"/><br/>
      ArcTan value of rad4 is:
      <xsl:value-of select="math:atan($rad4)"/><br/>
      ArcTan value of input1 number is:
      <xsl:value-of select="math:atan($input1)"/><br/>
      ArcTan value of input2 number is:
      <xsl:value-of select="math:atan($input2)"/><br/>
      ArcTan value of input3 number is:
      <xsl:value-of select="math:atan($input3)"/>
   </out>
</xsl:template>

</xsl:stylesheet>
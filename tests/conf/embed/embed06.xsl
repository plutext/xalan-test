<html xsl:version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      lang="en">

  <!-- FileName: Embed06 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 2.3 LRE as Stylesheet -->
  <!-- Purpose: Do everything inside an HTML element. Note first item in this file. -->

<head>
  <title>Sales Results By Division</title>
</head>
<body>
  <table border="1">
    <tr>
      <th>Division</th>
      <th>Revenue</th>
      <th>Growth</th>
      <th>Bonus</th>
    </tr>
    <xsl:for-each select="sales/division">
      <!-- order the result by revenue -->
      <xsl:sort select="revenue" data-type="number" order="descending"/>
      <tr>
        <td>
          <em><xsl:value-of select="@id"/></em>
        </td>
        <td>
          <xsl:value-of select="revenue"/>
        </td>
        <td>
          <!-- highlight negative growth in red -->
          <xsl:if test="growth &lt; 0">
            <xsl:attribute name="style">
              <xsl:text>color:red</xsl:text>
            </xsl:attribute>
          </xsl:if>
          <xsl:value-of select="growth"/>
        </td>
        <td>
          <xsl:value-of select="bonus"/>
        </td>
      </tr>
    </xsl:for-each>
  </table>
</body>

</html>
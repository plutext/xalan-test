<?xml version='1.0'?>

<xsl:stylesheet

      version='1.0'

      xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>



<!-- Description:  Differentiates a simple polynomial function -->

<!-- Author:  Charlie Halpern-Hamu, Ph.D. -->

<!-- Reference:  http://www.incrementaldevelopment.com/papers/xsltrick/#differentiate -->



<xsl:strip-space elements='*'/>



<xsl:output

        method='xml'

        indent='yes'/>



<xsl:template match='/function-of-x'>

<xsl:element name='function-of-x'>

<xsl:apply-templates select='term'/>

</xsl:element>

</xsl:template>



<xsl:template match='term'>

<term>

<coeff>

<xsl:value-of select='coeff * power'/>

</coeff>

<x/>

<power>

<xsl:value-of select='power - 1'/>

</power>

</term>

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

</xsl:stylesheet>

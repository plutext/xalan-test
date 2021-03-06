<?xml version="1.0"?>
<jad:transform xmlns:jad="http://www.w3.org/1999/XSL/Transform" version="1.0">
<jad:output method="xml"/>

  <!-- FileName: incnspc13 -->
  <!-- Document: http://www.w3.org/TR/xpath -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 2.1 XSLT Namespace -->
  <!-- Purpose: This stylesheet is being included by namespace13 which has the namespace
       prefix set to 'jad'. Testing that this setup with two different namespaces
       is allowed.  -->

<jad:template match="doc">
  <out>
	<jad:value-of select="'In Include: Testing '"/>
	<jad:for-each select="*">
		<jad:value-of select="."/><jad:text> </jad:text>		
	</jad:for-each>

	<jad:text>&#010;&#013;</jad:text>
	<jad:call-template name="ThatTemp">
		<jad:with-param name="sam">quos</jad:with-param>
	</jad:call-template>

  </out>
</jad:template>

<jad:template name="ThatOtherTemp">
  <jad:param name="sam">bo</jad:param>
	Included xmlns:jad <jad:copy-of select="$sam"/>
</jad:template>

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

</jad:transform>

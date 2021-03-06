<?xml version="1.0" encoding="UTF-8"?>

<!--
   **************************************************
   
   error.xsl
   version: ###VERSION-NUMBER-IS-INSERTED-HERE###
   
   **************************************************
-->

<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:portal="http://www.enonic.com/cms/xslt/portal"
   xmlns:stk="http://www.enonic.com/cms/xslt/stk">
   
   <xsl:import href="/modules/library-stk/stk-variables.xsl"/>

   <xsl:template name="stk:error.create-message">
      <xsl:variable name="error" as="element()?" select="$stk:querystring-parameter[@name = 'http_status_code']"/>
      <xsl:variable name="url" as="xs:string?" select="/result/context/querystring/@url"/>
      <xsl:variable name="exception-message" as="xs:string?" select="$stk:querystring-parameter[@name = 'exception_message']"/>
      <xsl:if test="normalize-space($error)">
         <div class="error">
            <h2>
               <xsl:value-of select="portal:localize(concat('stk.error.', $error, '-heading'))"/>
            </h2>
            <p class="description">
               <xsl:value-of select="portal:localize(concat('stk.error.', $error, '-description'))"/>               
            </p>
            <xsl:if test="normalize-space($exception-message)">
               <p class="exception-message">
                  <span class="exception-message">
                     <xsl:value-of select="portal:localize('stk.error.exception-message')"/>
                  </span>
                  <xsl:value-of select="$exception-message"/>
               </p>               
            </xsl:if>
            <xsl:if test="normalize-space($url)">
               <p class="url">
                  <span class="url">
                     <xsl:value-of select="portal:localize('stk.error.url')"/>
                  </span>
                  <xsl:value-of select="$url"/>
               </p>               
            </xsl:if>
         </div>
         <xsl:if test="string($stk:site-admin-name) and string($stk:site-admin-email)">
            <p>
               <xsl:value-of select="concat(portal:localize('stk.error.general-text'), ' ')"/>
               <a href="mailto:{$stk:site-admin-email}">
                  <xsl:value-of select="$stk:site-admin-name"/>
               </a>
            </p>
         </xsl:if>
      </xsl:if>      
   </xsl:template>

</xsl:stylesheet>

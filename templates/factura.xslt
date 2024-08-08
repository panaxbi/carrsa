<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl cfdi"
 xmlns:cfdi="http://www.sat.gob.mx/cfd/3"
  xmlns="http://www.w3.org/1999/xhtml"
>
  <xsl:output method="html" indent="yes" omit-xml-declaration="yes" />

  <xsl:template match="@*">
    <xsl:value-of select="."/>
  </xsl:template>
  
  <xsl:template match="*">
    <xsl:value-of select="@Importe"/>
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>

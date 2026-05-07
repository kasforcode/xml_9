<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text"/>

  <xsl:template match="/">
    <xsl:variable name="from" select="number(sum-of-sequence/from)"/>
    <xsl:variable name="to" select="number(sum-of-sequence/to)"/>
    <xsl:call-template name="sum">
      <xsl:with-param name="current" select="$from"/>
      <xsl:with-param name="to" select="$to"/>
      <xsl:with-param name="accumulator" select="0"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="sum">
    <xsl:param name="current"/>
    <xsl:param name="to"/>
    <xsl:param name="accumulator"/>
    
    <xsl:choose>
      <xsl:when test="$current > $to">
        <xsl:value-of select="$accumulator"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="sum">
          <xsl:with-param name="current" select="$current + 1"/>
          <xsl:with-param name="to" select="$to"/>
          <xsl:with-param name="accumulator" select="$accumulator + $current"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:value-of select="substring(threeday/issuedatetime, 0, 11)"/>
    </xsl:template>

 </xsl:stylesheet>

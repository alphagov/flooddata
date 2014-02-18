<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:eat="http://www.environment-agency.gov.uk/XMLSchemas/EATimeSeriesDataExchangeFormat">

    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>

<!--
	<Station stationReference="1020TH" region="Thames" stationName="RIVER WINDRUSH AT BOURTON ON THE WATER" ngr="SP16072093">
		<SetofValues parameter="Water Level" qualifier="Downstream Stage" dataType="Instantaneous" period="15 min" units="mASD" startDate="2014-02-15" startTime="15:30:00" endDate="2014-02-15" endTime="16:15:00">
			<Value date="2014-02-15" time="15:30:00">0.563</Value>
			<Value date="2014-02-15" time="15:45:00">0.562</Value>
			<Value date="2014-02-15" time="16:00:00">0.562</Value>
		</SetofValues>
        ...
-->

    <xsl:template match="/">

    <xsl:text>Time&#x9;</xsl:text>
    <xsl:text>stationReference&#x9;</xsl:text>
    <xsl:text>region&#x9;</xsl:text>
    <xsl:text>ngr&#x9;</xsl:text>
    <xsl:text>stationName&#x9;</xsl:text>
    <xsl:text>parameter&#x9;</xsl:text>
    <xsl:text>qualifier&#x9;</xsl:text>
    <xsl:text>units&#x9;</xsl:text>
    <xsl:text>value&#x9;</xsl:text>
    <xsl:text>
</xsl:text>

        <xsl:for-each select="//eat:Station">
            <xsl:variable name="stationReference" select="@stationReference"/>
            <xsl:variable name="stationName" select="@stationName"/>
            <xsl:variable name="region" select="@region"/>
            <xsl:variable name="ngr" select="@ngr"/>

            <xsl:for-each select="eat:SetofValues">
                <xsl:variable name="parameter" select="@parameter"/>
                <xsl:variable name="qualifier" select="@qualifier"/>
                <xsl:variable name="units" select="@units"/>

                <xsl:for-each select="eat:Value">
                    <xsl:value-of select="@date"/>T<xsl:value-of select="@time"/><xsl:text>Z&#x9;</xsl:text>
                    <xsl:value-of select="$stationReference"/><xsl:text>&#x9;</xsl:text>
                    <xsl:value-of select="$region"/><xsl:text>&#x9;</xsl:text>
                    <xsl:value-of select="$ngr"/><xsl:text>&#x9;</xsl:text>
                    <xsl:value-of select="$stationName"/><xsl:text>&#x9;</xsl:text>
                    <xsl:value-of select="$parameter"/><xsl:text>&#x9;</xsl:text>
                    <xsl:value-of select="$qualifier"/><xsl:text>&#x9;</xsl:text>
                    <xsl:value-of select="$units"/><xsl:text>&#x9;</xsl:text>
                    <xsl:value-of select="."/><xsl:text>&#x9;</xsl:text>
                    <xsl:text>
</xsl:text>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

 </xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" indent="no"/>

<!--  <xsl:template match="/job_info/queue_info">
    <root>
      <xsl:apply-templates select="job_list"/>
    </root>
  </xsl:template> -->

  <xsl:template match="job_list">
      <xsl:value-of select="JB_job_number" />
	  <xsl:text>&#x9;</xsl:text>
      <xsl:value-of select="substring(JB_name, 0, 50)" />
	  <xsl:text>&#x9;</xsl:text>
      <xsl:value-of select="JB_owner" />
	  <xsl:text>&#x9;</xsl:text>
      <xsl:value-of select="state" />
	  <xsl:text>&#x9;</xsl:text>
    <xsl:value-of select="slots" />
	  <xsl:text>&#x9;</xsl:text>
      <xsl:value-of select="JAT_start_time" />
	  <xsl:value-of select="JB_submission_time" />
  </xsl:template>

</xsl:stylesheet>
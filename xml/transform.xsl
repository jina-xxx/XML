<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="orgByCity" match="item" use="@city"/>
    <xsl:key name="itemsByOrg" match="item" use="@org"/>

    <xsl:output method="html" encoding="utf-8" />

    <xsl:template match="/">
        <html>
            <body>
                <h1>Города и компании</h1>

                <xsl:for-each select="orgs/item[generate-id() = generate-id(key('orgByCity', @city)[1])]">
                    <h2><xsl:value-of select="@city"/></h2>

                    <xsl:for-each select="key('orgByCity', @city)[generate-id() = generate-id(key('itemsByOrg', @org)[1])]">
                        <h3><xsl:value-of select="@org"/></h3>

                        <ul>
                            <xsl:for-each select="key('itemsByOrg', @org)">
                                <li>
                                    <xsl:value-of select="@title"/>
                                    (<xsl:value-of select="@value"/>)
                                </li>
                            </xsl:for-each>
                        </ul>

                    </xsl:for-each>
                </xsl:for-each>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

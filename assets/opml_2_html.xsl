<?xml version="1.0" encoding="ISO-8859-1"?>
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:template match="opml">
            <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
                <head>
                    <title><xsl:value-of select="head/title"/></title>
                    <style type="text/css">
                    </style>
                </head>
                <body>
                    <h1><xsl:value-of select="head/title"/></h1>
                    <p><time><xsl:value-of select="head/dateCreated"/></time></p>
                    <xsl:apply-templates select="body/outline"/>
                </body>
            </html>
        </xsl:template>
        <xsl:template match="outline" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:choose>
                <xsl:when test="@type">
                    <xsl:choose>
                        <xsl:when test="@xmlUrl">
                            <li>
                                <a href="{@htmlUrl}"><xsl:value-of select="@text"/></a>
                            </li>
                        </xsl:when>
                        <xsl:otherwise>
                            <li>
                                <a href="{@url}"><xsl:value-of select="@text"/></a>
                            </li>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <details open="open">
                        <summary>
                            <xsl:value-of select="@text"/>
                        </summary>
                        <ul>
                            <xsl:apply-templates select="outline"/>
                        </ul>
                    </details>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:template>
    </xsl:stylesheet>
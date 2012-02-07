<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei xs" version="2.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html></xsl:text>
        <html>
            <meta charset="utf-8"/>
            <title>
                <xsl:value-of select="TEI.2/teiHeader/fileDesc/titleStmt/title"/>
            </title>
            <meta name="author" content="{TEI.2/teiHeader/fileDesc/titleStmt/author}"/>
            <meta name="description" content="{TEI.2/teiHeader/fileDesc/sourceDesc/p}"/>
            <link rel="stylesheet" href="css/style.css"/>
            <script src="http://static.scholarslab.org/javascripts/modernizr-2.0.6.js"/>
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"/>
            <script>
                  $(document).ready(function() {
                    $('.line').each(function(){

         // Get all the marginalia spans.
         var marginalia = $(this).children('.marginalia');

         // Hide the marginalia to start, then loop through each.
         marginalia.hide().each(function() {

           // Get the second class value, so we can associate a specific
           // marginalia to an icon.
           var classValue = $(this).attr('id').split('.')[0];

           // Create an div with class 'icon' and append to the line.
                 var icon = '<div class="icon '+classValue+'">'+classValue+'</div>';
                 $(this).parent().append(icon);
             });
           });

        // When we click on the icon, we'll toggle the view of its associated
        // marginalia.
         $('.icon').click(function() {
            var classValue = $(this).attr('class').split(' ')[1];
            $(this).parent().children('.marginalia.'+classValue).toggle();
         });
     });
            </script>

            <body>
                <div id="container">
                    <header role="banner">
                        <h1>Awesome Site</h1>
                    </header>
                    <nav id="nav-primary">
                        <ul>
                            <li>Some navigation</li>
                        </ul>
                    </nav>
                    <div role="main">
                        <xsl:apply-templates select="TEI.2/text/body"/>
                    </div>
                    <footer>
                        <p>&#169; 2011</p>
                    </footer>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="del">
        <span class="@rendition"><xsl:apply-templates /></span>
    </xsl:template>

    <xsl:template match="div1">
        <div id="{@n}" class="passus">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="head">
        <h1>
            <xsl:value-of select="node()"/>
        </h1>
    </xsl:template>

    <xsl:template match="lb">
        <br/>
    </xsl:template>

    <xsl:template match="lg">
        <div class="lg">           
            <xsl:apply-templates select="l"/>
        </div>
    </xsl:template>
    
    <xsl:template match="l">
        
        <xsl:variable name="linenumber">
            <xsl:value-of select="translate(@n, 'KPD.', '')"/>
        </xsl:variable>
        
        <xsl:variable name="lid">
            <xsl:value-of select="@id"/>
        </xsl:variable>
        
        <xsl:variable name="marginalia_line">
            <xsl:value-of select="preceding-sibling::marginalia[following-sibling::l[position()=1][@id=$lid]]" />
        </xsl:variable>
        
        <xsl:variable name="marginalia_id">
            <xsl:value-of select="preceding-sibling::marginalia[@id]" />
        </xsl:variable>
        
        <div class="line clearfix" id="{@id}" data-line="{$linenumber}">
            <xsl:apply-templates select="preceding-sibling::marginalia[following-sibling::l[position()=1][@id=$lid]]"/>
            <span class="line-data"><xsl:value-of select="." /></span>
            <br/>
        </div>
    </xsl:template>

    <!-- this is a hack; takes a seg (from the list of entities in the DTD) and makes a span punctus -->
    <xsl:template match="seg">
        <span class="punctus">
            <xsl:apply-templates select="."/>
        </span>
    </xsl:template>
    

    <xsl:template match="note">
        <div class="note">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="marginalia">
        <xsl:variable name="witness" select="substring(@id, 1,2)">
            <!-- process the first part of the @id -->
        </xsl:variable>
        
        <span class="marginalia {$witness}" id="{@id}">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes" encoding="UTF-8" />

    <!-- Plantilla principal -->
    <xsl:template match="/">
        <tema id="T5">
            <xsl:if test="pdf_redes/@lang">
                <xsl:attribute name="lang">
                    <xsl:value-of select="pdf_redes/@lang" />
                </xsl:attribute>
            </xsl:if>
            <metadata>
                <titulo>
                    <xsl:value-of select="normalize-space(pdf_redes/metadata/titulo)" />
                </titulo>
                <subtitulo>
                    <xsl:value-of select="normalize-space(pdf_redes/metadata/subtitulo)" />
                </subtitulo>
            </metadata>
            <secciones>
                <xsl:apply-templates select="pdf_redes/secciones/seccion" />
            </secciones>
        </tema>
    </xsl:template>

    <!-- Transformar seccion -->
    <xsl:template match="seccion">
        <seccion>
            <xsl:attribute name="id">
                <xsl:text>S</xsl:text>
                <xsl:number level="any" count="seccion" />
            </xsl:attribute>
            <xsl:if test="@nombre">
                <xsl:attribute name="nombre">
                    <xsl:value-of select="@nombre" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="bloque" />
        </seccion>
    </xsl:template>

    <!-- Transformar bloque -->
    <xsl:template match="bloque">
        <bloque>
            <xsl:attribute name="id">
                <xsl:text>B</xsl:text>
                <xsl:number level="any" count="bloque" />
            </xsl:attribute>
            <xsl:if test="@titulo">
                <xsl:attribute name="titulo">
                    <xsl:value-of select="@titulo" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="*" />
        </bloque>
    </xsl:template>

    <!-- Párrafos -->
    <xsl:template match="parrafo">
        <parrafo>
            <xsl:if test="@tipo">
                <xsl:attribute name="tipo">
                    <xsl:value-of select="@tipo" />
                </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="normalize-space(.)" />
        </parrafo>
    </xsl:template>

    <!-- Tarjetas -->
    <xsl:template match="tarjetas">
        <tarjetas>
            <xsl:apply-templates select="tarjeta" />
        </tarjetas>
    </xsl:template>

    <!-- Tarjeta individual -->
    <xsl:template match="tarjeta">
        <tarjeta>
            <xsl:if test="@titulo">
                <xsl:attribute name="titulo">
                    <xsl:value-of select="@titulo" />
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@sub">
                <xsl:attribute name="sub">
                    <xsl:value-of select="@sub" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="*" />
        </tarjeta>
    </xsl:template>

    <!-- Tablas -->
    <xsl:template match="tabla">
        <tabla>
            <xsl:if test="@titulo">
                <xsl:attribute name="titulo">
                    <xsl:value-of select="@titulo" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="*" />
        </tabla>
    </xsl:template>

    <xsl:template match="col">
        <col>
            <xsl:if test="@nombre">
                <xsl:attribute name="nombre">
                    <xsl:value-of select="@nombre" />
                </xsl:attribute>
            </xsl:if>
        </col>
    </xsl:template>

    <xsl:template match="fila">
        <fila>
            <xsl:apply-templates select="*" />
        </fila>
    </xsl:template>

    <xsl:template match="c">
        <c>
            <xsl:value-of select="normalize-space(.)" />
        </c>
    </xsl:template>

    <!-- Otros Elementos si los hay como imágenes -->
    <xsl:template match="imagen">
        <imagen>
            <xsl:if test="@id">
                <xsl:attribute name="id">
                    <xsl:value-of select="@id" />
                </xsl:attribute>
            </xsl:if>
        </imagen>
    </xsl:template>

</xsl:stylesheet>
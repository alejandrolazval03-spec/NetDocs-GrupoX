<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <tema id="T5" lang="es">
            <metadata>
                <titulo>Redes de Computadoras</titulo>
                <subtitulo>Conceptos fundamentales, clasificación y tipos de conexión</subtitulo>
            </metadata>

            <secciones>

                <!-- Sección 1: Fundamentos -->
                <seccion id="S1" nombre="Fundamentos de Redes">
                    <bloque id="B1" titulo="Definición y Propiedades Clave de las Redes">
                        <parrafo tipo="definicion">
                            <xsl:value-of select="doc/seccion[@nombre='Fundamentos']/descripcion"/>
                        </parrafo>
                        <parrafo>
                            Esta infraestructura digital es el pilar fundamental que permite la comunicación global instantánea y el intercambio de datos en tiempo real.
                        </parrafo>
                    </bloque>

                    <bloque id="B2" titulo="Propiedades clave">
                        <tarjetas>
                            <xsl:for-each select="doc/seccion[@nombre='Fundamentos']/tipos/title">
                                <tarjeta>
                                    <xsl:attribute name="titulo">
                                        <xsl:value-of select="title"/>
                                    </xsl:attribute>
                                    <parrafo>
                                        <xsl:value-of select="descripcion"/>
                                    </parrafo>
                                </tarjeta>
                            </xsl:for-each>
                        </tarjetas>
                    </bloque>

                    <bloque id="B3" titulo="Conclusión">
                        <parrafo tipo="resumen">
                            <xsl:value-of select="doc/seccion[@nombre='Fundamentos']/conclusion"/>
                        </parrafo>
                    </bloque>
                </seccion>

                <!-- Sección 2: Clasificación -->
                <seccion id="S2" nombre="Clasificación de Redes">
                    <bloque id="B4" titulo="Clasificación según su Alcance Geográfico">
                        <parrafo tipo="introduccion">
                            <xsl:value-of select="doc/seccion[@nombre='Clasificacion']/descripcion"/>
                        </parrafo>

                        <tarjetas>
                            <xsl:for-each select="doc/seccion[@nombre='Clasificacion']/tipos/title">
                                <tarjeta>
                                    <xsl:attribute name="titulo">
                                        <xsl:value-of select="title"/>
                                    </xsl:attribute>
                                    <parrafo>
                                        <xsl:value-of select="descripcion"/>
                                    </parrafo>
                                </tarjeta>
                            </xsl:for-each>
                        </tarjetas>
                    </bloque>
                </seccion>

                <!-- Sección 3: Tipos de conexión -->
                <seccion id="S3" nombre="Tipos de Conexión">
                    <bloque id="B5" titulo="Conexiones Guiadas e Inalámbricas">

                        <!-- Guiadas -->
                        <xsl:for-each select="doc/seccion[@nombre='Metodos']/title[title='Conexiones por Cable (Medios Guiados)']">
                            <parrafo tipo="introduccion">
                                <xsl:value-of select="descripcion"/>
                            </parrafo>

                            <tarjetas>
                                <xsl:for-each select="title">
                                    <tarjeta>
                                        <xsl:attribute name="titulo">
                                            <xsl:value-of select="title"/>
                                        </xsl:attribute>
                                        <parrafo>
                                            <xsl:value-of select="descripcion"/>
                                        </parrafo>
                                    </tarjeta>
                                </xsl:for-each>
                            </tarjetas>
                        </xsl:for-each>

                        <!-- Inalámbricas -->
                        <xsl:for-each select="doc/seccion[@nombre='Metodos']/title[title='Conexiones Inalámbricas (Medios No Guiados)']">
                            <parrafo tipo="introduccion">
                                <xsl:value-of select="descripcion"/>
                            </parrafo>

                            <tarjetas>
                                <xsl:for-each select="title">
                                    <tarjeta>
                                        <xsl:attribute name="titulo">
                                            <xsl:value-of select="title"/>
                                        </xsl:attribute>
                                        <parrafo>
                                            <xsl:value-of select="descripcion"/>
                                        </parrafo>
                                    </tarjeta>
                                </xsl:for-each>
                            </tarjetas>
                        </xsl:for-each>

                    </bloque>
                </seccion>

            </secciones>
        </tema>
    </xsl:template>

</xsl:stylesheet>
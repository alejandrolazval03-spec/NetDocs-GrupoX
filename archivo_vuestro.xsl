<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" encoding="UTF-8" />

  <xsl:template match="/">

    <tema id="T5" lang="es">
      <metadata>
        <titulo>
          <xsl:value-of select="pdf_redes/metadata/titulo" />
        </titulo>
        <subtitulo></subtitulo>
      </metadata>

      <secciones>
        <seccion id="S1" nombre="Fundamentos de Redes">
          <bloque id="B1" titulo="Definición">
            <parrafo tipo="definicion"></parrafo>
            <parrafo></parrafo>
          </bloque>
          <bloque id="B2" titulo="Propiedades">
            <tarjetas>
              <tarjeta titulo="Interoperabilidad">
                <parrafo></parrafo>
              </tarjeta>
              <tarjeta titulo="Escalabilidad">
                <parrafo></parrafo>
              </tarjeta>
            </tarjetas>
          </bloque>
        </seccion>

        <seccion id="S2" nombre="Modelo OSI">
          <bloque id="B3" titulo="Capas Principales">
            <tabla titulo="Resumen de Capas">
              <col nombre="Nivel" />
              <col nombre="Nombre" />
              <col nombre="Protocolos" />
              <fila>
                <c>7</c>
                <c></c>
                <c></c>
              </fila>
              <fila>
                <c>4</c>
                <c></c>
                <c></c>
              </fila>
              <fila>
                <c>3</c>
                <c></c>
                <c></c>
              </fila>
            </tabla>
          </bloque>
        </seccion>

        <seccion id="S3" nombre="Protocolos de Transporte">
          <bloque id="B4" titulo="TCP vs UDP">
            <tarjetas>
              <tarjeta titulo="TCP">
                <parrafo></parrafo>
                <parrafo tipo="nota"></parrafo>
              </tarjeta>
              <tarjeta titulo="UDP">
                <parrafo></parrafo>
                <parrafo tipo="nota"></parrafo>
              </tarjeta>
            </tarjetas>
          </bloque>
        </seccion>
      </secciones>
    </tema>
  </xsl:template>
</xsl:stylesheet>
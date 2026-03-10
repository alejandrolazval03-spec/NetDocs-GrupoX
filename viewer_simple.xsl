<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes" />
  <xsl:strip-space elements="*" />

  <!-- Root -->
  <xsl:template match="/tema">
    <html lang="{@lang}">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>
          <xsl:value-of select="metadata/titulo" />
        </title>
        <style>
          body { font-family: system-ui, sans-serif;margin: 0;line-height: 1.6;color:
          #1e293b;background: #cde2f7 }
          header { background: linear-gradient(135deg, #1e1b4b, #4338ca);color: #fff;padding: 32px
          18px }
          header h1 { margin: 0 0 4px;font-size: 22px }
          header p { margin: 0;opacity: .9 }
          .wrap { max-width: 1200px;margin: 0 auto;padding: 18px }
          .grid { display: grid;grid-template-columns: 210px 1fr;gap: 16px;align-items: start; }
          nav { position: sticky;top: 12px;background: #ffffff;border: 1px solid
          #e2e8f0;border-radius: 12px;padding: 12px }
          nav h3 { margin: 0 0 8px;font-size: 17px;color: #6366f1;text-transform:
          uppercase;letter-spacing: .5px }
          nav a { display: block;padding: 6px 10px;margin: 3px 0;border-radius: 8px;color:
          #475569;text-decoration: none;font-size: 15px }
          nav a:hover { background: #f1f5f9;color: #7c3aed }
          section { background: #ffffff;border: 1px solid #e2e8f0;border-radius: 12px;padding:
          16px;margin: 0 0 14px }
          section h2 { margin: 0 0 10px;font-size: 17px;color: #1e1b4b /* Azul muy oscuro */ }
          .block+.block { border-top: 1px dashed #e2e8f0;padding-top: 12px;margin-top: 12px }
          .block h3 { margin: 0 0 8px;font-size: 15px;color: #4338ca /* Morado/Índigo */ }
          .def { border-left: 3px solid #8b5cf6;padding-left: 12px;margin: 8px 0 }
          .nota { color: #64748b;font-style: italic }
          .cards { display: grid;grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));gap:
          10px;margin: 10px 0 }
          .card { display: grid; border: 1px solid #e2e8f0;border-radius: 10px;padding:
          10px;background: #fcfaff; width: flex; }
          .card:hover { border-color: #c4b5fd }
          .card h4 { margin: 0 0 4px;font-size: 13px;color: #3730a3 }
          .card .sub { font-size: 11px;color: #64748b;margin-bottom: 4px }
          .card p { margin: 4px 0;font-size: 13px }
          ul { margin: 4px 0 4px 16px }
          table { width: 100%;border-collapse: separate;border-spacing: 0;margin: 10px 0;border: 1px
          solid #e2e8f0;border-radius: 10px;overflow: hidden; table-layout: auto }
          th,td { border: 1px solid #e2e8f0;padding: 6px 8px;font-size: 13px; min-width: 50px;}
          th { background: #f1f5f9;color: #1e1b4b;text-align: left; }
          td { background: #ffffff }
          .pill { display: inline-block;background: #f5f3ff;border: 1px solid #ddd6fe;color:
          #6d28d9;padding: 1px 8px;border-radius: 99px;font-size: 11px;margin-right:
          6px;font-weight: 600 }
          strong { color: #4338ca }
          @media(max-width:800px) { .grid { grid-template-columns: 1fr } nav { position: relative }
          }
        </style>
      </head>
      <body>
        <header>
          <div class="wrap">
            <h1>
              <xsl:value-of select="metadata/titulo" />
            </h1>
            <p>
              <xsl:value-of select="metadata/subtitulo" />
            </p>
          </div>
        </header>
        <div class="wrap grid">
          <nav>
            <h3>Índice</h3>
            <xsl:for-each select="secciones/seccion">
              <a href="#{@id}">
                <xsl:value-of select="@nombre" />
              </a>
            </xsl:for-each>
          </nav>
          <main>
            <xsl:apply-templates select="secciones/seccion" />
          </main>
        </div>
      </body>
    </html>
  </xsl:template>

  <!-- Sección -->
  <xsl:template match="seccion">
    <section id="{@id}">
      <h2>
        <span class="pill">
          <xsl:value-of select="@id" />
        </span>
        <xsl:value-of select="@nombre" />
      </h2>
      <xsl:apply-templates select="bloque" />
    </section>
  </xsl:template>

  <!-- Bloque -->
  <xsl:template match="bloque">
    <div class="block">
      <h3>
        <xsl:value-of select="@titulo" />
      </h3>
      <xsl:apply-templates />
    </div>
  </xsl:template>

  <!-- Párrafos -->
  <xsl:template match="parrafo[@tipo='definicion']">
    <p class="def">
      <strong>Definición:</strong>
      <xsl:value-of select="." />
    </p>
  </xsl:template>
  <xsl:template match="parrafo[@tipo='nota']">
    <p class="nota">
      <xsl:value-of select="." />
    </p>
  </xsl:template>
  <xsl:template match="parrafo">
    <p>
      <xsl:value-of select="." />
    </p>
  </xsl:template>

  <!-- Lista -->
  <xsl:template match="lista">
    <xsl:if test="@titulo">
      <p>
        <strong><xsl:value-of select="@titulo" />:</strong>
      </p>
    </xsl:if>
    <ul>
      <xsl:for-each select="item">
        <li>
          <xsl:value-of select="." />
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>

  <!-- Tarjetas -->
  <xsl:template match="tarjetas">
    <div class="cards">
      <xsl:for-each select="tarjeta">
        <div class="card">
          <h4>
            <xsl:value-of select="@titulo" />
          </h4>
          <xsl:if test="@sub">
            <div class="sub">
              <xsl:value-of select="@sub" />
            </div>
          </xsl:if>
          <xsl:apply-templates />
        </div>
      </xsl:for-each>
    </div>
  </xsl:template>

  <!-- Tabla -->
  <xsl:template match="tabla">
    <xsl:if test="@titulo">
      <h4 style="margin:10px 0 4px;font-size:14px">
        <xsl:value-of select="@titulo" />
      </h4>
    </xsl:if>
    <table>
      <thead>
        <tr>
          <xsl:for-each select="col">
            <th>
              <xsl:value-of select="@nombre" />
            </th>
          </xsl:for-each>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="fila">
          <tr>
            <xsl:for-each select="c">
              <td>
                <xsl:value-of select="." />
              </td>
            </xsl:for-each>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>

</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*" />

    <!-- Root -->
    <xsl:template match="/pdf_redes">
        <html lang="{@lang}">
            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>
                    <xsl:value-of select="metadata/titulo" />
                </title>
                <style>
                    body{font-family:system-ui,sans-serif;margin:0;line-height:1.6;color:#3c2415;background:#fdf6f0}
                    header{background:linear-gradient(135deg,#7c2d12,#c2410c);color:#fff;padding:32px
                    18px}
                    header h1{margin:0 0 4px;font-size:22px}
                    header p{margin:0;opacity:.9}
                    .wrap{max-width:1100px;margin:0 auto;padding:18px}
                    .grid{display:grid;grid-template-columns:220px 1fr;gap:16px}
                    nav{position:sticky;top:12px;background:#fffbf7;border:1px solid
                    #e8d5c4;border-radius:12px;padding:12px}
                    nav h3{margin:0 0
                    8px;font-size:13px;color:#9a3412;text-transform:uppercase;letter-spacing:.5px}
                    nav a{display:block;padding:6px 10px;margin:3px
                    0;border-radius:8px;color:#7c2d12;text-decoration:none;font-size:13px}
                    nav a:hover{background:#fed7aa}
                    section{background:#fffbf7;border:1px solid
                    #e8d5c4;border-radius:12px;padding:16px;margin:0 0 14px}
                    section h2{margin:0 0 10px;font-size:17px;color:#7c2d12}
                    .block+.block{border-top:1px dashed #e8d5c4;padding-top:12px;margin-top:12px}
                    .block h3{margin:0 0 8px;font-size:15px;color:#9a3412}
                    .def{border-left:3px solid #c2410c;padding-left:12px;margin:8px 0}
                    .nota{color:#a8744e;font-style:italic}
                    .cards{display:grid;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));gap:10px;margin:10px
                    0}
                    .card{border:1px solid
                    #e8d5c4;border-radius:10px;padding:10px;background:#fff7ed}
                    .card:hover{border-color:#fb923c}
                    .card h4{margin:0 0 4px;font-size:13px;color:#9a3412}
                    .card .sub{font-size:11px;color:#a8744e;margin-bottom:4px}
                    .card p{margin:4px 0;font-size:13px}
                    ul{margin:4px 0 4px 16px}
                    table{width:100%;border-collapse:collapse;margin:10px 0}
                    th,td{border:1px solid #e8d5c4;padding:6px 8px;font-size:13px}
                    th{background:#fed7aa;color:#7c2d12;text-align:left}
                    td{background:#fffbf7}
                    .pill{display:inline-block;background:#fff7ed;border:1px solid
                    #fdba74;color:#c2410c;padding:1px
                    8px;border-radius:99px;font-size:11px;margin-right:6px;font-weight:600}
                    strong{color:#7c2d12}
                    @media(max-width:800px){.grid{grid-template-columns:1fr}nav{position:relative}}

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
    <xsl:template match="pagina">
        <div class="page-wrapper">
            <span class="page-tag">Página <xsl:value-of select="@numero" /></span>
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="seccion">
        <section id="sec-{generate-id(.)}">
            <xsl:apply-templates />
        </section>
    </xsl:template>

    <xsl:template match="titulo">
        <h2>
            <xsl:value-of select="translate(., '#', '')" />
        </h2>
    </xsl:template>

    <xsl:template match="subtitulo">
        <h3 class="subseccion">
            <xsl:value-of select="translate(., '#', '')" />
        </h3>
    </xsl:template>

    <xsl:template match="parrafo">
        <p>
            <xsl:value-of select="." />
        </p>
    </xsl:template>

    <xsl:template match="lista">
        <ul>
            <xsl:for-each select="elemento">
                <li>
                    <xsl:value-of select="translate(., '*', '')" />
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template match="capas/capa">
        <div class="capa-card">
            <strong>
                <xsl:value-of select="nombre" />
            </strong>
            <p style="margin:5px 0 0">
                <xsl:value-of select="descripcion" />
            </p>
        </div>
    </xsl:template>

    <xsl:template match="protocolo">
        <div class="protocolo-box">
            <h4>Protocolo: <xsl:value-of select="@nombre" /></h4>
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="tabla">
        <h4>
            <xsl:value-of select="@titulo" />
        </h4>
        <table>
            <thead>
                <tr>
                    <xsl:for-each select="encabezado/celda">
                        <th>
                            <xsl:value-of select="." />
                        </th>
                    </xsl:for-each>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="fila">
                    <tr>
                        <xsl:for-each select="celda">
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
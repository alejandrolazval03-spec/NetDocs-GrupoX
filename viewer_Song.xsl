<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*" />

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
                    .grid{display:grid;grid-template-columns:250px 1fr;gap:24px}
                    nav{position:sticky;top:12px;background:#fffbf7;border:1px solid
                    #e8d5c4;border-radius:12px;padding:12px;height:fit-content}
                    nav h3{margin:0 0
                    8px;font-size:13px;color:#9a3412;text-transform:uppercase;letter-spacing:.5px;border-bottom:1px
                    solid #fed7aa;padding-bottom:4px}
                    nav a{display:block;padding:6px 10px;margin:3px
                    0;border-radius:8px;color:#7c2d12;text-decoration:none;font-size:13px}
                    nav a:hover{background:#fed7aa}
                    section{background:#fffbf7;border:1px solid
                    #e8d5c4;border-radius:12px;padding:20px;margin:0 0 20px}
                    h1, h2, h3, h4 {color:#7c2d12;margin-top:0}
                    .page-tag{float:right;font-size:11px;background:#fed7aa;padding:2px
                    8px;border-radius:4px;color:#7c2d12}
                    .capa-card{border-left:4px solid
                    #c2410c;background:#fff7ed;padding:12px;margin:10px 0;border-radius:0 8px 8px 0}
                    .protocolo-box{border:1px solid
                    #fdba74;padding:15px;border-radius:10px;margin:10px 0;background:#fff}
                    table{width:100%;border-collapse:collapse;margin:15px 0}
                    th,td{border:1px solid #e8d5c4;padding:10px;font-size:13px}
                    th{background:#fed7aa;color:#7c2d12;text-align:left}
                    .subseccion{margin-top:20px;padding-top:15px;border-top:1px dashed #e8d5c4}
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
                        <h3>Contenido</h3>
                        <xsl:for-each select="//seccion">
                            <a href="#sec-{generate-id(.)}">
                                <xsl:value-of select="substring-after(titulo, '# ')" />
                            </a>
                        </xsl:for-each>
                    </nav>
                    <main>
                        <xsl:apply-templates select="documento/pagina" />
                    </main>
                </div>
            </body>
        </html>
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
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*" />

    <xsl:template match="/doc">
        <html lang="es">
            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>Apuntes de Redes - Ruben</title>
                <style>
                    body{font-family:system-ui,sans-serif;margin:0;line-height:1.6;color:#3c2415;background:#fdf6f0}
                    header{background:linear-gradient(135deg,#7c2d12,#c2410c);color:#fff;padding:32px
                    18px;text-align:center}
                    header h1{margin:0;font-size:26px;letter-spacing:1px}
                    .wrap{max-width:1100px;margin:0 auto;padding:18px}
                    .grid{display:grid;grid-template-columns:220px 1fr;gap:20px}

                    /* Navegación lateral */
                    nav{position:sticky;top:12px;background:#fffbf7;border:1px solid
                    #e8d5c4;border-radius:12px;padding:15px;height:fit-content}
                    nav h3{margin:0 0
                    10px;font-size:13px;color:#9a3412;text-transform:uppercase;border-bottom:1px
                    solid #fed7aa;padding-bottom:5px}
                    nav a{display:block;padding:8px 10px;margin:4px
                    0;border-radius:8px;color:#7c2d12;text-decoration:none;font-size:14px;font-weight:500}
                    nav a:hover{background:#fed7aa}

                    /* Secciones principales */
                    section{background:#fffbf7;border:1px solid
                    #e8d5c4;border-radius:12px;padding:25px;margin:0 0 20px;box-shadow:0 2px 5px
                    rgba(0,0,0,0.05)}
                    .sec-title{font-size:22px;color:#7c2d12;border-bottom:2px solid
                    #c2410c;padding-bottom:10px;margin-bottom:15px}
                    .main-desc{font-size:16px;color:#4a3728;margin-bottom:20px;background:#fff;padding:15px;border-radius:8px;border-left:4px
                    solid #fdba74}

                    /* Tarjetas de tipos/conceptos */
                    .cards-container{display:grid;grid-template-columns:repeat(auto-fit,
                    minmax(280px, 1fr));gap:15px;margin-top:20px}
                    .card{background:#fff;border:1px solid
                    #e8d5c4;border-radius:10px;padding:15px;transition:transform 0.2s}
                    .card:hover{transform:translateY(-3px);border-color:#c2410c}
                    .card h4{margin:0 0
                    8px;color:#9a3412;font-size:16px;display:flex;align-items:center}
                    .card h4::before{content:"•";margin-right:8px;color:#c2410c;font-size:20px}
                    .card p{margin:0;font-size:14px;color:#574335}

                    /* Conclusión */
                    .conclusion{margin-top:20px;padding:15px;background:#fed7aa;border-radius:8px;color:#7c2d12;font-style:italic;font-size:14px}
                    .conclusion
                    strong{display:block;margin-bottom:5px;text-transform:uppercase;font-size:12px;letter-spacing:1px}
                    @media(max-width:800px){.grid{grid-template-columns:1fr}nav{position:relative;top:0;margin-bottom:20px}}
                </style>
            </head>
            <body>
                <header>
                    <div class="wrap">
                        <h1>Documentación de Redes</h1>
                    </div>
                </header>
                <div class="wrap grid">
                    <nav>
                        <h3>Secciones</h3>
                        <xsl:for-each select="seccion">
                            <a href="#sec-{generate-id(.)}">
                                <xsl:value-of select="@nombre" />
                            </a>
                        </xsl:for-each>
                    </nav>
                    <main>
                        <xsl:apply-templates select="seccion" />
                    </main>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="seccion">
        <section id="sec-{generate-id(.)}">
            <h2 class="sec-title">
                <xsl:value-of select="title" />
            </h2>
            <div class="main-desc">
                <xsl:value-of select="descripcion" />
            </div>

            <div class="cards-container">
                <xsl:apply-templates select="tipos" />
            </div>

            <xsl:if test="conclusion">
                <div class="conclusion">
                    <strong>Resumen final:</strong>
                    <xsl:value-of select="conclusion" />
                </div>
            </xsl:if>
        </section>
    </xsl:template>

    <xsl:template match="tipos">
        <xsl:for-each select="title">
            <div class="card">
                <h4>
                    <xsl:value-of select="." />
                </h4>
                <p>
                    <xsl:value-of select="following-sibling::descripcion[1]" />
                </p>

                <xsl:if test="title">
                    <div style="margin-top:10px; padding-left:10px; border-left:1px solid #fed7aa">
                        <xsl:apply-templates select="title" />
                    </div>
                </xsl:if>
            </div>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
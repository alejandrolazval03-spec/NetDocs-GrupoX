<?xml version="1.0" encoding="UTF-8"?>
<tema id="T1" lang="es">
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:output method="xml" indent="yes" encoding="UTF-8" />
        <xsl:template match="/pdf_redes">
            <metadata>
                <titulo>Redes y Telecomunicaciones</titulo>
                <subtitulo>Seguridad, Topologías, Hardware y Wi-Fi</subtitulo>
            </metadata>

            <secciones>
                <seccion id="S1" nombre="Seguridad">
                    <bloque id="B1" titulo="Seguridad en Protocolos y Redes">
                        <parrafo>Proteger los datos en tránsito y en reposo es fundamental en el
                            mundo
                            actual de ciberamenazas constantes. Las redes modernas implementan
                            múltiples
                            capas de seguridad.</parrafo>

                        <tarjetas>
                            <tarjeta titulo="HTTPS (HTTP Secure)">
                                <parrafo tipo="definicion">Combina HTTP con cifrado SSL/TLS (Secure
                                    Sockets
                                    Layer / Transport Layer Security). Cifra toda la comunicación
                                    entre
                                    navegador y servidor web, protegiendo contraseñas, datos
                                    bancarios y
                                    comunicaciones privadas. Esencial para comercio electrónico,
                                    banca
                                    online y cualquier sitio que maneje información sensible. Los
                                    navegadores modernos marcan sitios HTTP como "No seguros".</parrafo>
                            </tarjeta>
                            <tarjeta titulo="VPN / IPsec">
                                <parrafo tipo="definicion">Las VPNs (Virtual Private Networks) crean
                                    "túneles" cifrados sobre redes públicas (como Internet),
                                    permitiendo
                                    acceso remoto seguro a redes corporativas. IPsec cifra cada
                                    paquete IP,
                                    protegiendo confidencialidad e integridad. Fundamental para
                                    teletrabajo
                                    seguro, evitando que hackers intercepten datos en Wi-Fi públicas
                                    o
                                    conexiones no confiables.</parrafo>
                            </tarjeta>
                            <tarjeta titulo="Firewalls">
                                <parrafo tipo="definicion">Dispositivos (hardware) o software que
                                    actúan
                                    como barreras de seguridad, filtrando el tráfico de red según
                                    reglas
                                    predefinidas. Bloquean accesos no autorizados permitiendo solo
                                    conexiones legítimas. Funcionan analizando direcciones IP de
                                    origen/destino, puertos, protocolos y patrones de tráfico
                                    sospechosos.
                                    Pueden ser perimetrales (protegen toda la red) o personales
                                    (protegen un
                                    PC individual).</parrafo>
                            </tarjeta>
                            <tarjeta titulo="WPA3">
                                <parrafo tipo="definicion">El estándar más reciente y seguro para
                                    proteger
                                    redes Wi-Fi (2018). Mejora significativamente sobre WPA2 con
                                    cifrado más
                                    robusto (192-bit en modo Enterprise), protección contra ataques
                                    de
                                    fuerza bruta a contraseñas, y cifrado individualizado de
                                    sesiones
                                    (incluso en redes públicas). WPA3-Personal es el mínimo
                                    recomendado para
                                    redes domésticas y empresariales actuales.</parrafo>
                            </tarjeta>
                        </tarjetas>

                        <parrafo tipo="nota">Principio de Defensa en Profundidad: La seguridad
                            efectiva no
                            depende de una sola tecnología, sino de múltiples capas complementarias.
                            Una red
                            moderna debe combinar: cifrado de comunicaciones (HTTPS, VPN), control
                            de acceso
                            (Firewalls, autenticación), seguridad Wi-Fi (WPA3), actualizaciones
                            regulares de
                            software, formación de usuarios contra phishing, y sistemas de detección
                            de
                            intrusiones (IDS/IPS).</parrafo>
                    </bloque>
                </seccion>

                <seccion id="S2" nombre="Topologías">
                    <bloque id="B2" titulo="Topologías de Red y Modos de Conexión">
                        <parrafo>La topología define la estructura física o lógica en la que están
                            conectados los dispositivos de una red. Cada topología tiene ventajas,
                            desventajas y casos de uso específicos que determinan su idoneidad para
                            diferentes escenarios.</parrafo>

                        <tarjetas>
                            <tarjeta titulo="Bus">
                                <parrafo>Un solo cable central (backbone) al que todos los
                                    dispositivos se
                                    conectan.</parrafo>
                                <parrafo tipo="nota">Ventaja: Simplicidad, bajo coste. Desventaja:
                                    Si el
                                    cable central se rompe, toda la red cae.</parrafo>
                            </tarjeta>
                            <tarjeta titulo="Estrella">
                                <parrafo>Todos los dispositivos conectados a un punto central
                                    (Switch o
                                    Hub).</parrafo>
                                <parrafo tipo="nota">Ventaja: Si falla un cable, solo ese
                                    dispositivo se
                                    desconecta; el resto funciona. Fácil diagnóstico y
                                    escalabilidad.
                                    Desventaja: El punto central es crítico. Estándar actual en LANs
                                    Ethernet.</parrafo>
                            </tarjeta>
                            <tarjeta titulo="Anillo">
                                <parrafo>Circuito cerrado donde los datos viajan en una dirección (o
                                    bidireccional en anillo dual). Cada nodo regenera la señal.</parrafo>
                            </tarjeta>
                            <tarjeta titulo="Malla">
                                <parrafo>Todos (o muchos) nodos conectados entre sí directamente.
                                    Uso: Redes
                                    críticas (militares, satélites), Internet backbone, redes de
                                    sensores.</parrafo>
                                <parrafo tipo="nota">Ventaja: Máxima redundancia y robustez. Si
                                    falla un
                                    enlace, los datos toman rutas alternativas. Desventaja: Coste
                                    alto.</parrafo>
                            </tarjeta>
                            <tarjeta titulo="Árbol">
                                <parrafo>Múltiples topologías en estrella conectadas jerárquicamente
                                    a un
                                    backbone central. Uso: Edificios grandes, campus universitarios,
                                    empresas con estructura por divisiones.</parrafo>
                                <parrafo tipo="nota">Ventaja: Escalable, organizada por jerarquías
                                    (departamentos, plantas).</parrafo>
                            </tarjeta>
                        </tarjetas>
                    </bloque>
                </seccion>

                <seccion id="S3" nombre="Modos de Conexión">
                    <bloque id="B3" titulo="Protocolos de Transporte (Orientado a Conexión)">
                        <tarjetas>
                            <tarjeta titulo="TCP">
                                <parrafo>"Llama antes de hablar". Establece un canal dedicado
                                    mediante
                                    triple apretón de manos (SYN, SYN-ACK, ACK) antes de transmitir
                                    datos.
                                    Garantiza orden y llegada de datos. Retransmite paquetes
                                    perdidos.
                                    Control de flujo y congestión.</parrafo>
                                <parrafo tipo="nota">Ventajas: Alta fiabilidad e integridad.
                                    Desventajas:
                                    Mayor latencia.</parrafo>
                            </tarjeta>
                            <tarjeta titulo="UDP">
                                <parrafo>"Envía y olvida". No establece sesión previa. Cada paquete
                                    viaja
                                    independientemente. No confirma recepción. No garantiza orden ni
                                    entrega. Uso: Streaming, videollamadas, juegos online.</parrafo>
                                <parrafo tipo="nota">Ventajas: Máxima velocidad y baja latencia.
                                    Desventajas: No garantiza entrega ni orden.</parrafo>
                            </tarjeta>
                        </tarjetas>
                    </bloque>
                </seccion>

                <seccion id="S4" nombre="Hardware">
                    <bloque id="B4" titulo="Medios de Transmisión: Cable Par Trenzado">
                        <tabla titulo="Categorías de Cable">
                            <col nombre="Categoría" />
                            <col nombre="Velocidad" />
                            <col nombre="Alcance" />
                            <col nombre="Descripción" />
                            <fila>
                                <c>Cat5e</c>
                                <c>1Gbps</c>
                                <c>100m</c>
                                <c>Uso: Hogares, oficinas pequeñas. Económico y suficiente para la
                                    mayoría.</c>
                            </fila>
                            <fila>
                                <c>Cat6</c>
                                <c>10Gbps</c>
                                <c>55m</c>
                                <c>Hasta 10 Gbps en 55m, 1 Gbps en 100m. Uso: Oficinas
                                    profesionales. Mejor
                                    blindaje contra interferencias.</c>
                            </fila>
                            <fila>
                                <c>Cat6a_7</c>
                                <c>10Gbps</c>
                                <c>100m</c>
                                <c>10 Gbps sostenidos en 100m. Uso: Datacenters, infraestructuras
                                    exigentes.
                                    Máximo blindaje (S/FTP).</c>
                            </fila>
                        </tabla>
                    </bloque>

                    <bloque id="B5" titulo="Medios de Transmisión: Fibra Óptica">
                        <tarjetas>
                            <tarjeta titulo="Monomodo">
                                <parrafo>Núcleo de 9 micrómetros. Un solo haz de luz. Distancias:
                                    40-100+ km
                                    sin repetidores. Uso: Enlaces troncales ISP, conexiones entre
                                    ciudades,
                                    cables submarinos intercontinentales. Láser de alta precisión.</parrafo>
                            </tarjeta>
                            <tarjeta titulo="Multimodo">
                                <parrafo>Núcleo de 50-62.5 micrómetros. Múltiples haces de luz.
                                    Distancias:
                                    Hasta 2 km. Uso: Campus, edificios, datacenters internos. LED
                                    más
                                    económico. Velocidades: 10/40/100 Gbps.</parrafo>
                            </tarjeta>
                        </tarjetas>
                        <parrafo tipo="nota">Ventajas: Inmunidad total a interferencias
                            electromagnéticas,
                            sin diafonía, distancias enormes, ancho de banda masivo (Terabits/s),
                            seguridad
                            (difícil interceptar luz). Desventajas: Coste inicial más alto, requiere
                            técnicos especializados para empalmes.</parrafo>
                    </bloque>
                </seccion>

                <seccion id="S5" nombre="WiFi">
                    <bloque id="B6" titulo="Estándares Inalámbricos">
                        <tabla titulo="Evolución de Estándares Wi-Fi">
                            <col nombre="Nombre" />
                            <col nombre="Código" />
                            <col nombre="Velocidad" />
                            <col nombre="Frecuencia" />
                            <col nombre="Características" />
                            <fila>
                                <c>Wi-Fi 3</c>
                                <c>802.11b/g</c>
                                <c>54Mbps</c>
                                <c>2.4 GHz</c>
                                <c>Banda saturadísima (interferencias con microondas, Bluetooth,
                                    teléfonos
                                    inalámbricos). Obsoleto.</c>
                            </fila>
                            <fila>
                                <c>Wi-Fi 4</c>
                                <c>802.11n</c>
                                <c>600Mbps</c>
                                <c>2.4-5GHz</c>
                                <c>Introduce MIMO (Multiple Input Multiple Output): múltiples
                                    antenas para
                                    mejor rendimiento. Gran avance en velocidad.</c>
                            </fila>
                            <fila>
                                <c>Wi-Fi 5</c>
                                <c>802.11ac</c>
                                <c>3.5Gbps</c>
                                <c>5GHz</c>
                                <c>El router puede comunicarse con múltiples dispositivos
                                    simultáneamente.
                                    Beamforming. Estándar dominante 2013-2019.</c>
                            </fila>
                            <fila>
                                <c>Wi-Fi 6</c>
                                <c>802.11ax</c>
                                <c>9.6Gbps</c>
                                <c>2.4-5GHz</c>
                                <c>Revolución en eficiencia: OFDMA permite servir múltiples
                                    dispositivos.
                                    TWT reduce consumo en IoT. Ideal para ambientes densos.</c>
                            </fila>
                        </tabla>
                    </bloque>
                </seccion>
            </secciones>
        </xsl:template>
    </xsl:stylesheet>

</tema>
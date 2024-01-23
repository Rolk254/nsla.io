<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html lang="es">
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>NSLA-Calendario</title>
        <link rel="stylesheet" href="../estilos/styles.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto"/>
        <link rel="icon" type="image/x-icon" href="../imagenes/logos/nofondo.png"/>
    </head>
    <body>
        <header>
            <div class="left-section">
              <a href="../index.html"><img class="logo" src="../imagenes/logos/nofondo2.png" alt=""/></a>
            </div>
            <div class="togglearea">
                <label for="toggle">
                    <span></span>
                    <span></span>
                    <span></span>
                </label>
            </div>
              <input type="checkbox" id="toggle"/> 
              <div class="navbar">
                <a href="../index.html">Inicio</a>
                <a id="active" href="calendar_t1.xml">Calendario</a>
                <a href="clasi.xml">Clasificación</a>
                <a href="datos.xml">Equipos</a>
                <a href="../paginas/noticias.html">Noticias</a>
                <a href="../paginas/contacto.html">Contacto</a>
              </div>
        </header>
        <div class="select">
            <select>
                <option value="1">TEMPORADA 1</option>
                <option value="2">TEMPORADA 2</option>
                <option value="3">TEMPORADA 3</option>
            </select>
        </div>
        <div class="menu">
          <xsl:apply-templates select="//jornada" mode="menu"/>
      </div>
      <div class="menu-despegable">
        <img src="../imagenes/otras/publi.png" alt=""/>
    </div>
      <a class="boton" href="#active"><button class="pasubir">
        <svg class="svgIcon" viewBox="0 0 384 512">
          <path
            d="M214.6 41.4c-12.5-12.5-32.8-12.5-45.3 0l-160 160c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L160 141.2V448c0 17.7 14.3 32 32 32s32-14.3 32-32V141.2L329.4 246.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3l-160-160z"
          ></path>
        </svg>
      </button></a>
        <xsl:apply-templates select="//jornada"/>
        <footer class="footer" id="myFooter">
            <div></div>
        </footer>
        <script src="../scripts/footer.js"></script>
    </body>
    </html>
  </xsl:template>

  <xsl:template match="jornada" mode="menu">
    <a href="#jornada_{@num}">Jornada <xsl:value-of select="@num"/></a>
</xsl:template>

<xsl:template match="jornada">
    <h1 id="jornada_{@num}" style="text-align:center;">Jornada <xsl:value-of select="@num"/></h1>
    <div class="divpartidos">
        <xsl:apply-templates select="partido"/>
    </div>
</xsl:template>

  <xsl:template match="partido">
    <div class="infopartido">
      <h2><xsl:value-of select="fecha"/></h2><hr/>
      <label class="space">
        <h3><xsl:value-of select="hora"/></h3>
        <h3><xsl:value-of select="equipos/local"/> Vs <xsl:value-of select="equipos/visitante"/></h3>
        <a class="colorblue">Tickets</a>
      </label>
      <hr/>
    </div>
  </xsl:template>

</xsl:stylesheet>
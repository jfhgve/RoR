<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!--xsl:template говорит о том, что тут будет замена. match показывает, к какой части документа это применимо-->
  <xsl:template match="/">
    <!--Внутри шаблона пишем наше преобразование-->
    <html>
      <head>
        <title>Ответ</title>
      </head>
      <body>
        <xsl:for-each select="objects/object">
          <table border="1" width="30%" >
            <tr>
              <td>
                <!--Извлекаем значение из XML-тега-->
                <xsl:value-of select="number"></xsl:value-of>
              </td>
              <td>
                <xsl:value-of select="quantity"></xsl:value-of>
              </td>
            </tr>
          </table>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
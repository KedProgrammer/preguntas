class Modelo

  attr_accessor :pregunta
  attr_accessor :respuesta
  attr_accessor :respuesta_usuario
  attr_accessor :file
#Metodo que lee las lineas predefinidas que corresponde a las preguntas
  def preguntar(posicion)
    linea_pregunta = [0,3,6,9,12,15,18,21,24]
#Lee preguntas segun la posicion mandada por el controlador y establece la respuesta que esta una linea mas abajo
    @pregunta = File.open(@file, "r"){|file| puts file.readlines[linea_pregunta[posicion]]}
    @respuesta = File.open(@file, "r"){|file|  file.readlines[linea_pregunta[posicion]+1]}
  end
#metodo que valida la respuesta ingresada por el usuario, la cual es pasada por el controlador
  def validacion(respuesta)

    if @respuesta == respuesta
      true
    else
      false
    end

  end
end



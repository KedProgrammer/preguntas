class Modelo

  attr_accessor :pregunta
  attr_accessor :respuesta
  attr_accessor :respuesta_usuario
  attr_accessor :file
  attr_accessor  :puntos
  attr_accessor :primer_intento
#Metodo que lee las lineas predefinidas que corresponde a las preguntas
  def initialize
    @linea_pregunta = [0,3,6,9,12,15,18,21,24]
    @primer_intento = true
    @puntos = 0
  end

#Lee preguntas segun la posicion mandada por el controlador y establece la respuesta que esta una linea mas abajo
  def preguntar(posicion)
    @pregunta = File.open(@file, "r"){|file| puts file.readlines[@linea_pregunta[posicion]]}
    @respuesta = File.open(@file, "r"){|file|  file.readlines[@linea_pregunta[posicion]+1]}
  end


#metodo que valida la respuesta ingresada por el usuario, la cual es pasada por el controlador
  def validacion(respuesta)
    if @respuesta == respuesta.downcase
      true
    else
      false
      @primer_intento = false
    end
  end

#si es el primer intento suma un puntaje
def primer?
  if @primer_intento
    @puntos = @puntos + 1
  end

end
end



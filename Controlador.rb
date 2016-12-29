require_relative "Modelo"
require_relative 'vista'
class Controlador
  attr_accessor :pregunta
#se crean las instancias del modelo y la vista cuando se instancia el controlador
  def initialize()
    @@vista = Vista.new(self)
    @modelo = Modelo.new

  end
#metodo que pasa la posicion al modelo para que lea la pregunta
  def preguntar(posicion)

    @modelo.preguntar(posicion)


  end
#metodo que pasa la respuesta del usuario para que el modelo la valide
  def validacion(respuesta)
    @modelo.validacion(respuesta)

  end
#metodo que  pasa el archivo de preguntas y respuestas segun la opcion ingresada por el usuario
  def mandar_archivo(file)
    @modelo.file = file
  end
#se instancia el controlador y se inicia la aplucacion
  controlador = Controlador.new
  @@vista.start

end





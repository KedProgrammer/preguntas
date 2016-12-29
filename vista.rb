

class Vista
  #el constructor de vista requiere un parametro tipo controlador
  def initialize(controlador)
    @controlador = controlador
    @posicion = 0
  end
#inicia el juego con la interfaz inicial,pasa el archivo correspondiente y  hace la primera pregunta
  def start
    puts "bienvenido al cuestionario acerca de programacion\n"
    puts "todas las respuestas deben ponerse en minuscula\n"
    puts "Que cuestionario deseas tener?\n"
    puts "Presione uno para ruby\n"
    puts "Presione dos para javascript\n"
    puts "Presione tres para salir"
    @input = gets.chomp
    archivo
    preguntar(@posicion)
  end
#valida las respuestas del usuario y se llama a si mismo para crear un bucle hasta que acaben las preguntas
  def preguntar(posicion)
    @controlador.preguntar(posicion)
    @respuesta = gets
    if validacion
      puts "respuesta correcta"
      @posicion += 1
      unless @posicion == 8
        preguntar(@posicion)
      else
        puts "El cuestionario termino gracias por participar"
        @posicion = 0
        start
      end
    else
      puts "incorrecto"
      preguntar(@posicion)
    end
  end
#valida las respueta que hace el usuario llamanado al controlador
  def validacion
    @controlador.validacion(@respuesta)
  end
#define que archivo pasar al controlador segun la opcion elegida por el usuario
  def archivo
    if @input == "uno"
      puts "Bienvenido al cuestionario de ruby"
      @controlador.mandar_archivo("..\\Preguntas\\ruby.txt")

    elsif @input == "dos"
      puts "Bienvenido al cuestionario de javascript"
      @controlador.mandar_archivo("..\\Preguntas\\javascript.txt")
    elsif @input == "tres"
      puts "Gracias por participar"
      exit
    else
      puts "No ha presionado una respuesta correcta"
      puts "Ingrese de nuevo una opcion"
      @input = gets.chomp
      archivo
    end
  end
end


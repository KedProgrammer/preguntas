

class Vista
  #el constructor de vista requiere un parametro tipo controlador
  def initialize(controlador)
    @controlador = controlador
    @posicion = 0
  end



#inicia el juego con la interfaz inicial,pasa el archivo correspondiente y  hace la primera pregunta
  def start
    menu
    @input = gets.chomp
    archivo
    preguntar(@posicion)
  end


#view del menu
  def menu
    puts "==================================================="
    puts "BIENVENDIO AL CUESTIONARIO DE RUBY Y JAVASCRIPT\n"
    puts "==================================================="
    puts "==================================================="
    puts "                    INSTRUCCIONES                   "
    puts "Trata de responder la pregunta que te hace el juego, si la respondes bien a la primera te sumara un punto.                                                    "
    puts "==================================================="
    puts "                      MENU                  "
    puts ""
    puts "Presione uno para ruby\n"
    puts ""
    puts "Presione dos para javascript\n"
    puts ""
    puts "Presione tres para salir"
    puts "=================================================="
  end



#valida las respuestas del usuario y se llama a si mismo para crear un bucle hasta que acaben las preguntas
  def preguntar(posicion)
    @controlador.preguntar(posicion)
    @respuesta = gets
    if validacion
      puts "respuesta correcta"
      #pregunta si la variable que controla el primer intento es true o false para sumar puntaje o no
      @controlador.primerIntento?
      @posicion += 1
      #cuando se  pasa a la siguiente pregunta, se debe pasar la variable a true
@controlador.nueva_pregunta
      #valida si el vector de posiciones de preguntas llego a su final, lo cual indica que se debe iniciar un juevo juego
      unless @posicion == 8
        #se llama a si mismo para crear el bucle de preguntas
        preguntar(@posicion)
      else
     nuevojuego
      end
    else
      puts "incorrecto intenta de nuevo"
      preguntar(@posicion)
    end
  end



#valida las respueta que hace el usuario llamando al controlador
  def validacion
    @controlador.validacion(@respuesta)
  end



#define que archivo pasar al controlador segun la opcion elegida por el usuario
  def archivo
    if @input == "uno" or @input.to_i == 1
      puts "=================================="
      puts "Bienvenido al cuestionario de ruby"
      puts "=================================="
      @controlador.mandar_archivo("..\\Preguntas\\ruby.txt")

    elsif @input == "dos" or @input.to_i == 2
      puts "======================================="
      puts "Bienvenido al cuestionario de javascript"
      puts "======================================="
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



  def nuevojuego
    puts  "=================================================="
    puts ""
    puts "El cuestionario termino gracias por participar"
    puts ""
    puts "Su puntaje es: #{@controlador.getpuntos}"
    puts ""
    puts  "=================================================="

    @controlador.reset
    @posicion = 0
    start
  end
end


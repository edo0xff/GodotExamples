extends Control

onready var pad_1 := $PatternPad/Pad1
onready var pad_2 := $PatternPad/Pad2
onready var pad_3 := $PatternPad/Pad3
onready var pad_4 := $PatternPad/Pad4
onready var pad_5 := $PatternPad/Pad5
onready var pad_6 := $PatternPad/Pad6
onready var pad_7 := $PatternPad/Pad7
onready var pad_8 := $PatternPad/Pad8
onready var pad_9 := $PatternPad/Pad9
onready var pattern_label := $PatternLabel

var pattern: String = ""
var drawing: bool = false # bandera para saber si se esta generando un patron
var last_pad_added: int = 0 # bandera para saber el ultimo caracter agregado al patron


func _input(event):
	# Tenemos que monitorear 2 eventos
	# InputEventMouseButton significa que un botton del raton fue presionado
	# (o soltado) lo que significa que la generacion del patron debe iniciar 
	# (o terminar)
	if event is InputEventMouseButton:
		# la bandera nos sirve para saber si el botton se acaba de presionar 
		# o se solto
		if drawing:
			# si el evento se activo y la bandera esta igualmente activa
			# significa que se solto el boton pues la bandera se activa 
			# cuando el boton se presiona, esto sifnifica que el patron termino
			# de dibujarse, hay que procesarlo
			drawing = false
			process_pattern()
		
		else:
			# la bandera no esta activa por lo tanto el boton del mouse acaba de
			# ser presionado y hay indicar (por medio de la bandera)
			# que el patron comenzo a ser dibujado
			drawing = true
			print_debug("Pattern drawing started")
			# se verifica la posicion del mouse para agregar al patron el
			# pad del cual se inicio la captura del patron
			check_mouse_position()
	
	elif event is InputEventMouseMotion:
		if drawing:
			# si el evento es movimiento del raton y ademas la bandera esta
			# activa significa que el patron esta siendo dibujado
			#  hay que verificar su posicion para agregarla al patron
			check_mouse_position()


func check_mouse_position():
	reset_rect_colors()
	
	# se verifica uno por uno cada control pad
	# para ver en cual de ellos se encuentra el mouse actualmente
	if pad_1.get_global_rect().has_point(get_global_mouse_position()):
		# si el mouse estra dentro del pad se cambia el color
		# solo para visualizar que se ha detectado el mouse sobre el pad
		pad_1.get_node("ColorRect").color = Color.black
		
		# se verifica que el numero del pad no haya sido agregado anteriormente
		# al patron, pues el movimiento dentro del mismo pad puede ocurrir varias
		# veces, sin esta validacion terminariamos con el mismo numero de pad
		# repetido un monton de veces hasta que el mouse sale de su area
		if last_pad_added != 1:
			pattern += "1"
			last_pad_added = 1
	
	elif pad_2.get_global_rect().has_point(get_global_mouse_position()):
		pad_2.get_node("ColorRect").color = Color.black
		if last_pad_added != 2:
			pattern += "2"
			last_pad_added = 2
	
	elif pad_3.get_global_rect().has_point(get_global_mouse_position()):
		pad_3.get_node("ColorRect").color = Color.black
		if last_pad_added != 3:
			pattern += "3"
			last_pad_added = 3
	
	elif pad_4.get_global_rect().has_point(get_global_mouse_position()):
		pad_4.get_node("ColorRect").color = Color.black
		if last_pad_added != 4:
			pattern += "4"
			last_pad_added = 4
	
	elif pad_5.get_global_rect().has_point(get_global_mouse_position()):
		pad_5.get_node("ColorRect").color = Color.black
		if last_pad_added != 5:
			pattern += "5"
			last_pad_added = 5
	
	elif pad_6.get_global_rect().has_point(get_global_mouse_position()):
		pad_6.get_node("ColorRect").color = Color.black
		if last_pad_added != 6:
			pattern += "6"
			last_pad_added = 6
	
	elif pad_7.get_global_rect().has_point(get_global_mouse_position()):
		pad_7.get_node("ColorRect").color = Color.black
		if last_pad_added != 7:
			pattern += "7"
			last_pad_added = 7
	
	elif pad_8.get_global_rect().has_point(get_global_mouse_position()):
		pad_8.get_node("ColorRect").color = Color.black
		if last_pad_added != 8:
			pattern += "8"
			last_pad_added = 8
	
	elif pad_9.get_global_rect().has_point(get_global_mouse_position()):
		pad_9.get_node("ColorRect").color = Color.black
		if last_pad_added != 9:
			pattern += "9"
			last_pad_added = 9


func process_pattern():
	reset_rect_colors()
	
	# dibujamos el patron obtenido en color azul
	for character in pattern:
		match character:
			"1":
				pad_1.get_node("ColorRect").color = Color.blue
			
			"2":
				pad_2.get_node("ColorRect").color = Color.blue
			
			"3":
				pad_3.get_node("ColorRect").color = Color.blue
			
			"4":
				pad_4.get_node("ColorRect").color = Color.blue
			
			"5":
				pad_5.get_node("ColorRect").color = Color.blue
			
			"6":
				pad_6.get_node("ColorRect").color = Color.blue
			
			"7":
				pad_7.get_node("ColorRect").color = Color.blue
			
			"8":
				pad_8.get_node("ColorRect").color = Color.blue
			
			"9":
				pad_9.get_node("ColorRect").color = Color.blue
	
	# se muestra en el label pero aqui puedes hacer lo que quieras con el
	pattern_label.text = pattern
	
	# se resetea
	pattern = ""
	last_pad_added = 0


func reset_rect_colors():
	# resetea los colores del pad a blanco
	pad_1.get_node("ColorRect").color = Color.white
	pad_2.get_node("ColorRect").color = Color.white
	pad_3.get_node("ColorRect").color = Color.white
	pad_4.get_node("ColorRect").color = Color.white
	pad_5.get_node("ColorRect").color = Color.white
	pad_6.get_node("ColorRect").color = Color.white
	pad_7.get_node("ColorRect").color = Color.white
	pad_8.get_node("ColorRect").color = Color.white
	pad_9.get_node("ColorRect").color = Color.white

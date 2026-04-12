extends CharacterBody2D

@onready var DashDuracion = $DashDuracion

const velocidad = 5000.0
const gravedad = 9.8
const dash = 300.0
var salto_diponible = true
var velocidad_de_salto = -500.0
var dash_direccion: float
var dasheando: bool
var se_puede_dashear = true
var puede_parrear: bool

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("izquierda","derecha") #Variable de dirección a donde camina
	velocity.x = direction * velocidad * delta      #Mueve en el eje X
	
	if Input.is_action_just_pressed("dash") and se_puede_dashear: #Dash del personaje
		dash_direccion = direction
		DashDuracion.start()
		dasheando = true
	if dasheando:  #Dasheando con el pj
		velocity.x = dash_direccion * dash
		velocity.y = 0.0
		se_puede_dashear = false
	
	if is_on_floor() or puede_parrear: #Condición del salto
		salto_diponible = true
	else:
		salto_diponible = false
		
	if Input.is_action_just_pressed("saltar") and salto_diponible: #Saltar xd
		velocity.y += velocidad_de_salto
	velocity.y += gravedad #Gravedad constante
	
	move_and_slide()
	
func _on_dash_duracion_timeout() -> void: #Señal para saber que hacer cuando termina el timer del dash
	dasheando = false
	DashDuracion.stop()
	se_puede_dashear = true

func _on_objeto_parreable_body_entered(body: Node2D) -> void:
	puede_parrear = true
func _on_objeto_parreable_body_exited(body: Node2D) -> void:
	puede_parrear = false

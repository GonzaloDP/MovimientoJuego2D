extends CharacterBody2D

const velocidad = 5000
const gravedad = 9
const dash = 500000
var salto_diponible = true
var velocidad_de_salto = -500

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("izquierda","derecha") #Variable de dirección a donde camina
	velocity.x = direction * velocidad * delta      #Mueve en el eje X
	if Input.is_action_just_pressed("dash"):
		velocity.x = direction * (dash * delta)
	
	if is_on_floor():
		salto_diponible = true
	else:
		salto_diponible = false
		
	if Input.is_action_just_pressed("saltar") and salto_diponible:
		velocity.y += velocidad_de_salto
	velocity.y += gravedad
	
	move_and_slide()
	

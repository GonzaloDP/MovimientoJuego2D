extends CharacterBody2D


const velocidad = 5000
const velocidad_salto = -1000
var gravedad: float
var salto_diponible = true

func _process(delta: float) -> void:
	
	pass

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("izquierda","derecha")
	velocity.x = direction * velocidad * delta
	
	if Input.is_action_just_pressed("saltar") and salto_diponible:
		gravedad = -200.0
		velocity.y = velocidad_salto * delta
		
	if is_on_floor():
		salto_diponible = true
		gravedad = 0.0
	else:
		salto_diponible = false
		velocity.y = gravedad + 5500.0 * delta
		
	
	
	
	move_and_slide()
	

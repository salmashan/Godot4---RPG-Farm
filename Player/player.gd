extends CharacterBody2D

@export var speed: int = 35
@onready var animations: AnimationPlayer = $Sprite2D/AnimationPlayer

@export var inventory: Inventory
@export var mall: Mall
# Handle input and calculate movement direction
func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection * speed

func _on_area_entered(area):
	if area.has_method("collect"):
		area.collect(inventory)
# Update the animation based on movement
func updateAnimation():
	if velocity.length() == 0:
		animations.stop()
	else:
		var direction = "down"  # Default direction
		if velocity.x < 0: 
			direction = "left"
		elif velocity.x > 0: 
			direction = "right"
		elif velocity.y < 0: 
			direction = "up"
		animations.play("walk_" + direction)  # Play the correct animation

# Physics process for movement and animation
func _physics_process(delta):
	handleInput()
	updateAnimation()
	move_and_slide()  # Move the character using the built-in velocity property

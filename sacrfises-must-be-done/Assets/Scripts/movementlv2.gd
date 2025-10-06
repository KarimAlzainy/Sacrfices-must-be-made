extends CharacterBody2D


const SPEED = 180.0
const JUMP_VELOCITY = -520.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("wJump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
	
		if collision.get_collider().name == "door":
			get_tree().change_scene_to_file.bind("res://Scenes/Levels/lv3.tscn").call_deferred()
		
		if collision.get_collider().name == "spikes":
			get_tree().change_scene_to_file.bind("res://Scenes/Screens/Retry.tscn").call_deferred()
			
		if collision.get_collider().name == "brokenlamp":
			get_tree().change_scene_to_file.bind("res://Scenes/Screens/Retry.tscn").call_deferred()
	
		if collision.get_collider().name == "toys":
			get_tree().change_scene_to_file.bind("res://Scenes/Screens/Retry.tscn").call_deferred()
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("wLeft", "wRight")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

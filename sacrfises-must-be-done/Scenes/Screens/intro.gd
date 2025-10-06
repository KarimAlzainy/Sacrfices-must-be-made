extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("textAnimation")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://Scenes/Levels/lv1.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

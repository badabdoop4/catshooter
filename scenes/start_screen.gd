extends CanvasLayer

@export var levelScene: PackedScene = load("res://scenes/level.tscn")

func _process(delta):
	if Input.is_action_just_released("shoot"):
		get_tree().change_scene_to_packed(levelScene)


func _on_touch_screen_button_pressed() -> void:
	get_tree().change_scene_to_packed(levelScene)

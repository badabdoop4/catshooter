extends CanvasLayer

@export var levelScene: PackedScene = load("res://scenes/level.tscn")

func _ready():
	$MarginContainer/MarginContainer/Label2.text = $MarginContainer/MarginContainer/Label2.text + str(Global.score)

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		Global.score = 0
		Global.kills = 0
		get_tree().change_scene_to_packed(levelScene)


func _on_touch_screen_button_pressed() -> void:
	Global.score = 0
	Global.kills = 0
	get_tree().change_scene_to_packed(levelScene)

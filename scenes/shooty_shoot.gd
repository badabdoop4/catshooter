extends Area2D

@export var speed = 700

func _ready():
	var tween = create_tween()
	tween.tween_property($Godototoo, 'scale', Vector2(1,2), 2)

func _process(delta):
	position.y -= speed * delta

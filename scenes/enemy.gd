extends Area2D

signal collision

var enemySpeed = RandomNumberGenerator.new().randi_range(300, 400)
var enemyRot = RandomNumberGenerator.new().randf_range(-0.3, 0.3)
var enemyOffset = RandomNumberGenerator.new().randf_range(-1, 1)

func _ready():
	
	var path: String = "res://assets/sprites/" + str(RandomNumberGenerator.new().randi_range(1,2)) + ".webp"
	$Cat.texture = load(path)
	
	var rng := RandomNumberGenerator.new()
	var width = get_viewport().get_visible_rect().size[0]
	var spawn_x = rng.randi_range(0, width)
	var spawn_y = rng.randi_range(-150, -50)
	position = Vector2(spawn_x, spawn_y)
	
func _process(delta):
	position += Vector2(enemyOffset, 1.0) * enemySpeed * delta
	rotation += enemyRot * delta
	
func _on_body_entered(_body):
	collision.emit()


func _on_area_entered(_area):
	Global.kills += 1
	queue_free()

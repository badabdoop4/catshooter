extends Node2D

@export var health := 5
var enemyScene: PackedScene = load("res://scenes/enemy.tscn")
var projectileScene: PackedScene = load("res://scenes/shooty shoot.tscn")

func _ready():
	get_tree().call_group('ui', 'set_health', health)

func _on_enemy_spawn_timeout():
	var enemy = enemyScene.instantiate()
	$Enemies.add_child(enemy)
	
	enemy.connect('collision', _on_enemy_collision)

func _on_enemy_collision():
	health -= 1
	$Hurt.play()
	print('Collision Occured. Health: ' + str(health))
	get_tree().call_group('ui', 'set_health', health)
	if health <= 0:
		print("You died buddy")
		get_tree().change_scene_to_file("res://scenes/GameOver.tscn")

func _on_player_projectile(pos):
	var projectile = projectileScene.instantiate()
	$Projectiles.add_child(projectile)
	$Shoot.play()
	projectile.position = pos
	print("New Projectile: " + str(pos))

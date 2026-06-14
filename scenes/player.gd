extends CharacterBody2D

@export var speed := 500
var can_shoot: bool = true

signal projectile(pos)

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2((get_viewport().get_visible_rect().size[0])/2,500)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot") and can_shoot:
		projectile.emit($ProjectileStartPos.global_position)
		can_shoot = false
		$ShootCooldown.start()


func _on_shoot_cooldown_timeout() -> void:
	can_shoot = true

func _on_touch_screen_button_pressed() -> void:
	if can_shoot:
		projectile.emit($ProjectileStartPos.global_position)
		can_shoot = false
		$ShootCooldown.start()

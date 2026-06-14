extends CanvasLayer
var timeElapsed := 0

static var image = load("res://assets/sprites/My OC.png")

func set_health(amount):
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
		
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$MarginContainer2/HBoxContainer.add_child(text_rect)


func _on_score_timer_timeout() -> void:
	timeElapsed += 1
	Global.score = timeElapsed + Global.kills

func _process(_delta):
		$MarginContainer/Label.text = "Score: " + str(timeElapsed + Global.kills)

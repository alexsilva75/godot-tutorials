extends Area2D

var speed = 400.0
var screen_size = Vector2.ZERO
var h_direction = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	#print(screen_size)
	position.y =  screen_size[1]
	position.x = screen_size[0] * randf()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(position)
	position.y -= speed * delta
	position.x += -h_direction * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_timer_timeout():	
	h_direction *= -h_direction

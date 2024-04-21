extends Area2D

var speed = 400.0
var screen_size = Vector2.ZERO
var h_direction = 30
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("input_event", _on_input_event)
	screen_size = get_viewport_rect().size
	#print(screen_size)
	position.y =  screen_size[1]
	position.x = screen_size[0] * randf()

#
#func _input(event):
	#if event.is_action_pressed("click"):
		#
		#add_child(new_ball)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		#pass
	
	#print(position)
	position.y -= speed * delta
	position.x += -h_direction * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_timer_timeout():	
	h_direction *= -h_direction


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print(event)
		queue_free()

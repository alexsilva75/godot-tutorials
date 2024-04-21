extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var bubble = preload("res://bolha.tscn").instantiate()
	add_child(bubble)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var bubble = preload("res://bolha.tscn").instantiate()
	add_child(bubble)

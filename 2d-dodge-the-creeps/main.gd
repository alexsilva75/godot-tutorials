extends Node

@export  var mob_scene = PackedScene
var score = 0

func _ready():
	randomize()

func new_game():
	score = 0
	$HUD.update_score(score)
	
	get_tree().call_group("mobs", "queue_free")
	$Player.position.x = 480 / 2
	$Player.position.y = 720 / 2
	$Player.start($Player.position)
	
	$StartTimer.start()
	
	$HUD.show_message("Get ready!")
	
	await $StartTimer.timeout
	$ScoreTimer.start()
	$MobTimer.start()
	$Music.play()
	
func game_over():
	$Music.stop()
	$GameOver.play()
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	
func _on_mob_timer_timeout():
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress = randf() * 2400
	
	var mob = preload("res://mob.tscn").instantiate()
	add_child(mob)
	
	mob.position = mob_spawn_location.position
	
	var direction = mob_spawn_location.rotation + PI / 2
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	var velocity = Vector2(randf_range(mob.min_speed, mob.max_speed),0)
	mob.linear_velocity = velocity.rotated(direction)


func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_player_hit():
	game_over()

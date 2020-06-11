extends Area2D

export(PackedScene) var target_scene

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if get_overlapping_bodies().size() > 0:
			if !target_scene: # is null
				print("no scene in this door")
				return
			$AnimationPlayer.play("Open")
			get_overlapping_bodies()[0].play_walk_in_animation() # 0 will be our player
			
func next_level():
	var ERR = get_tree().change_scene_to(target_scene)
	
	if ERR != OK:
		print("something failed in the door scene")

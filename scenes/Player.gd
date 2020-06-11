extends KinematicBody2D

enum State { STOP, MOVE }

var speed = 96 # pixels per second (32x32 tilemap)
var velocity = Vector2()
var state = State.MOVE

func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if state != State.MOVE:
		return
	
	var direction = get_direction()
	velocity = move_and_slide(direction * speed)
	
	if velocity.x == 0:
		$AnimationPlayer.play("Idle")
	else:
		$AnimationPlayer.play("Run")
	
func get_direction():
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		-1.0 if Input.is_action_just_pressed("ui_up") and is_on_floor() else 0.0
	)
	
func play_walk_in_animation():
	state = State.STOP
	$AnimationPlayer.play("DoorIn")
	

extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 80
const FRICTION = 500

enum {
	MOVE,
	ROLL,
	ATTACK
}

var state = MOVE

var velocity = Vector2.ZERO
var input_vector = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	animationTree.active = true

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
		return
		
	input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")


func _physics_process(delta):
	if state == MOVE:
		move_state(delta)
	elif state == ATTACK:
		attack_state(delta)
	elif state == ROLL:
		pass
		
func attack_state(delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")
	
func attack_animation_finished():
	state = MOVE
	

func move_state(delta):
	input_vector = input_vector.normalized()	

	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		# You don't set animation tree in idle because you want it to face last pressed direction
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)

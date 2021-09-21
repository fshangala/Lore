extends KinematicBody2D

onready var animatedSprite = $AnimatedSprite
onready var animationTree = $AnimationTree

var SPEED = 200
var Velocity = Vector2.ZERO

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if direction.x < 0:
		animatedSprite.flip_h=true
		animatedSprite.play("Run")
	elif direction.x > 0:
		animatedSprite.flip_h=false
		animatedSprite.play("Run")
	else:
		animatedSprite.play("Idle")
	Velocity = move_and_slide(direction*SPEED)
	

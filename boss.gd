extends KinematicBody2D


var velocity = Vector2()
const speed = 100
const JUMP = Vector2(0,-1)
const GRAVITY = 5
var direction = 1
var hp = 200
var is_attack = false
var is_dead = false

func _process(delta):
	if is_attack == false:
		velocity.y += GRAVITY
		velocity.x = speed*direction
	if direction == 1:
		if is_attack == false && is_dead == false:	
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("run")
	else:
		if is_attack == false && is_dead == false:	
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("run")
	
	move_and_slide(velocity,JUMP)
	
	if is_on_wall():
		direction = -direction
		$RayCast2D.position.x *=-1
	if $RayCast2D.is_colliding() == false:
		direction = -direction
		$RayCast2D.position.x *=-1

func hit(damage):
	if is_attack == false:
		is_attack = true
		hp -= damage
		velocity = Vector2.ZERO
		if hp > 0:
			$AnimatedSprite.play("hit")
		else:
			is_dead = true
			$AnimatedSprite.play("dead")

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimatedSprite_animation_finished():
	if is_dead ==true:
		queue_free()
		is_dead = false
	is_attack = false

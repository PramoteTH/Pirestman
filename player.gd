extends KinematicBody2D



const velocity = Vector2()
const speed = 200
const GRAVITY = 5
const JUMP = Vector2(0,-1)
const JUMPPower = 450
const FIREBALL = preload("res://fireball.tscn")
var is_attacking = false
var E = ["Enemy","Enemy2","Enemy3","Enemy4","Enemy5","Skyenemy","Skyenemy2","Skyenemy3","Skyenemy4","Skyenemy5"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.y += GRAVITY
	if Input.is_action_pressed("ui_right"):
		if is_attacking == false:
			velocity.x = speed
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("run")
			if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= -1
		
	elif Input.is_action_pressed("ui_left"):
		if is_attacking == false:
			velocity.x = -speed
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("run")
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
	else:
		velocity.x = 0
		if is_attacking == false:
			$AnimatedSprite.play("idle")
		
	if Input.is_action_just_pressed("ui_select") && is_attacking == false :
		is_attacking = true
		$AnimatedSprite.play("hit")
		var fireball = FIREBALL.instance()
		if sign($Position2D.position.x) == 1:
			fireball.set_fireball_direction(1)
		else:
			fireball.set_fireball_direction(-1)
			
		get_parent().add_child(fireball)
		fireball.position = get_global_position()
		
		
		
	#elif Input.is_action_pressed("ui_up"):
	#	velocity.y = -speed
	#	$AnimatedSprite.play("jump")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			print("jump")
			velocity.y = -JUMPPower
	else:
		
		if velocity.y < 0:
			$AnimatedSprite.play("jump")
		else:
			$AnimatedSprite.play("fall")

		
	
		
	
		
	move_and_slide(velocity,JUMP)
	pass
	var target = $RayCast2D.get_collider()
	if target != null:
		print(target.name)
		if target.name in E:
			get_tree().change_scene("res://NewWorld.tscn")
		elif target.name =='boss':
			get_tree().change_scene("res://NewWorld.tscn")
		elif target.name =='bossSky':
			get_tree().change_scene("res://BossStage.tscn")

func _on_AnimatedSprite_animation_finished():
	is_attacking = false


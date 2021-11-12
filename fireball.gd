extends Area2D

const SPEED = 500
var velocity = Vector2()
var direction = 1
var E = ["Enemy","Enemy2","Enemy3","Enemy4","Enemy5","Skyenemy","Skyenemy2","Skyenemy3","Skyenemy4","Skyenemy5"]

func set_fireball_direction(dir):
	direction = dir
	if dir == -1:
			$AnimatedSprite.flip_h = true
			
func _process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	var target = $attack.get_collider()
	if target != null:
		print(target.name)
		if target.name in E:
			target.hit(20)
			queue_free()
		elif target.name == "boss":
			target.hit(20)
			queue_free()
		elif target.name == "boss2":
			target.hit(20)
			queue_free()
		elif target.name == "bossSky":
			target.hit(30)
			queue_free()
		


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.

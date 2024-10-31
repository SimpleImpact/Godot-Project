extends CharacterBody2D

@onready var _animated_sprite = $Player

var change = Vector2(0, 0)
var speed = 5
var delta: float

var left
var right
var up  
var down

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Animations Initalized")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if Input.is_action_pressed("Up") and Input.is_action_pressed("Down"):
		_animated_sprite.play("Rouge Idle")
	elif Input.is_action_pressed("Right") and Input.is_action_pressed("Left"):
		_animated_sprite.play("Rouge Idle")
	elif Input.is_action_pressed("Up") and Input.is_action_pressed("Left"):
		_animated_sprite.play("Rouge Run Left")
	elif Input.is_action_pressed("Right") or Input.is_action_pressed("Up"):
		_animated_sprite.play("Rouge Run Right")
	elif Input.is_action_pressed("Left") or Input.is_action_pressed("Down"):
		_animated_sprite.play("Rouge Run Left")
	else:
		_animated_sprite.play("Rouge Idle")
	pass
	
	left = Input.is_action_pressed("Left")
	right = Input.is_action_pressed("Right")
	up  = Input.is_action_pressed("Up")
	down = Input.is_action_pressed("Down")
	
	if right: change.x += 50
	if left: change.x -= 50
	if up: change.y -= 50
	if down: change.y += 50
	
	self.position += change * speed * _delta
	#getChild().position += change * speed * delta 
	change = Vector2(0, 0)

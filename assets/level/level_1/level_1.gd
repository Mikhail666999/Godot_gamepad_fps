extends Spatial

onready var player = $Zlayer;


func _on_triger_body_entered(body):
	get_tree().change_scene("res://assets/level/level_1/level_1.tscn")
	pass # Replace with function body.

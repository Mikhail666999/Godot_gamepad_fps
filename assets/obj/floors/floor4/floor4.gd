extends MeshInstance



func _on_triger_body_entered(body):
	body.move_and_slide(Vector3(0,1,0));

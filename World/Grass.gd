extends Node2D

func create_grass_effect():
	var GrassEffectScene = load("res://Effects/GrassEffect.tscn")
	var grassEffectInstance = GrassEffectScene.instance()
	grassEffectInstance.global_position = global_position
	var worldScene = get_tree().current_scene
	worldScene.add_child(grassEffectInstance)
	queue_free()


func _on_Hurtbox_area_entered(area):
	create_grass_effect()
	queue_free()

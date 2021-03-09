extends Node2D

const GrassEffectScene = preload("res://Effects/GrassEffect.tscn")

func create_grass_effect():
	var grassEffectInstance = GrassEffectScene.instance()
	grassEffectInstance.global_position = global_position
	get_parent().add_child(grassEffectInstance)


func _on_Hurtbox_area_entered(area):
	create_grass_effect()
	queue_free()

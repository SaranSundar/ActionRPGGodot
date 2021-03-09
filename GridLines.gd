extends Node2D

func _ready():
	set_z_index(100)
	set_process(true)


func _process(delta):
	update()
	
func _draw():
	var grid_width = 10
	var grid_height = 10
	var tile_width = 16
	var tile_height = 16
	
	for r in range(grid_height + 1):
		var left_grid = Vector2.ZERO
		var right_grid = Vector2.ZERO
		left_grid.y = r * tile_height
		right_grid.x = grid_width * tile_width
		right_grid.y = r * tile_height
		draw_line(left_grid, right_grid, Color.red, 1, true)
	
	for c in range(grid_width + 1):
		var top_grid = Vector2.RIGHT * c * tile_width
		var bottom_grid = top_grid + Vector2.DOWN * grid_height * tile_height
		draw_line(top_grid, bottom_grid, Color.red, 1, true)

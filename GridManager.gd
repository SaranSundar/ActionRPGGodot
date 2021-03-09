extends Node2D

var grid = [[]]

var grid_width = 10
var grid_height = 10
var tile_width = 16
var tile_height = 16

# Take in multiple tile map grids for each z level and set y sort node z level higher for each grid
# You can try using tiled to make the tile maps
var level = """
47........
....e.....
.......b..
..........
..b.......
......b...
..........
.......b..
...s......
..........
"""

const TileNode = preload("res://Tiles/Tile.tscn")

const EfficientTile = preload("res://Tiles/EfficientTile.tscn")

onready var tiles = $YSort/Tiles

onready var player = $YSort/Player

func _ready():
	generate_grid()
	player.set_z_index(200)

func create_tile(row, col, x_pos, y_pos):
	var node_type = level.substr(1 + (row * (grid_width + 1)) + col, 1)
	print(node_type)
	var frame_num
	if node_type == ".":
		frame_num = 3
	elif node_type == "b":
		frame_num = 6
	elif node_type == "s":
		frame_num = 300
		player.global_position.x = x_pos + tile_width / 2
		player.global_position.y = y_pos + tile_height / 2
	elif node_type == "e":
		frame_num = 297
	elif node_type == "4":
		frame_num = 4
	elif node_type == "7":
		frame_num = 7
	# print(node.global_position)
	print("row ", row, " col ", col)
	var node = EfficientTile.instance().init(frame_num, x_pos, y_pos)
	tiles.set_z_index(10)
	tiles.add_child(node)
	node.global_position.x = x_pos
	node.global_position.y = y_pos
	return node

func create_node(row, col, x_pos, y_pos):
	var node = TileNode.instance()

	var node_type = level.substr(1 + (row * (grid_width + 1)) + col, 1)
	print(node_type)
	if node_type == ".":
		node.frame = 3
	elif node_type == "b":
		node.frame = 6
	elif node_type == "s":
		node.frame = 300
		player.global_position.x = x_pos + tile_width / 2
		player.global_position.y = y_pos + tile_height / 2
	elif node_type == "e":
		node.frame = 297
	# print(node.global_position)
	tiles.set_z_index(10)
	tiles.add_child(node)
	node.global_position.x = x_pos
	node.global_position.y = y_pos
	return node

func generate_grid():
	var start_x = 0
	var start_y = 0
	
	grid = []
	
	for r in range(grid_height):
		var row = []
		for c in range(grid_width):
			row.append(create_tile(r, c, start_x + (c * tile_width ), start_y + (r * tile_height)))
		grid.append(row)
				
	

extends Node2D

var grid = [[]]

var grid_width = 10
var grid_height = 10
var tile_width = 16
var tile_height = 16

var level = """
..........
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

onready var tiles = $YSort/Tiles

onready var player = $YSort/Player

func _ready():
	generate_grid()
	player.set_z_index(200)

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
			row.append(create_node(r, c, start_x + (c * tile_width ), start_y + (r * tile_height)))
		grid.append(row)
				
	

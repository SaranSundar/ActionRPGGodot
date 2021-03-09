extends Node2D

var tile_set = preload("res://Tiles/TileSet.png")

# Figure out how to get image width and height to calculate frames later

var hFrames = 7
var vFrames = 44
var frameSize = 16

var tile_location = Vector2.ZERO
var tile_pos = Vector2.ZERO
var tile_size = Vector2(frameSize, frameSize)



func init(frame_num, x_pos, y_pos):
	var frameY = int(frame_num / hFrames)
	var frameX = int(frame_num % hFrames)
	print(frameX, " ", frameY)
	tile_location = Vector2(frameX * frameSize, frameY * frameSize)
	print(tile_location)
	tile_pos = Vector2.ZERO
	print(tile_pos)
	return self


func _draw():
	
  draw_texture_rect_region(tile_set,Rect2(tile_pos, tile_size),Rect2(tile_location,tile_size),Color(1,1,1,1))

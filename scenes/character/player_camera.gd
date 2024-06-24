class_name PlayerCamera
extends Camera2D

@export var tile_map: TileMap
@export var player: Player

var min_x_position: int
var max_x_position: int
var min_y_position: int
var max_y_position: int

func _ready():
	var viewport_size = get_viewport_rect().size
	var tile_map_size = _get_tile_map_size()
	var tile_map_global_center = _get_tile_map_center()

	min_x_position = tile_map_global_center.x - (tile_map_size.x / 2) + (viewport_size.x / 2)
	max_x_position = tile_map_global_center.x + (tile_map_size.x / 2) - (viewport_size.x / 2)
	min_y_position = tile_map_global_center.y - (tile_map_size.y / 2) + (viewport_size.y / 2)
	max_y_position = tile_map_global_center.y + (tile_map_size.y / 2) - (viewport_size.y / 2)

func _process(delta):
	#print(global_position)
	global_position = player.global_position
	if global_position.x < min_x_position:
		global_position.x = min_x_position
	if global_position.x > max_x_position:
		global_position.x = max_x_position
	if global_position.y < min_y_position:
		global_position.y = min_y_position
	if global_position.y > max_y_position:
		global_position.y = max_y_position

func _get_tile_map_size() -> Vector2i:
	var tile_size = tile_map.tile_set.tile_size
	var tile_map_size_by_tiles = tile_map.get_used_rect()
	var tile_map_size = Vector2i(
		tile_map_size_by_tiles.end.x - tile_map_size_by_tiles.position.x,
		tile_map_size_by_tiles.end.y - tile_map_size_by_tiles.position.y
	)
	return Vector2i(tile_map_size * tile_size)

# using global_position of the tilemap would only work if the tilemap is perfectly center
# so this function will get the actual global_position of the "center" of the tilemap
func _get_tile_map_center() -> Vector2:
	var tile_map_size_by_tiles = tile_map.get_used_rect()
	var tile_size = tile_map.tile_set.tile_size.x
	
	var top_left_tile_position = tile_map_size_by_tiles.position * tile_map.tile_set.tile_size
	
	var center_x = top_left_tile_position.x + ((float(tile_map_size_by_tiles.size.x) / 2) * tile_size)
	var center_y = top_left_tile_position.y + ((float(tile_map_size_by_tiles.size.y) / 2) * tile_size)
	
	return Vector2(center_x, center_y)

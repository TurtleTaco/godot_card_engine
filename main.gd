extends Node

var _screens = {
	"menu": preload("res://screens/menu/menu_screen.tscn")
}

func _ready():
	change_screen("menu")

func change_screen(screen_name: String) -> void:
	if !_screens.has(screen_name): return
	
	for child in $screen_layer.get_children():
		$screen_layer.remove_child(child)
		child.queue_free()
	
	var screen = _screens[screen_name].instance()
	screen.connect("next_screen", self, "change_screen")
	$screen_layer.add_child(screen)
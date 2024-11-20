extends Control

signal opened
signal closed

var isOpen: bool = false

@onready var mall: Mall = preload("res://Res/mallInventory.tres")
@onready var slot: Array = $NinePatchRect/GridContainer.get_children()

func _ready():
	update()
	
func update():
	for i in range(min(mall.items.size(), slot.size())):
		slot[i].update(mall.items[i])
		
func open():
	visible = true
	isOpen = true
	opened.emit()
	
func close():
	visible = false
	isOpen = false
	closed.emit()

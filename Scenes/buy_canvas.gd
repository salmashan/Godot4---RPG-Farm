extends CanvasLayer

@onready var buy_gui: Control = $BuyGui
@onready var inventory_gui: Control = $"../CanvasLayer/InventoryGui"

func _ready() -> void:
	buy_gui.close()
	inventory_gui.close()
	
func _input(event):
	if event.is_action_pressed("toggle_buy"):
		if buy_gui.isOpen:
			buy_gui.close()
			inventory_gui.close()
		else:
			buy_gui.open()
			inventory_gui.open()

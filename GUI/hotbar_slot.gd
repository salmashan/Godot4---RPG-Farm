extends Button

@onready var background: Sprite2D = $Background
@onready var panel: InventoryStackGui = $CenterContainer/Panel

func update_to_slot(slot: InventorySlot) -> void:
	if !slot.item:
		panel.visible = false
		background.frame = 0
		return
		
	panel.inventorySlot = slot
	panel.update()
	panel.visible = true
	
	background.frame = 1
	
	

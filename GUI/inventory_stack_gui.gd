extends Panel

class_name InventoryStackGui
@onready var itemSprite: Sprite2D = $Item

var inventorySlot: InventorySlot

func update():
	if inventorySlot and inventorySlot.item:
		itemSprite.visible = true
		itemSprite.texture = inventorySlot.item.texture
	else:
		itemSprite.visible = false

extends Button

@onready var backgroundSprite: Sprite2D = $Background
@onready var container: CenterContainer = $CenterContainer
@onready var inventory = preload("res://Res/playerInventory.tres")
var inventoryStackGui: InventoryStackGui
var index: int
func insert(isg: InventoryStackGui):
	inventoryStackGui = isg
	backgroundSprite.frame = 1
	container.add_child(inventoryStackGui)

	if !inventoryStackGui.inventorySlot || inventory.slots[index] == inventoryStackGui.inventorySlot:
		return
	
	inventory.insertSlot(index, inventoryStackGui.inventorySlot)
func takeItem():
	var item = inventoryStackGui
	
	container.remove_child(inventoryStackGui)
	inventoryStackGui = null
	backgroundSprite.frame = 0
	
	return item
	
func isEmpty():
	return !inventoryStackGui 

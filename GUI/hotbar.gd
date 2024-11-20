extends Panel

@onready var inventory: Inventory = preload("res://Res/playerInventory.tres")
@onready var slots: Array = $Container.get_children()

func _ready():
	inventory.updated.connect(update)
	update()
	
func update()-> void:
	for i in range(slots.size()):
		var inventory_slot: InventorySlot = inventory.slots[i]
		slots[i].update_to_slot(inventory_slot)

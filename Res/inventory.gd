extends Resource

class_name Inventory

@export var max_size: int = 15
signal updated

@export var slots: Array = []  # Initialize as empty

func _init():
	slots.resize(max_size)  # Initialize slots with a fixed size
	for i in range(max_size):
		slots[i] = InventorySlot.new()  # Initialize each slot with an empty slot object

# Insert an item into the first available slot
func insert(item: InventoryItem) -> bool:
	for slot in slots:
		if slot.item == null:  # Find an empty slot
			slot.item = item
			emit_signal("updated")  # Notify listeners of the change
			return true
	return false  # Return false if no slots are available

# Remove the item at the specified index
func removeItemAtIndex(index: int):
	if index >= 0 and index < slots.size():
		slots[index] = InventorySlot.new()  # Clear the slot
		emit_signal("updated")  # Notify listeners of the change

# Insert a slot at a specific index and remove the old slot, if any
func insertSlot(index: int, inventorySlot: InventorySlot):
	if index < 0 or index >= slots.size():
		print("Index out of bounds:", index)
		return

	# Find the inventory slot in the current list and remove it if found
	var oldIndex: int = slots.find(inventorySlot)
	if oldIndex != -1:
		removeItemAtIndex(oldIndex)  # Pass the correct argument

	# Insert the new slot at the specified index
	slots[index] = inventorySlot
	emit_signal("updated")  # Notify listeners of the change

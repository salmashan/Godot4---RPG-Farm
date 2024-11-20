extends Area2D

@export var itemRes: InventoryItem
@export var inventory: Inventory  # Member variable for inventory

# This method is called when a body enters the Area2D
func _on_body_entered(node: Node) -> void:
	print("Node entered:", node.name)
	# Call the collect method using the member variable
	collect(inventory)

# The collect method, which handles what happens when the item is collected
func collect(target_inventory: Inventory):  # Renamed parameter to avoid shadowing
	print("Collect method called! Item is being removed.")
	if target_inventory.insert(itemRes):  # Use the parameter name here
		print("Item successfully added to inventory.")
		queue_free()  # Remove this Area2D from the scene
		
	else:
		print("Failed to add item to inventory! Inventory might be full.")

# This method is called when a body exits the Area2D (not used here but defined for completeness)
func _on_body_exited(body: Node) -> void:
	print("Node exited:", body.name)

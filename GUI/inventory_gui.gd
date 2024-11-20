extends Control

signal opened
signal closed

var isOpen: bool = false

@onready var inventory: Inventory = preload("res://Res/playerInventory.tres")
@onready var InventoryStackGuiClass = preload("res://GUI/inventoryStackGui.tscn")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()


var itemInHand: InventoryStackGui
func _ready():
	connectSlots()
	inventory.updated.connect(update)
	update()
	
func connectSlots():
	for i in range(slots.size()):
		var slot = slots[i]
		slot.index = 1
		
		var callable = Callable(self, "onSlotinClicked")
		callable = callable.bind(slot)
		
		slot.pressed.connect(callable)
		
func update():
	for i in range(min(inventory.slots.size(), slots.size())):
		#slots[i].update(inventory.slots[i])
		var inventorSlot: InventorySlot = inventory.slots[i]
		
		if !inventorSlot.item: continue
		
		var inventoryStackGui: InventoryStackGui = slots[i].inventoryStackGui
		if !inventoryStackGui:
			inventoryStackGui = InventoryStackGuiClass.instantiate()
			slots[i].insert(inventoryStackGui)
		
		inventoryStackGui.inventorySlot = inventorSlot
		inventoryStackGui.update()
		 
func open():
	visible = true
	isOpen = true
	opened.emit()
	
func close():
	visible = false
	isOpen = false
	closed.emit()

func onSlotinClicked(slots):
	if slots.isEmpty() && itemInHand:
		insertItemInSlot(slots)
		return
	
	if !itemInHand:
		takeItemFromSlot(slots)
	
func takeItemFromSlot(slots):
	itemInHand = slots.takeItem()
	add_child(itemInHand)
	updateItemInHand()
	
func insertItemInSlot(slots):
	var item = itemInHand
	remove_child(itemInHand)
	itemInHand = null
	
	slots.insert(item)
	
func updateItemInHand():
	if !itemInHand: return
	itemInHand.global_position = get_global_mouse_position() - itemInHand.size/2
	
func _input(event):
	updateItemInHand()

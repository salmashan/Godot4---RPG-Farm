extends Button

@onready var backgroundSprite: Sprite2D = $Background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/Item

func update(item: MallItem):
	if !item:
		backgroundSprite.frame = 0
		itemSprite.visible = false
	else:
		backgroundSprite.frame = 1
		itemSprite.visible = true
		itemSprite.texture = item.texture

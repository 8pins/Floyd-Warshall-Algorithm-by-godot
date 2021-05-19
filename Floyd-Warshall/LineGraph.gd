extends Line2D

var targetNode  = null
var parentNode  = null
var vectorP = Vector2(0,0)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$arrow.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.position = -parentNode.global_position
	
	self.points[0] = parentNode.global_position
	
	var vectorNorm = Vector2(0,0)
	
	if (targetNode != null):
		self.set_name(self.targetNode.get_name())
		self.points[1] = targetNode.global_position
		vectorNorm = (points[1] - points[0]).normalized()
		vectorP.x = vectorNorm.y
		vectorP.y = -vectorNorm.x
		self.points[0] += vectorP*16
		self.points[1] += vectorP*16
		
	$LineEdit.rect_position = (self.points[0] + self.points[1]) / 2 - $LineEdit.rect_pivot_offset
#	$LineEdit.rect_position = (self.points[0] + self.points[1]) / 2 - $LineEdit.rect_pivot_offset + vectorP*32
	
	
	if (points[1] != Vector2(0,0)):
		$arrow.show()
		$arrow.set_rotation((points[1] - points[0]).angle())
		if targetNode != null:
			$arrow.set_position((points[1]-points[0]) - (points[1]-points[0]).normalized()*40 + points[0])
		else:
			$arrow.set_position(points[1])


func setFirstnode(parent):
	self.parentNode = parent

func setSecondPoint(targetNode):
	self.targetNode = targetNode

func setTmpSecondPoint(tmpPos):
	self.points[1] = tmpPos

#func get_value(text):
#
#	pass

#func _on_LineEdit_text_entered(_new_text):
#	$LineEdit.set_editable(false) 
#	pass # Replace with function body.

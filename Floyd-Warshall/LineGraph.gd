extends Line2D

var targetNode  = null
var parentNode  = null

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.global_position = parentNode.global_position
	self.points[0] = parentNode.global_position
	if (targetNode != null):
		self.points[1] = targetNode.global_position


func setFirstnode(parent):
	self.parentNode = parent

func setSecondPoint(targetNode):
	self.targetNode = targetNode

func setTmpSecondPoint(tmpPos):
	self.points[1] = tmpPos

class_name NodeGraph
extends Node2D

var dragMouse = false
var dragLine = false
var overLapAreas = []
var lineGraph = preload("res://graphObject/LineGraph.tscn")

var currentLine = null

var ListChildGraph_Node = []

#var state : int = 2   #0:dragging 1: lineDrag 2: idle

func checkNodeChildExist(node_name):
	for nodeGraph in ListChildGraph_Node:
		if nodeGraph.get_name() == str(node_name):
			return true
	return false

func _ready():
	$Area2D.z_index = self.z_index
	pass

func _process(_delta):
	if(dragMouse):
		set_position(get_viewport().get_mouse_position())
	if dragLine:
		if SystemController.tmpGraph_Node != null:
			if not checkNodeChildExist(SystemController.tmpGraph_Node.get_name()):
				ListChildGraph_Node.append(SystemController.tmpGraph_Node)
				currentLine.setSecondPoint(SystemController.tmpGraph_Node)
			else:
				currentLine.queue_free()
			SystemController.tmpGraph_Node = null
			dragLine = false
			$Button.disabled = false
			SystemController.isDisableDrag = false
		else:
			currentLine.setTmpSecondPoint(get_viewport().get_mouse_position())
			


func _on_Area2D_input_event(_viewport, event, _shape_idx):
	
	if event is InputEventMouseButton or event is InputEventScreenTouch:
		if not SystemController.isDisableDrag:
			if event.is_pressed() && isTopZ_Index():
				dragMouse = true
			else:
				dragMouse = false
		else:
			if event.is_pressed():
				SystemController.tmpGraph_Node = self

func isTopZ_Index():
	if overLapAreas.size() == 0:
		return true
	else:
		for area in overLapAreas:
			if area.z_index > self.z_index:
				return false
	return true

func set_nameNode(Id):
	$Label.text = str(Id)


func _on_Area2D_area_entered(area):
	overLapAreas.append(area)
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	overLapAreas.erase(area)
	pass # Replace with function body.


func _on_Button_button_up():
	dragLine = true
	$Button.disabled = true
	SystemController.isDisableDrag = true
	currentLine = lineGraph.instance()
	currentLine.setFirstnode(self)
	$ListLines.add_child(currentLine)
	pass # Replace with function body.

func getValue(i):
	return $ListLines.get_node(str(i))
	
	pass


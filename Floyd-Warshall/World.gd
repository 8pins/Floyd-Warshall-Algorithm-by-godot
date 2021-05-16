class_name MainWorld
extends Node2D

var graph_node = preload("res://NodeGraph.tscn")
var current_nodeId = 0
var MatrixPath = [[]]

func _on_add_button_released():
	var node = graph_node.instance()
	node.position = Vector2(400,300)
	current_nodeId += 1
	node.set_nameNode(current_nodeId)
	node.z_index = current_nodeId
	
	
	
	get_node("graph_group").add_child(node)
	pass # Replace with function body.

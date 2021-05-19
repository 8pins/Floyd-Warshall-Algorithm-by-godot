class_name MainWorld
extends Node2D

var graph_node = preload("res://NodeGraph.tscn")
var current_nodeId = 0
var MatrixPath = []

func _on_add_button_released():
	var node = graph_node.instance()
	node.position = Vector2(400,300)
	
	node.set_name(str(current_nodeId))
	node.set_nameNode(current_nodeId)
	node.z_index = current_nodeId
	current_nodeId += 1
	get_node("graph_group").add_child(node)
	pass # Replace with function body.


func _on_start_button_released():
	MatrixPath = create_2d_array($graph_group.get_child_count(), $graph_group.get_child_count())
	var sizeMat = $graph_group.get_child_count()
	for i in range(sizeMat):
		for j in range(sizeMat):
			if i == j:
				MatrixPath[i][j] = 0
			else:
				var node = $graph_group.get_node(str(i))
				if node.get_name() == str(i):
					if node.get_node("ListLines") != null :
						var line = node.get_node("ListLines").get_node(str(j))
						if line.targetNode.get_name() == str(j):
							MatrixPath[i][j] = int(line.get_node("LineEdit").get_text())
				pass # Replace with function body.
	print(MatrixPath)
	return MatrixPath
	pass # Replace with function body.

func create_2d_array(row, col): 
	var matrix  = []
	for x in range (col):
		matrix.append([])
		for _y in range (row):
			matrix[x].append(9999)
	return matrix


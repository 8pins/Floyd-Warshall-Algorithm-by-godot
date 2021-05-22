class_name MainWorld
extends Node2D

var graph_node = preload("res://graphObject/NodeGraph.tscn")
var current_nodeId = 0
var MatrixPath = []
var step_count = 0

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
#	thuc hien thuat toan
	for step in range (MatrixPath.size()):
		step_solve(step)
	showMatrix()
	return MatrixPath
	pass # Replace with function body.

func _on_step_buttom_released():
	step_count +=1
	step_solve(step_count)
	if (step_count > MatrixPath.size()):
		print("Stop")
	pass # Replace with function body.

func _on_start_released():
	MatrixPath = create_2d_array($graph_group.get_child_count(), $graph_group.get_child_count())
#	var sizeMat = $graph_group.get_child_count()
	for i in range(MatrixPath.size()):
		for j in range(MatrixPath.size()):
			if i == j:
				MatrixPath[i][j] = 0
			else:
				var node = $graph_group.get_node(str(i))
				if node.get_name() == str(i):
					if node.get_node("ListLines").get_child_count() > 0:
						if node.get_node("ListLines").has_node(str(j)):
							var line = node.get_node("ListLines").get_node(str(j))
							MatrixPath[i][j] = int(line.get_node("LineEdit").get_text())
				pass # Replace with function body.
	showMatrix()
	return MatrixPath
	pass # Replace with function body.
	
func create_2d_array(row, col): 
	var matrix  = []
	for x in range (col):
		matrix.append([])
		for _y in range (row):
			matrix[x].append(9999)
	return matrix

func showMatrix() -> String:
	var result = ""
	for row in MatrixPath:
		result += str(row) + "\n"
		print(row)
	return result

func step_solve(step):
	for i in range (MatrixPath.size()):
		for j in range (MatrixPath.size()):
			if (MatrixPath[i][j] > MatrixPath[i][step] + MatrixPath[step][j]):
				MatrixPath[i][j] = MatrixPath[i][step] + MatrixPath[step][j]
	return MatrixPath
#	dung chuong trinh khi step_count lon hon size
	pass

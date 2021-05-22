class_name MainWorld
extends Node2D

var graph_node = preload("res://graphObject/NodeGraph.tscn")
var current_nodeId = 0
var MatrixPath = []
var step_count = 0
var OptiPath = []
var numtoText = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]

func _on_add_button_released():
	var node = graph_node.instance()
	node.position = Vector2(400,300)
	
	node.set_name(str(current_nodeId))
	node.set_nameNode(numtoText[current_nodeId])
	node.z_index = current_nodeId
	current_nodeId += 1
	get_node("graph_group").add_child(node)
	pass # Replace with function body.

func _on_solve_released() -> String:
#	thuc hien thuat toan
	for step in range (MatrixPath.size()):
		step_solve(step)
	var result = "Solving result= \n" + showMatrix(true) + "\n"
	result += "Solving Path= \n" + showMatrix(false) + "\n"
	return result
	pass # Replace with function body.

func _on_step_buttom_released():
	step_count +=1
	step_solve(step_count)
	if (step_count > MatrixPath.size()):
		print("Stop")
	pass # Replace with function body.

func _on_initMatrix_released() -> String:
	MatrixPath = create_2d_array($graph_group.get_child_count(), $graph_group.get_child_count(), true)
	OptiPath = create_2d_array($graph_group.get_child_count(), $graph_group.get_child_count(), false)
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
	var result = "Init new matrix here: \n" + showMatrix(true) + "\n"
	return result

func _clear_graph():
	current_nodeId = 0
	for child in $graph_group.get_children():
		child.queue_free()

func create_2d_array(row, col, flag): 
	var matrix  = []
	for x in range (col):
		matrix.append([])
		for _y in range (row):
			if flag == true :
				matrix[x].append(9999)
			else:
				matrix[x].append("_")
	return matrix

func showMatrix(flag) -> String:
	var result = ""
	if flag == true:
		for row in MatrixPath:
			for i in row:
				result += str(i) + "\t"
			result += "\n"
			print(row)
	else:
		for row in OptiPath:
			for i in row:
				result += str(i) + "\t"
			result += "\n"
			print(row)
	return result

func step_solve(step):
	for i in range (MatrixPath.size()):
		for j in range (MatrixPath.size()):
			if (MatrixPath[i][j] > MatrixPath[i][step] + MatrixPath[step][j]):
				MatrixPath[i][j] = MatrixPath[i][step] + MatrixPath[step][j]
				OptiPath[i][j] = numtoText[step]
#	dung chuong trinh khi step_count lon hon size
	pass

@tool
extends CharacterBody2D

@export var great_axis_rotation = 1.0
@export var x_extent = 1.0
@export var y_extent = 1.0 

var current_time = 0

func _ready():
	if Engine.is_editor_hint():
		queue_redraw()

func _process(delta):
	if Engine.is_editor_hint():
		queue_redraw()
	else: 
		position = ellipse_point(current_time)
		current_time += delta*10
	

func ellipse_point(t): 
	#print(great_axis_rotation)
	return Vector2(x_extent*cos(great_axis_rotation)*cos(t)\
	 			  - y_extent*sin(great_axis_rotation)*sin(t),\
				   x_extent*sin(great_axis_rotation)*cos(t)\
				  + y_extent*cos(great_axis_rotation)*sin(t))
	
func _draw():
	if Engine.is_editor_hint():
		var nb_points = 1000
		for i in range(nb_points):
			draw_line(ellipse_point(i/float(nb_points)*TAU), ellipse_point((i+1)/float(nb_points)*TAU), Color(0, 1, 0, 1))

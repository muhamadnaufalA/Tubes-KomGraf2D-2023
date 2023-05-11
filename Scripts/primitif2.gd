class_name primitif2 extends "matrix.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func linesDDA(xa : float, ya : float, xb : float, yb : float, warna : String, tipe_garis : int):
	print(xa)
	print(yb)
	var dx = xb - xa
	var dy = yb - ya
	var steps
	var xIncrement
	var yIncrement
	var x = xa
	var y = ya
	var res = PoolVector2Array()
	if (abs(dx) > abs(dy)) :
		steps = abs(dx)
	else : 
		steps = abs(dy)
	xIncrement = dx/ float(steps)
	yIncrement = dy/ float(steps)
	res.append(Vector2(round(x), round(y)))
	for k in steps:
		x += xIncrement
		y += yIncrement
		res.append(Vector2(round(x), round(y)))
	put_pixel_all(line_style(res, tipe_garis, 3),Color(warna))
	
#put_pixel
func put_pixel(x, y, color):
	draw_primitive(PoolVector2Array([Vector2(x, y)]),
		PoolColorArray([color]),
		PoolVector2Array())
			
#scale
func scale2(sx: float, sy: float, refpt: Vector2):
	var m=[[0,0,0],[0,0,0],[0,0,0]]
	
	matrix3x3SetIdentity(m)
	m[0][0] = sx
	m[0][2] = (1 - sx) * refpt.x
	m[1][1] = sy
	m[1][2] = (1 - sy) * refpt.y
	matrix3x3PreMultiply(m, theMatrix)
	
#rotation
func rotate2(a: float, refpt: Vector2):
	var m=[[0,0,0],[0,0,0],[0,0,0]]
	
	matrix3x3SetIdentity(m)
	a = deg2rad(a)
	m[0][0] = cos(a)
	m[0][1] = -sin(a)
	m[0][2] = refpt.x * (1 - cos(a)) + refpt.y * sin(a)
	m[1][0] = sin(a)
	m[1][1] = cos(a)
	m[1][2] = refpt.y * (1 - cos(a)) - refpt.x * sin(a)
	matrix3x3PreMultiply(m, theMatrix)

#translation
func translate2(tx: int, ty: int):
	var m=[[0,0,0],[0,0,0],[0,0,0]]
	
	matrix3x3SetIdentity(m)
	m[0][2] = tx
	m[1][2] = ty
	matrix3x3PreMultiply(m, theMatrix)

#transform
func transformPoints2(npts: int, pts: PoolVector2Array):
	var tmp
	
	for k in range(npts):
		tmp = theMatrix[0][0] * pts[k].x + theMatrix[0][1] * pts[k].y + theMatrix[0][2]
		pts[k].y = theMatrix[1][0] * pts[k].x + theMatrix[1][1] * pts[k].y + theMatrix[1][2]
		pts[k].x = tmp
	return pts


func put_pixel_all(dot: PoolVector2Array, color):
	for i in dot.size():
		put_pixel(dot[i].x, dot[i].y, color)

func line_style(res, type, gap):
	var buffer = PoolVector2Array()
	var dash = 10
	var dot = 1
	
	var count = 0	
	for i in res.size():
		match type:
			# dash-dash
			1: 
				if (count < dash):
					buffer.append_array([res[i]])
					count += 1
				elif (count >= dash && count < dash+gap):
					count += 1
				else:
					count = 0

			# point-point
			2: 
				if (count < dot):
					buffer.append_array([res[i]])
					count+=1
				elif (count >= dot && count < dot+gap):
					count+=1
				else:
					count = 0
			
			# point-dash
			3: 
				if(count < dot):
					buffer.append_array([res[i]])
					count += 1
				elif(count >= dot && count < dot+gap):
					count += 1
				elif(count >= dot+gap && count < dash):
					buffer.append_array([res[i]])
					count +=1
				elif (count >= dash && count < dash+gap):
					count +=1
				else:
					count = 0
	return buffer

func convert_to_pixel(xa, ya, xb, yb, margin_left, margin_top):
	xa = margin_left+xa
	xb = margin_left+xb
	ya = OS.window_size.y -margin_top - ya
	yb = OS.window_size.y -margin_top - yb
	return [xa,ya,xb,yb]

func lineDDA(xa : float, ya : float, xb : float, yb : float):
	print(xa)
	print(yb)
	var dx = xb - xa
	var dy = yb - ya
	var steps
	var xIncrement
	var yIncrement
	var x = xa
	var y = ya
	var res = PoolVector2Array()
	if (abs(dx) > abs(dy)) :
		steps = abs(dx)
	else : 
		steps = abs(dy)
	xIncrement = dx/ float(steps)
	yIncrement = dy/ float(steps)
	res.append(Vector2(round(x), round(y)))
	for k in steps:
		x += xIncrement
		y += yIncrement
		res.append(Vector2(round(x), round(y)))
	return res

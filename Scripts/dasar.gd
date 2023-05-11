class_name dasar extends primitif
	
func persegi(xa, ya, s, margin_left, margin_top):
	var res = PoolVector2Array()
	# Kiri Bawah ke Kiri Atas (Sisi Kiri)
	var px = convert_to_pixel(xa, ya, xa, ya+s, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kiri Atas ke Kanan Atas (Sisi Atas)
	px = convert_to_pixel(xa, ya+s, xa+s, ya+s, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kanan Atas ke Kanan Bawah (Sisi Kanan)
	px = convert_to_pixel(xa+s, ya+s, xa+s, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kanan Bawah ke Kiri Bawah (Sisi Bawah)
	px = convert_to_pixel(xa+s, ya, xa, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	
	return res
	
func persegi_panjang(xa, ya, panjang, lebar, margin_left, margin_top):
	var res = PoolVector2Array()
	# Kiri Bawah ke Kiri Atas (Sisi Kiri)
	var px = convert_to_pixel(xa, ya, xa, ya+panjang, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kiri Atas ke Kanan Atas (Sisi Atas)
	px = convert_to_pixel(xa, ya+panjang, xa+lebar, ya+panjang, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kanan Atas ke Kanan Bawah (Sisi Kanan)
	px = convert_to_pixel(xa+lebar, ya+panjang, xa+lebar, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kanan Bawah ke Kiri Bawah (Sisi Bawah)
	px = convert_to_pixel(xa+lebar, ya, xa, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	return res
	
func segitiga_siku(xa, ya, s, margin_left, margin_top):
	var res = PoolVector2Array()
	# Kiri Bawah ke Kiri Atas (Sisi Kiri)
	var px = convert_to_pixel(xa, ya, xa, ya+s, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kanan Bawah ke Kiri Bawah (Sisi Bawah)
	px = convert_to_pixel(xa+s, ya, xa, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kanan Bawah ke Kiri Atas
	px = convert_to_pixel(xa+s, ya, xa, ya+s+10, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	return res

func trapesium_siku(xa, ya, panjang, lebar, margin_left, margin_top):
	var res = PoolVector2Array()
	# Kiri Bawah ke Kiri Atas (Sisi Kiri)
	var px = convert_to_pixel(xa, ya, xa, ya+lebar, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kiri Atas ke Kanan Atas (Sisi Atas)
	px = convert_to_pixel(xa, ya+lebar, xa+lebar+50, ya+lebar, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kanan Atas ke Kanan Bawah (Sisi Kanan)
	px = convert_to_pixel(xa+lebar+50, ya+lebar, xa+panjang, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kanan Bawah ke Kiri Bawah (Sisi Bawah)
	px = convert_to_pixel(xa+panjang, ya, xa, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	return res
	
func jajar_genjang(xa, ya, s, margin_left, margin_top):
	var res = PoolVector2Array()
	# Kiri Atas ke Kanan Atas (Sisi Atas)
	var px = convert_to_pixel(xa+(s/3), ya+s, xa+s+(s/3), ya+s, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kanan Bawah ke Kiri Bawah (Sisi Bawah)
	px = convert_to_pixel(xa+s, ya, xa, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kanan Atas ke Kanan Bawah (Sisi Kanan)
	px = convert_to_pixel(xa+(s/3)+s, ya+s, xa+s, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kiri Bawah ke Kiri Atas (Sisi Kiri)
	px = convert_to_pixel(xa, ya, xa+(s/3), ya+s, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))	
	return res

func diagonal(margin_left, margin_top):
	var res = PoolVector2Array()
	#Sumbu X
	var xa = margin_left                       
	var ya = margin_top      
	var xb = OS.window_size.x / 2        
	var yb = OS.window_size.y / 2                       
	res.append_array(lineDDA(xa,yb,xb,ya))
	
	return res

func segitiga_samasisi(xa, ya, s, margin_left, margin_top):
	var res = PoolVector2Array()
	# Tengah Bawah ke Kiri Bawah (Sisi Bawah)
	var px = convert_to_pixel(xa+(s/2), ya, xa, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Tengah Bawah ke Kanan Bawah (Sisi Bawah)
	px = convert_to_pixel(xa-(s/2), ya, xa, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kanan Bawah ke Tengah Atas
	px = convert_to_pixel(xa+(s/2), ya, xa, ya+s, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kiri Bawah ke Tengah Atas
	px = convert_to_pixel(xa-(s/2), ya, xa, ya+s, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	
	return res

func pp_diagonal(xa, ya, panjang, lebar, margin_left, margin_top):
	var res = PoolVector2Array()
	# Kiri Bawah ke Kiri Atas (Sisi Kiri)
	var px = convert_to_pixel(xa, ya, xa, ya+panjang, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kiri Atas ke Kanan Atas (Sisi Atas)
	px = convert_to_pixel(xa, ya+panjang, xa+lebar, ya+panjang, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kanan Atas ke Kanan Bawah (Sisi Kanan)
	px = convert_to_pixel(xa+lebar, ya+panjang, xa+lebar, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kanan Bawah ke Kiri Bawah (Sisi Bawah)
	px = convert_to_pixel(xa+lebar, ya, xa, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	return res

func trapesium_samakaki(xa, ya, panjang, lebar, margin_left, margin_top):
	var res = PoolVector2Array()
	# Kiri Bawah ke Kiri Atas (Sisi Kiri)
	var px = convert_to_pixel(xa, ya, xa, ya+lebar, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kiri Atas ke Kanan Atas (Sisi Atas)
	px = convert_to_pixel(xa, ya+lebar, xa+lebar, ya+lebar, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kanan Atas ke Kanan Bawah (Sisi Kanan)
	px = convert_to_pixel(xa+lebar, ya+lebar, xa+panjang, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kanan Bawah ke Kiri Bawah (Sisi Bawah)
	px = convert_to_pixel(xa+panjang, ya, xa, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	return res


################################## CIRCLE ######################################
func _circle_plotModifikasi(xp, yp, x, y,jenis):
	var res = PoolVector2Array()
	
	if (jenis == "SETENGAHKANAN"):
		res.append(Vector2(xp + x, yp + y))
		res.append(Vector2(xp + x, yp - y))
		res.append(Vector2(xp + y, yp + x))
		res.append(Vector2(xp + y, yp - x))
		return res
	elif (jenis == "SETENGAHKIRI"):
		res.append(Vector2(xp - x, yp + y))
		res.append(Vector2(xp - x, yp - y))
		res.append(Vector2(xp - y, yp + x))
		res.append(Vector2(xp - y, yp - x))
		return res
	
func circleModifikasi(xp, yp, radius, jenis):
	var x = 0
	var y = radius
	var p = 1 - radius
	var res = PoolVector2Array()
	res.append_array(_circle_plotModifikasi(xp, yp, x, y, jenis))

	while (x < y):
		x += 1
		if (p < 0):
			p += 2 * x + 1
		else:
			y -= 1
			p += 2 * (x - y) + 1
		res.append_array(_circle_plotModifikasi(xp, yp, x, y, jenis))
	return res

func _circle_plot(xp, yp, x, y):
	var res = PoolVector2Array()

	res.append(Vector2(xp + x, yp + y))
	res.append(Vector2(xp - x, yp + y))
	res.append(Vector2(xp + x, yp - y))
	res.append(Vector2(xp - x, yp - y))

	res.append(Vector2(xp + y, yp + x))
	res.append(Vector2(xp - y, yp + x))
	res.append(Vector2(xp + y, yp - x))
	res.append(Vector2(xp - y, yp - x))
	
	return res
	
func circle(xp, yp, radius):
	var x = 0
	var y = radius
	var p = 1 - radius
	var res = PoolVector2Array()
	res.append_array(_circle_plot(xp, yp, x, y))

	while (x < y):
		x += 1
		if (p < 0):
			p += 2 * x + 1
		else:
			y -= 1
			p += 2 * (x - y) + 1
		res.append_array(_circle_plot(xp, yp, x, y))
	return res
################################################################################


################################# ELIPSE #######################################
func _ellipse_plotModifikasi(xp, yp, x, y, jenis):
	var res = PoolVector2Array()
	
	if (jenis == "SEPEREMPATKANANATAS"):
		#res.append(Vector2(xp + x, yp + y))
		#res.append(Vector2(xp - x, yp + y))
		res.append(Vector2(xp + x, yp - y))
		#res.append(Vector2(xp - x, yp - y))
		return res
	elif (jenis == "SEPEREMPATKIRIATAS"):
		#res.append(Vector2(xp + x, yp + y))
		#res.append(Vector2(xp - x, yp + y))
		#res.append(Vector2(xp + x, yp - y))
		res.append(Vector2(xp - x, yp - y))
		return res
	elif (jenis == "SETENGAHATAS"):
		#res.append(Vector2(xp + x, yp + y))
		#res.append(Vector2(xp - x, yp + y))
		res.append(Vector2(xp + x, yp - y))
		res.append(Vector2(xp - x, yp - y))
		return res
	elif (jenis == "SETENGAHBAWAH"):
		res.append(Vector2(xp + x, yp + y))
		res.append(Vector2(xp - x, yp + y))
		#res.append(Vector2(xp + x, yp - y))
		#res.append(Vector2(xp - x, yp - y))
		return res
	elif (jenis == "SETENGAHKANAN"):
		res.append(Vector2(xp + x, yp + y))
		#res.append(Vector2(xp - x, yp + y))
		res.append(Vector2(xp + x, yp - y))
		#res.append(Vector2(xp - x, yp - y))
		return res
	elif (jenis == "SETENGAHKIRI"):
		#res.append(Vector2(xp + x, yp + y))
		res.append(Vector2(xp - x, yp + y))
		#res.append(Vector2(xp + x, yp - y))
		res.append(Vector2(xp - x, yp - y))
		return res
	
func ellipseModifikasi(xp, yp, Rx, Ry, jenis):
	var Rx2 = Rx*Rx
	var Ry2 = Ry*Ry
	var twoRx2 = 2*Rx2
	var twoRy2 = 2*Ry2
	var p 
	var x = 0
	var y = Ry
	var px = 0
	var py = twoRx2 * y
	var res = PoolVector2Array()

	res.append_array(_ellipse_plotModifikasi(xp, yp, x, y, jenis))

	# Region 1
	p = round(Ry2 - (Rx2 * Ry) + (0.25 * Rx2))
	while (px < py):
		x += 1
		px += twoRy2
		if (p < 0):
			p += Ry2 + px
		else:
			y -= 1
			py -= twoRx2
			p += Ry2 + px - py
		res.append_array(_ellipse_plotModifikasi(xp, yp, x, y, jenis))
		
	# Region 2
	p = round(Ry2 * (x+0.5) * (x+0.5) + Rx2 * (y-1) * (y-1) - Rx2 * Ry2)
	while (y > 0):
		y -= 1
		py -= twoRx2
		if (p > 0):
			p += Rx2 - py
		else:
			x += 1
			px += twoRy2
			p += Rx2 - py + px
		res.append_array(_ellipse_plotModifikasi(xp, yp, x, y, jenis))
	return res
	
func _ellipse_plot(xp, yp, x, y):
	var res = PoolVector2Array()
	
	res.append(Vector2(xp + x, yp + y))
	res.append(Vector2(xp - x, yp + y))
	res.append(Vector2(xp + x, yp - y))
	res.append(Vector2(xp - x, yp - y))
	
	return res

func ellipse(xp, yp, Rx, Ry):
	var Rx2 = Rx*Rx
	var Ry2 = Ry*Ry
	var twoRx2 = 2*Rx2
	var twoRy2 = 2*Ry2
	var p 
	var x = 0
	var y = Ry
	var px = 0
	var py = twoRx2 * y
	var res = PoolVector2Array()

	res.append_array(_ellipse_plot(xp, yp, x, y))

	# Region 1
	p = round(Ry2 - (Rx2 * Ry) + (0.25 * Rx2))
	while (px < py):
		x += 1
		px += twoRy2
		if (p < 0):
			p += Ry2 + px
		else:
			y -= 1
			py -= twoRx2
			p += Ry2 + px - py
		res.append_array(_ellipse_plot(xp, yp, x, y))
		
	# Region 2
	p = round(Ry2 * (x+0.5) * (x+0.5) + Rx2 * (y-1) * (y-1) - Rx2 * Ry2)
	while (y > 0):
		y -= 1
		py -= twoRx2
		if (p > 0):
			p += Rx2 - py
		else:
			x += 1
			px += twoRy2
			p += Rx2 - py + px
		res.append_array(_ellipse_plot(xp, yp, x, y))
	return res

func ellipse_rotated(xp, yp, Rx, Ry, angle):
	var Rx2 = Rx*Rx
	var Ry2 = Ry*Ry
	var twoRx2 = 2*Rx2
	var twoRy2 = 2*Ry2
	var p 
	var x = 0
	var y = Ry
	var px = 0
	var py = twoRx2 * y
	var res = PoolVector2Array()

	res.append_array(_ellipse_plot_rotated(xp, yp, x, y, angle))

	# Region 1
	p = round(Ry2 - (Rx2 * Ry) + (0.25 * Rx2))
	while (px < py):
		x += 1
		px += twoRy2
		if (p < 0):
			p += Ry2 + px
		else:
			y -= 1
			py -= twoRx2
			p += Ry2 + px - py
		res.append_array(_ellipse_plot_rotated(xp, yp, x, y, angle))
		
	# Region 2
	p = round(Ry2 * (x+0.5) * (x+0.5) + Rx2 * (y-1) * (y-1) - Rx2 * Ry2)
	while (y > 0):
		y -= 1
		py -= twoRx2
		if (p > 0):
			p += Rx2 - py
		else:
			x += 1
			px += twoRy2
			p += Rx2 - py + px
		res.append_array(_ellipse_plot_rotated(xp, yp, x, y, angle))
	return res

func _ellipse_plot_rotated(xp, yp, x, y, angle):
	var res = PoolVector2Array()
	
	var c = cos(deg2rad(angle))
	var s = sin(deg2rad(angle))
	var xr = x * c - y * s
	var yr = x * s + y * c
	var xr2 = x * c + y * s
	var yr2 = x * s - y * c
	
	res.append(Vector2(xp - xr, yp - yr))
	res.append(Vector2(xp + xr, yp + yr))
	res.append(Vector2(xp - xr2, yp - yr2))
	res.append(Vector2(xp + xr2, yp + yr2))
	
	return res

################################################################################
func segitiga_samasisiterbalik(xa, ya, s, margin_left, margin_top):
	var res = PoolVector2Array()
	# Tengah Bawah ke Kiri Bawah (Sisi Bawah)
	var px = convert_to_pixel(xa+(s/2), ya, xa, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Tengah Bawah ke Kanan Bawah (Sisi Bawah)
	px = convert_to_pixel(xa-(s/2), ya, xa, ya, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kanan Bawah ke Tengah Atas
	px = convert_to_pixel(xa+(s/2), ya, xa, ya-s, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	# Kiri Bawah ke Tengah Atas
	px = convert_to_pixel(xa-(s/2), ya, xa, ya-s, margin_left, margin_top)
	res.append_array(lineDDA(px[0], px[1], px[2], px[3]))
	
	return res

# Operasi Matrix

var theMatrix=[[0,0,0],[0,0,0],[0,0,0]]
			
func matrix3x3Add(Ma, Mb):
	for r in range(3):
		for c in range(3):
			Mb[r][c] += Ma[r][c]

func matrix3x3Sub(Ma, Mb):
	for r in range(3):
		for c in range(3):
			Mb[r][c] -= Ma[r][c]

func matrix3x3PreMultiply(Ma, Mb):
	var Mtemp=[[0,0,0],[0,0,0],[0,0,0]]
	
	for r in range(3):
		for c in range(3):
			Mtemp[r][c] = Ma[r][0]*Mb[0][c] + Ma[r][1]*Mb[1][c] + Ma[r][2]*Mb[2][c]
			
	for r in range(3):
		for c in range(3):
			Mb[r][c] = Mtemp[r][c]

func matrix3x3SetIdentity(m):
	for i in range(3):
		for j in range(3):
			if(i==j):
				m[i][j] = 1
			else:
				m[i][j] = 0

# Transformasi

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


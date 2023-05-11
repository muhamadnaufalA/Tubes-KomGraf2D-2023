extends "primitif2.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func persegi(titik_awal: Vector2, panjang_sisi, warna_garis, tipe_garis):
	linesDDA(titik_awal.x, titik_awal.y, titik_awal.x + panjang_sisi, titik_awal.y, warna_garis , tipe_garis) #sisi atas
	linesDDA(titik_awal.x, titik_awal.y + panjang_sisi, titik_awal.x + panjang_sisi, titik_awal.y + panjang_sisi, warna_garis , tipe_garis) #sisi bawah
	linesDDA(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + panjang_sisi, warna_garis , tipe_garis) #sisi kiri
	linesDDA(titik_awal.x + panjang_sisi, titik_awal.y, titik_awal.x + panjang_sisi, titik_awal.y + panjang_sisi, warna_garis , tipe_garis) #sisi kanan
	
func persegi_panjang(titik_awal : Vector2, panjang, lebar, warna_garis, tipe_garis):
	linesDDA(titik_awal.x, titik_awal.y, titik_awal.x + panjang, titik_awal.y, warna_garis , tipe_garis) #sisi atas
	linesDDA(titik_awal.x, titik_awal.y + lebar, titik_awal.x + panjang, titik_awal.y + lebar, warna_garis , tipe_garis) #sisi bawah
	linesDDA(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + lebar, warna_garis , tipe_garis) #sisi kiri
	linesDDA(titik_awal.x + panjang, titik_awal.y, titik_awal.x + panjang, titik_awal.y + lebar, warna_garis , tipe_garis) #sisi kanan

func segitiga_siku(titik_awal : Vector2, panjang, tinggi, warna_garis, tipe_garis):
	linesDDA(titik_awal.x, titik_awal.y + tinggi, titik_awal.x + panjang, titik_awal.y + tinggi, warna_garis , tipe_garis) #sisi bawah
	linesDDA(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + tinggi, warna_garis , tipe_garis) #sisi kiri
	linesDDA(titik_awal.x, titik_awal.y, titik_awal.x + panjang, titik_awal.y + tinggi, warna_garis , tipe_garis) #sisi miring
	
func trapesium_siku(titik_awal : Vector2, panjang_atas, panjang_bawah, tinggi, warna_garis, tipe_garis):
	linesDDA(titik_awal.x, titik_awal.y, titik_awal.x + panjang_atas, titik_awal.y, warna_garis , tipe_garis) #sisi atas
	linesDDA(titik_awal.x, titik_awal.y + tinggi, titik_awal.x + panjang_bawah, titik_awal.y + tinggi, warna_garis , tipe_garis) #sisi bawah
	linesDDA(titik_awal.x, titik_awal.y, titik_awal.x, titik_awal.y + tinggi, warna_garis , tipe_garis) #sisi kiri
	linesDDA(titik_awal.x + panjang_atas, titik_awal.y, titik_awal.x + panjang_bawah, titik_awal.y + tinggi, warna_garis , tipe_garis) #sisi miring
	
func ketupat(titik_awal: Vector2, panjang_sisi, warna_garis, tipe_garis):
	linesDDA(titik_awal.x + (panjang_sisi/2), titik_awal.y, titik_awal.x, titik_awal.y + (panjang_sisi/2), warna_garis , tipe_garis) #sisi atas kiri
	linesDDA(titik_awal.x + (panjang_sisi/2), titik_awal.y, titik_awal.x + panjang_sisi, titik_awal.y + (panjang_sisi/2), warna_garis , tipe_garis) #sisi atas kanan
	linesDDA(titik_awal.x + (panjang_sisi/2), titik_awal.y + panjang_sisi, titik_awal.x, titik_awal.y + (panjang_sisi/2), warna_garis , tipe_garis) #sisi bawah kiri
	linesDDA(titik_awal.x + (panjang_sisi/2), titik_awal.y + panjang_sisi, titik_awal.x + panjang_sisi, titik_awal.y + (panjang_sisi/2), warna_garis , tipe_garis) #sisi bawah kanan
	
func jajaran_genjang(titik_awal : Vector2, alas, tinggi, warna_garis, tipe_garis):
	linesDDA(titik_awal.x, titik_awal.y, titik_awal.x + alas, titik_awal.y, warna_garis , tipe_garis) #sisi atas
	#alas yang berukuran kecil (atau alas yang dipotong dengan tinggi) dianggap 1/3 dari total alas
	var alaskecil = alas/3
	linesDDA(titik_awal.x, titik_awal.y, titik_awal.x + alaskecil, titik_awal.y + tinggi, warna_garis , tipe_garis) #sisi miring kiri
	linesDDA(titik_awal.x + alas, titik_awal.y, titik_awal.x + alas + alaskecil, titik_awal.y + tinggi, warna_garis , tipe_garis) #sisi miring kanan
	linesDDA(titik_awal.x + alaskecil, titik_awal.y + tinggi, titik_awal.x + alas + alaskecil, titik_awal.y + tinggi, warna_garis , tipe_garis) #sisi bawah
	
func layang_layang(titik_awal : Vector2, diagonal : Vector2, warna_garis, tipe_garis):
	#diagonal.y terpendek = 1/4 dari total diagolnal.y
	#diagonal.y terpanjang = 3/4 dari total diagolnal.y
	linesDDA(titik_awal.x, titik_awal.y + diagonal.y/4, titik_awal.x + diagonal.x/2, titik_awal.y, warna_garis , tipe_garis) #sisi atas kiri
	linesDDA(titik_awal.x + diagonal.x, titik_awal.y + diagonal.y/4, titik_awal.x + diagonal.x/2, titik_awal.y, warna_garis , tipe_garis) #sisi atas kanan
	linesDDA(titik_awal.x, titik_awal.y + diagonal.y/4, titik_awal.x + diagonal.x/2, titik_awal.y + diagonal.y, warna_garis , tipe_garis) #sisi bawah kiri
	linesDDA(titik_awal.x + diagonal.x, titik_awal.y + diagonal.y/4, titik_awal.x + diagonal.x/2, titik_awal.y + diagonal.y, warna_garis , tipe_garis) #sisi bawah kanan
	
func lingkaran(Center : Vector2, radius: int, warna_garis):
	var x = 0
	var y = radius
	var p = 1 - radius
	
	circlePlotPoints(Vector2(Center.x, Center.y), x, y, warna_garis)
	
	while(x < y):
		x += 1
		if (p < 0):
			p += 2 * x + 1
		else:
			y -= 1
			p += 2 * (x-y) + 1
		circlePlotPoints(Vector2(Center.x, Center.y), x, y, warna_garis)
	
func circlePlotPoints(Center : Vector2, x: int, y: int, warna_garis):
	put_pixel(Center.x + x, Center.y + y, warna_garis)
	put_pixel(Center.x - x, Center.y + y, warna_garis)
	put_pixel(Center.x + x, Center.y - y, warna_garis)
	put_pixel(Center.x - x, Center.y - y, warna_garis)
	put_pixel(Center.x + y, Center.y + x, warna_garis)
	put_pixel(Center.x - y, Center.y + x, warna_garis)
	put_pixel(Center.x + y, Center.y - x, warna_garis)
	put_pixel(Center.x - y, Center.y - x, warna_garis)
	
func ellips(Center : Vector2, Rx: int, Ry: int):
	var res = PoolVector2Array()
	var Rx2 = pow(Rx, 2)
	var Ry2 = pow(Ry, 2)
	var twoRx2 = 2*Rx2
	var twoRy2 = 2*Ry2
	var p
	var x = 0
	var y = Ry
	var px = 0
	var py = twoRx2 * y
	
	res = ellipsePlotPoints(Vector2(Center.x, Center.y), x, y)
	
	p = round(Ry2 - (Rx2 * Ry) + (0.25 * Rx2))
	while(px < py):
		x += 1
		px += twoRy2
		if(p < 0):
			p += Ry2 + px
		else:
			y -= 1
			py -= twoRx2
			p += Ry2 + px - py
			
		res.append_array(ellipsePlotPoints(Vector2(Center.x, Center.y), x, y))
	
	p = round(Ry2*pow(x+0.5, 2) + Rx2*pow(y-1, 2) - Rx2*Ry2)
	while(y > 0):
		y -= 1
		py -= twoRx2
		if (p > 0):
			p += Rx2 - py
		else:
			x += 1
			px += twoRy2
			p += Rx2 - py + px
			
		res.append_array(ellipsePlotPoints(Vector2(Center.x, Center.y), x, y))
	return res
	

func ellipsePlotPoints(Center : Vector2, x: int, y: int):
	var res = PoolVector2Array()
	res.append(Vector2(Center.x + x, Center.y + y))
	res.append(Vector2(Center.x - x, Center.y + y))
	res.append(Vector2(Center.x + x, Center.y - y))
	res.append(Vector2(Center.x - x, Center.y - y))
	res.append(Vector2(Center.x - x, Center.y - y))
	return res

func segi_lima(Center: Vector2, radius, warna_garis, tipe_garis):
	var points = PoolVector2Array()
	points.insert(0, Vector2(Center.x, Center.y - radius))
	
	for i in range(1, 5):
		var pt = PoolVector2Array()
		pt.insert(0, points[i-1])
		
		matrix3x3SetIdentity(theMatrix)
		rotate2(72, Center)
		pt = transformPoints2(1, pt)
		points.insert(i, pt[0])
	
	for i in range (1, 5):
		linesDDA(points[i-1].x, points[i-1].y, points[i].x, points[i].y, warna_garis, tipe_garis)
	linesDDA(points[4].x, points[4].y, points[0].x, points[0].y, warna_garis, tipe_garis)
	
func segi_enam(Center: Vector2, radius, warna_garis, tipe_garis):
	var points = PoolVector2Array()
	points.insert(0, Vector2(Center.x, Center.y - radius))
	
	for i in range(1, 6):
		var pt = PoolVector2Array()
		pt.insert(0, points[i-1])
		
		matrix3x3SetIdentity(theMatrix)
		rotate2(60, Center)
		pt = transformPoints2(1, pt)
		points.insert(i, pt[0])
	
	for i in range (1, 6):
		linesDDA(points[i-1].x, points[i-1].y, points[i].x, points[i].y, warna_garis, tipe_garis)
	linesDDA(points[5].x, points[5].y, points[0].x, points[0].y, warna_garis, tipe_garis)
	linesDDA(points[5].x, points[5].y, points[0].x, points[0].y, warna_garis, tipe_garis)

extends "primitif2.gd"

var Primitif = primitif.new()
var Dasar = dasar.new()

var screen_width = OS.window_size.x 
var screen_height = OS.window_size.y

const margin_left = 50
const margin_top  = 50
var margin_right = screen_width - margin_left
var margin_bottom = screen_height - margin_top

################################################################################
# Matahari
func _on_Matahari_draw():
	var matahari = draw_circle(Vector2(0,0),100,Color.yellow)
	var res = PoolVector2Array()
	var segitiga = PoolVector2Array()
	
	segitiga = Dasar.segitiga_samasisi(90, 500, 50, 50, 50)
	matrix3x3SetIdentity(theMatrix)
	rotate2(90, Vector2(0,0))
	translate2(170,-140)
	segitiga = transformPoints2(segitiga.size(),segitiga)
	res.append_array(segitiga)
	put_pixel_all(segitiga,Color.yellow)
	
	for i in range (11):
		matrix3x3SetIdentity(theMatrix)
		rotate2(30, Vector2(0, 0))
		segitiga = transformPoints2(segitiga.size(),segitiga)
		res.append_array(segitiga)
		put_pixel_all(Primitif.line_style(res, 1, 0),Color.yellow)
	
	return res

################################################################################
# Awan
func _on_Awan_draw():
	#Awan1
	var garisBawahAwan = PoolVector2Array()
	garisBawahAwan.append_array(lineDDA(200,200,270,200))
	put_pixel_all(garisBawahAwan,Color.blue)
	
	var LingkaransetengahKanan = Dasar.circleModifikasi(270,185,15,"SETENGAHKANAN")
	put_pixel_all(LingkaransetengahKanan,Color.blue)
	var LingkaransetengahKiri = Dasar.circleModifikasi(200,185,15, "SETENGAHKIRI")
	put_pixel_all(LingkaransetengahKiri,Color.blue)
	
	var ElipseSeperempatKananAtas = Dasar.ellipseModifikasi(250,170,18,18,"SEPEREMPATKANANATAS")
	put_pixel_all(ElipseSeperempatKananAtas,Color.blue)
	var ElipseSeperempatKiriAtas = Dasar.ellipseModifikasi(220,170,18,18,"SEPEREMPATKIRIATAS")
	put_pixel_all(ElipseSeperempatKiriAtas,Color.blue)
	var ElipseSetengahAtas = Dasar.ellipseModifikasi(235,150,15,8,"SETENGAHATAS")
	put_pixel_all(ElipseSetengahAtas,Color.blue)
	
	#Awan2
	var garisBawahAwan2 = PoolVector2Array()
	garisBawahAwan2.append_array(lineDDA(755,200,895,200))
	put_pixel_all(garisBawahAwan2,Color("#808080"))
	
	var LingkaransetengahKanan2 = Dasar.circleModifikasi(890,170,30,"SETENGAHKANAN")
	put_pixel_all(LingkaransetengahKanan2,Color("#808080"))
	var LingkaransetengahKiri2 = Dasar.circleModifikasi(755,170,30, "SETENGAHKIRI")
	put_pixel_all(LingkaransetengahKiri2,Color("#808080"))
	
	var ElipseSeperempatKananAtas2 = Dasar.ellipseModifikasi(855,140,36,36,"SEPEREMPATKANANATAS")
	put_pixel_all(ElipseSeperempatKananAtas2,Color("#808080"))
	var ElipseSeperempatKiriAtas2 = Dasar.ellipseModifikasi(790,140,36,36,"SEPEREMPATKIRIATAS")
	put_pixel_all(ElipseSeperempatKiriAtas2,Color("#808080"))
	var ElipseSetengahAtas2 = Dasar.ellipseModifikasi(822,105,33,20,"SETENGAHATAS")
	put_pixel_all(ElipseSetengahAtas2,Color("#808080"))

################################################################################
# Uap
func _on_Uap_draw():
	#uap1
	var ElipseSetengahKanan1 = Dasar.ellipseModifikasi(240,400,5,15,"SETENGAHKANAN")
	put_pixel_all(ElipseSetengahKanan1,Color("#808080"))
	var ElipseSetengahKiri1 = Dasar.ellipseModifikasi(240,370,5,15,"SETENGAHKIRI")
	put_pixel_all( ElipseSetengahKiri1,Color("#808080"))
	
	#uap2
	var ElipseSetengahKanan2 = Dasar.ellipseModifikasi(260,400,5,15,"SETENGAHKANAN")
	put_pixel_all(ElipseSetengahKanan2,Color("#808080"))
	var ElipseSetengahKiri2 = Dasar.ellipseModifikasi(260,370,5,15,"SETENGAHKIRI")
	put_pixel_all( ElipseSetengahKiri2,Color("#808080"))
	
	#uap3
	var ElipseSetengahKanan3 = Dasar.ellipseModifikasi(220,400,5,15,"SETENGAHKANAN")
	put_pixel_all(ElipseSetengahKanan3,Color("#808080"))
	var ElipseSetengahKiri3 = Dasar.ellipseModifikasi(220,370,5,15,"SETENGAHKIRI")
	put_pixel_all( ElipseSetengahKiri3,Color("#808080"))

################################################################################
# Hujan
func _on_Hujan_draw():
	var x = 765
	var y = 200
	var yb = 220
	var hujanPool = PoolVector2Array()
	
	for i in range (3):
		x = 765
		y += 30
		yb += 30
		for j in range (3):
			x += 10
			y = y
			yb = yb
			for k in range (3):
				hujanPool.append_array(lineDDA(x,y,x,yb))
				put_pixel_all(hujanPool,Color("#0000FF"))
				x += 10
	return hujanPool

################################################################################
# Perahu
func _on_Perahu_draw():
	var perahu = Dasar.trapesium_siku(800,50,150,50, margin_left, margin_top)
	var res = PoolVector2Array()
	matrix3x3SetIdentity(theMatrix)
	rotate2(180, Vector2(0,0))
	translate2(1800,1000)
	perahu = transformPoints2(perahu.size(),perahu)
	res.append_array(perahu)
	put_pixel_all(perahu,Color("#FF0000"))
	
	perahu = Dasar.persegi_panjang(840, 50, 30, 50, margin_left, margin_top)
	put_pixel_all(perahu,Color("#FF0000"))
	
	perahu = Dasar.persegi_panjang(850, 65, 5, 5, margin_left, margin_top)
	put_pixel_all(perahu,Color("#FF0000"))
	
	
################################################################################
# Burung
func _on_Burung_draw():
	var burung = PoolVector2Array()
	var res = PoolVector2Array()
	
	burung.append_array(lineDDA(300,50,330,50))
	res.append_array(burung)
	put_pixel_all(burung, Color.black)
	
	burung = Dasar.ellipseModifikasi(330,50,15,15,"SETENGAHATAS")
	res.append_array(burung)
	put_pixel_all(burung, Color.black)
	
	burung = Dasar.ellipseModifikasi(300,50,15,15,"SETENGAHATAS")
	res.append_array(burung)
	put_pixel_all(burung, Color.black)
	

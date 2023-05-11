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
onready var scalingCloudInc = 1
onready var rotateSunInc = 0
onready var speed_perahu_X = 250
onready var speed_perahu_Y = 0
onready var speed_uap_Y = 0
onready var speed_cloud_X = 0
onready var speed_hujan_Y = 0
onready var speed_burung_X = 0
onready var speed_burung_Y = 0
onready var burung = 0

onready var booleanPerahu = true
onready var booleanMatahari = true


onready var speed = 1
################################################################################

func _process(delta):
	if (burung <= 50):
		speed_burung_X += 5 * speed
		speed_burung_Y += 5 * speed
		burung += 5 * speed
	elif (burung >= 50 and burung <= 150):
		speed_burung_X -= 5 * speed
		burung += 5 * speed
	elif (burung >= 150 and burung <= 200):
		speed_burung_X += 5 * speed
		speed_burung_Y -= 5 * speed
		burung += 5 * speed
	else:
		speed_burung_X = 0
		speed_burung_Y = 0
		burung = 0
	
	### Animation Process Gerak Matahari ###
	
	#Process sinar matahari berotasi secara CW dan CCW (Challenge)
	if (rotateSunInc < 60 and booleanMatahari == true):
		rotateSunInc += 1 * speed
	if (rotateSunInc >= 60):
		booleanMatahari = false
	if (booleanMatahari == false):
		rotateSunInc -= 1 * speed
		if (rotateSunInc <= 0):
			booleanMatahari = true
	### Animation Process Gerak Perahu ###
	
	#Process Gerak Perahu ZigZag (Challenge)
	speed_perahu_X -= 2 * speed
	if (speed_perahu_Y < 30 and booleanPerahu == true):
		speed_perahu_Y += 2 * speed
	if (speed_perahu_Y >= 30):
		booleanPerahu = false
	if (booleanPerahu == false):
		speed_perahu_Y -= 2 * speed
		if (speed_perahu_Y <= 0):
			booleanPerahu = true
	
	#### Code untuk kembali ke awal	###
	if (speed_perahu_X < -1000):
		speed_perahu_X = 250
		speed_perahu_Y = 0
		booleanPerahu = true
		AnimationPerahu(speed_perahu_X,speed_perahu_Y)
	
	#Animation Process ketika uap naik
	if (speed_uap_Y >= -140):
		speed_uap_Y -= 3 * speed
		
	#Animation Process ketika awan membesar dan mengecil
	if (scalingCloudInc < 2 and speed_uap_Y < -140 and speed_hujan_Y == 0):
		scalingCloudInc += 0.01 * speed
	elif (speed_hujan_Y > 0 and scalingCloudInc > 1):
		scalingCloudInc -= 0.01 * speed

	#Animation process untuk mengulang dari awal
	if (speed_cloud_X > 850):
		speed_cloud_X = -300
		scalingCloudInc = 1
		speed_uap_Y = 300
		speed_hujan_Y = 0
		AnimationCloud(scalingCloudInc,speed_cloud_X)
	
	if (speed_cloud_X < 0):
		speed_cloud_X += 2 * speed
	elif (speed_cloud_X == 0):
		speed_cloud_X = 0
		AnimationUap(speed_uap_Y)
	
	#Animation process untuk menggerakan awan
	if (scalingCloudInc >= 2):
		if (speed_cloud_X < 500): 
			speed_cloud_X += 2 * speed
	
	#Animation Process ketika hujan
	if (speed_cloud_X >= 500):
		speed_hujan_Y += 9 * speed
	if (speed_hujan_Y > 400 and scalingCloudInc > 1):
		speed_hujan_Y = 0
		AnimationHujan(speed_hujan_Y)
	elif (speed_hujan_Y >= 500 and scalingCloudInc <= 1):
		speed_cloud_X += 2 * speed
		
	# Update
	update()

# Main Function
func _on_Core_draw():
	AnimationMatahari(rotateSunInc)
	AnimationPerahu(speed_perahu_X,speed_perahu_Y)
	AnimationCloud(scalingCloudInc,speed_cloud_X)
	AnimationUap(speed_uap_Y)
	AnimationHujan(speed_hujan_Y)
	AnimationBurung(speed_burung_X,speed_burung_Y)

################################################################################
# Hujan
func _on_Hujan_draw(): #BluePrint
	var x = 690
	var y = 180
	var yb = 200
	var hujanPool = PoolVector2Array()
	
	for i in range (3):
		x = 690
		y += 30
		yb += 30
		for j in range (3):
			x += 10
			y = y
			yb = yb
			for k in range (3):
				hujanPool.append_array(lineDDA(x,y,x,yb))
				x += 10
	return hujanPool

func AnimationHujan(speed_hujan_Y): #Animation
	var hujan = PoolVector2Array()
	
	hujan = _on_Hujan_draw()
	
	if (speed_hujan_Y == 0):
		hujan = [[0,0],[0,0]]
		put_pixel_all(hujan,Color("#0000FF"))
	else :
		matrix3x3SetIdentity(theMatrix)
		translate2(0,speed_hujan_Y)
		hujan = transformPoints2(hujan.size(), hujan)
		put_pixel_all(hujan,Color("#0000FF"))
	
################################################################################
# Uap
func _on_Uap_draw(): #BluePrint
	var res = PoolVector2Array()
	#uap1
	var ElipseSetengahKanan1 = Dasar.ellipseModifikasi(240,400,5,15,"SETENGAHKANAN")
	res.append_array(ElipseSetengahKanan1)
	var ElipseSetengahKiri1 = Dasar.ellipseModifikasi(240,370,5,15,"SETENGAHKIRI")
	res.append_array(ElipseSetengahKiri1)
	
	#uap2
	var ElipseSetengahKanan2 = Dasar.ellipseModifikasi(260,400,5,15,"SETENGAHKANAN")
	res.append_array(ElipseSetengahKanan2)
	var ElipseSetengahKiri2 = Dasar.ellipseModifikasi(260,370,5,15,"SETENGAHKIRI")
	res.append_array(ElipseSetengahKiri2)
	
	#uap3
	var ElipseSetengahKanan3 = Dasar.ellipseModifikasi(220,400,5,15,"SETENGAHKANAN")
	res.append_array(ElipseSetengahKanan3)
	var ElipseSetengahKiri3 = Dasar.ellipseModifikasi(220,370,5,15,"SETENGAHKIRI")
	res.append_array(ElipseSetengahKiri3)
	return res

func AnimationUap(speed_uap_Y): #Animation
	var uap = PoolVector2Array()
	
	uap = _on_Uap_draw()
	
	if (speed_uap_Y <= -140):
		uap = [[0,0],[0,0]]
		put_pixel_all(uap,Color.gray)
	else :
		matrix3x3SetIdentity(theMatrix)
		translate2(0,speed_uap_Y)
		uap = transformPoints2(uap.size(), uap)
		put_pixel_all(uap,Color("6B728E"))
	
################################################################################
# Awan
func _on_Awan_draw(koordinat: Vector2,size): #BluePrint
	var awan = PoolVector2Array()
	var res = PoolVector2Array()
	
	awan.append_array(lineDDA(koordinat.x,koordinat.y,koordinat.x+70,koordinat.y))
	res.append_array(awan)
	
	awan = Dasar.circleModifikasi(koordinat.x+70,koordinat.y-size,size,"SETENGAHKANAN")
	res.append_array(awan)
	awan = Dasar.circleModifikasi(koordinat.x,koordinat.y-size,size, "SETENGAHKIRI")
	res.append_array(awan)
	
	awan = Dasar.ellipseModifikasi(koordinat.x+50,koordinat.y-30,size+3,size+3,"SEPEREMPATKANANATAS")
	res.append_array(awan)
	awan = Dasar.ellipseModifikasi(koordinat.x+20,koordinat.y-30,size+3,size+3,"SEPEREMPATKIRIATAS")
	res.append_array(awan)
	awan = Dasar.ellipseModifikasi(koordinat.x+35,koordinat.y-50,size,size-7,"SETENGAHATAS")
	res.append_array(awan)

	return res

func AnimationCloud(scalingCloudInc,speed_cloud_X): #Animation
	var awan = PoolVector2Array()
	var koordinat = [[200],[200]]
	var size = 15
	
	awan = _on_Awan_draw(Vector2(koordinat[0][0],koordinat[1][0]),size)	
	
	matrix3x3SetIdentity(theMatrix)
	scale2(scalingCloudInc, scalingCloudInc, Vector2(225,200))
	awan  = transformPoints2(awan.size(), awan)
	matrix3x3SetIdentity(theMatrix)
	translate2(speed_cloud_X,0)
	awan = transformPoints2(awan.size(), awan)
	
	if (speed_cloud_X == 500 and scalingCloudInc > 1):
		put_pixel_all(awan,Color("413543")) 
	else:
		put_pixel_all(awan,Color.blue)

################################################################################
# Perahu 		
func _on_Perahu_draw(): #BluePrint
	var perahu = Dasar.trapesium_siku(800,50,150,50, margin_left, margin_top)
	var res = PoolVector2Array()
	matrix3x3SetIdentity(theMatrix)
	rotate2(180, Vector2(0,0))
	translate2(1800,1000)
	perahu = transformPoints2(perahu.size(),perahu)
	res.append_array(perahu)
	
	perahu = Dasar.persegi_panjang(840, 50, 30, 50, margin_left, margin_top)
	res.append_array(perahu)
	
	perahu = Dasar.persegi_panjang(850, 65, 5, 5, margin_left, margin_top)
	res.append_array(perahu)
	
	return res

func AnimationPerahu(speed_perahu_X,speed_perahu_Y): #Animation
	var perahu = PoolVector2Array()
	
	perahu = _on_Perahu_draw()
	
	matrix3x3SetIdentity(theMatrix)
	translate2(speed_perahu_X,speed_perahu_Y)
	perahu = transformPoints2(perahu.size(), perahu)
	put_pixel_all(perahu,Color.red)

################################################################################
# Matahari 
func _on_matahari_draw(): #BluePrint
	var matahari = draw_circle(Vector2(0,0),100,Color.yellow)
	var res = PoolVector2Array()
	var segitiga = PoolVector2Array()
	
	segitiga = Dasar.segitiga_samasisi(90, 500, 50, 50, 50)
	matrix3x3SetIdentity(theMatrix)
	rotate2(90, Vector2(0,0))
	translate2(170,-140)
	segitiga = transformPoints2(segitiga.size(),segitiga)
	res.append_array(segitiga)
	
	for i in range (11):
		matrix3x3SetIdentity(theMatrix)
		rotate2(30, Vector2(0, 0))
		segitiga = transformPoints2(segitiga.size(),segitiga)
		res.append_array(segitiga)
	
	return res

func AnimationMatahari(rotateSunInc): #Animation
		var matahari = PoolVector2Array()
		
		matahari = _on_matahari_draw()
		matrix3x3SetIdentity(theMatrix)
		rotate2(rotateSunInc,Vector2(0,0))
		matahari = transformPoints2(matahari.size(), matahari)
		put_pixel_all(matahari,Color.orange)

################################################################################
# Burung
func _on_burung_draw(): #BluePrint
	var burung = PoolVector2Array()
	var res = PoolVector2Array()
	
	burung.append_array(lineDDA(300,50,330,50))
	res.append_array(burung)
	#put_pixel_all(burung, Color.black)
	
	burung = Dasar.ellipseModifikasi(330,50,15,15,"SETENGAHATAS")
	res.append_array(burung)
	#put_pixel_all(burung, Color.black)
	
	burung = Dasar.ellipseModifikasi(300,50,15,15,"SETENGAHATAS")
	res.append_array(burung)
	#put_pixel_all(burung, Color.black)
	
	return res

func AnimationBurung(speed_burung_X,speed_burung_Y): #Animation
	var burung = PoolVector2Array()
	
	burung = _on_burung_draw()
	matrix3x3SetIdentity(theMatrix)
	translate2(speed_burung_X,speed_burung_Y)
	burung = transformPoints2(burung.size(), burung)
	put_pixel_all(burung,Color.black)

func _input(event):
	if event.is_action_pressed("ui_up"):
		if (speed <= 5):
			speed += 1
	
	elif event.is_action_pressed("ui_down"):
		if (speed > 1):
			speed += -1







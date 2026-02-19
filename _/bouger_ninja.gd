extends Node

@export var nes_francais:FrancaisFacadeNesToUdp

@export var address_ip:String = "127.0.0.1"
@export var address_port:String = "7073"
@export var address_player:String = "1"
@export var key_up :=KeyboardControllerToInt.KeyboardCommandInt.Up

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
func level_one():
	#while true:
		redemarrer_le_niveau()
		await  wait(1)
		bouger_deux_seconds_a_droite()
		shuriken()
		await  wait(1)
		double_saut_long()
		bouger_deux_segond_a_gauche()
		bouger_a_droit()
		cout()
		
		
		
	
func wait(seconds:float):
	await get_tree().create_timer(seconds).timeout
	
func bouger_deux_seconds_a_droite():
	nes_francais.clavier_appuyer_sur_une_touche( KeyboardControllerToInt.KeyboardCommandInt.Right)
	await wait(0.4)
	nes_francais.clavier_relacher_une_touche( KeyboardControllerToInt.KeyboardCommandInt.Right)


func redemarrer_le_niveau():
	nes_francais.clavier_appuyer_sur_une_touche(KeyboardControllerToInt.KeyboardCommandInt.R)
	await get_tree().create_timer(2.0).timeout
	nes_francais.clavier_relacher_une_touche(KeyboardControllerToInt.KeyboardCommandInt.R)

func double_saut_leger():
	double_saut()

func double_saut_long():
	double_saut()


func double_saut():
	
	nes_francais.clavier_appuyer_sur_une_touche(key_up)
	await wait(0.1)
	nes_francais.clavier_relacher_une_touche(key_up)
	await wait(0.1)
	nes_francais.clavier_appuyer_sur_une_touche(key_up)
	await wait(0.1)
	nes_francais.clavier_relacher_une_touche(key_up)
	

func shuriken():
	nes_francais.clavier_appuyer_sur_une_touche(KeyboardControllerToInt.KeyboardCommandInt.Z)
	await wait(0.1)
	nes_francais.clavier_relacher_une_touche(KeyboardControllerToInt.KeyboardCommandInt.Z)


func bouger_deux_segond_a_gauche():
	nes_francais.clavier_appuyer_sur_une_touche(KeyboardControllerToInt.KeyboardCommandInt.Left)
	await wait(0.4)
	nes_francais.clavier_relacher_une_touche(KeyboardControllerToInt.KeyboardCommandInt.Left)
	
	
func bouger_a_droit():
	nes_francais.clavier_appuyer_sur_une_touche(KeyboardControllerToInt.KeyboardCommandInt.Right)
	await wait(0.3)
	nes_francais.clavier_relacher_une_touche(KeyboardControllerToInt.KeyboardCommandInt.Right)


func shuriken_2():
	nes_francais.clavier_appuyer_sur_une_touche(KeyboardControllerToInt.KeyboardCommandInt.Z)
	await wait(0.1)
	nes_francais.clavier_relacher_une_touche(KeyboardControllerToInt.KeyboardCommandInt.Z)


func cout():
	nes_francais.clavier_appuyer_sur_une_touche(KeyboardControllerToInt.KeyboardCommandInt.X)
	await wait(0.1)
	nes_francais.clavier_relacher_une_touche(KeyboardControllerToInt.KeyboardCommandInt.X)

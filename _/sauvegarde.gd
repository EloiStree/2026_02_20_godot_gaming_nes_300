extends Node

@export var mon_joueur: Node2D

const SAVE_PATH = "user://save_position.cfg"
const SECTION = "Player"
const KEY_POSITION = "position"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	charge_la_position()


func sauver_la_position() -> void:
	if mon_joueur == null:
		print("Erreur : mon_joueur n'est pas assigné !")
		return
	
	var config = ConfigFile.new()
	
	# On récupère la position actuelle
	var pos = mon_joueur.position
	
	# On sauvegarde x et y séparément (plus lisible dans le fichier)
	config.set_value(SECTION, KEY_POSITION + "_x", pos.x)
	config.set_value(SECTION, KEY_POSITION + "_y", pos.y)
	
	# Optionnel : on peut aussi sauvegarder la rotation, l'échelle, etc.
	# config.set_value(SECTION, "rotation", mon_joueur.rotation)
	# config.set_value(SECTION, "scale_x", mon_joueur.scale.x)
	
	var error = config.save(SAVE_PATH)
	if error != OK:
		print("Échec de la sauvegarde - erreur : ", error)
	else:
		print("Position sauvegardée : ", pos)


func charge_la_position() -> void:
	if mon_joueur == null:
		print("Erreur : mon_joueur n'est pas assigné !")
		return
	
	var config = ConfigFile.new()
	var error = config.load(SAVE_PATH)
	
	if error != OK:
		print("Aucune sauvegarde trouvée ou erreur de chargement : ", error)
		# Option : position par défaut si pas de sauvegarde
		mon_joueur.position = Vector2(100, 100)
		return
	
	# On récupère les valeurs si elles existent
	var x = config.get_value(SECTION, KEY_POSITION + "_x", null)
	var y = config.get_value(SECTION, KEY_POSITION + "_y", null)
	
	if x != null and y != null:
		mon_joueur.position = Vector2(x, y)
		print("Position chargée : ", mon_joueur.position)
	else:
		print("Données de position non trouvées dans la sauvegarde")
		mon_joueur.position = Vector2(100, 100)  # fallback

extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/items/item.tscn")


func _ready():
	for container in get_tree().get_nodes_in_group('container'):
		container.connect('opened', _on_container_opened)
	for scout in get_tree().get_nodes_in_group('scouts'):
		scout.connect('laser', _create_laser)


func _on_player_grenade_shot(pos, dir):
	var grenade = grenade_scene.instantiate() as RigidBody2D;
	grenade.position = pos
	grenade.linear_velocity = dir * grenade.speed
	$Projectiles.add_child(grenade)


func _create_laser(pos: Vector2, dir: Vector2):
	var laser = laser_scene.instantiate() as Area2D;
	laser.position = pos
	laser.direction = dir
	laser.rotation = dir.angle()
	$Projectiles.add_child(laser)


func _on_container_opened(pos: Vector2, direction: Vector2):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	$Items.call_deferred('add_child', item)


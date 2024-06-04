extends Node
class_name State

#This is the base node used to pass functions to specific state nodes, it is not used in a scene

signal Transitioned

func state_enter():
	#this will run once when the state is entered
	pass
	
func state_exit():
	#this will run once when the state is exited
	pass
	
func state_process(_delta: float):
	#this will run constantly when the state is active
	pass
	
func state_physics_process(_delta: float):
	#this will run constantly on physics update when the state is active
	pass

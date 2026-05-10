extends Node2D

@onready var stars_far = $StarFieldBack
@onready var stars_mid = $StarFieldMiddle
@onready var stars_close = $StarFieldFront

func _ready():
	get_viewport().size_changed.connect(update_particle_area)
	update_particle_area()

func update_particle_area():
	var screen_size = get_viewport_rect().size
	update_emission_box(stars_far, screen_size)
	update_emission_box(stars_mid, screen_size)
	update_emission_box(stars_close, screen_size)

func update_emission_box(particles, screen_size):
	var particle_material = particles.process_material
	if particle_material is ParticleProcessMaterial:
		particle_material.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
		var extra_width = screen_size.x * 1
		var extra_height = screen_size.y * 1
		particle_material.emission_box_extents = Vector3(
			(screen_size.x + extra_width) / 2,
			(screen_size.y + extra_height) / 2,
			1
		)
	particles.position = screen_size / 2

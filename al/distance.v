module al

import duarteroso.openal.al as openal

// distance_model sets the distance model
pub fn distance_model(model openal.DistanceModel) {
	value := match model {
		.inverse_distance { openal.al_inverse_distance }
		.inverse_distance_clamped { openal.al_inverse_distance_clamped }
		.linear_distance { openal.al_linear_distance }
		.linear_ditance_clamped { openal.al_linear_distance_clamped }
		.exponent_distance { openal.al_exponent_distance }
		.exponent_distance_clamped { openal.al_exponent_distance_clamped }
	}
	C.alDistanceModel(value)
	check_error()
}

// doppler_factor sets the doppler factor
pub fn doppler_factor(value f32) {
	C.alDopplerFactor(value)
	check_error()
}

// speed_sound sets the speed of sound
pub fn speed_sound(value f32) {
	C.alSpeedOfSound(value)
	check_error()
}

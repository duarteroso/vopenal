module al

import duarteroso.vopenal.al as vopenal

// distance_model sets the distance model
pub fn distance_model(model vopenal.DistanceModel) {
	value := match model {
		.inverse_distance { vopenal.al_inverse_distance }
		.inverse_distance_clamped { vopenal.al_inverse_distance_clamped }
		.linear_distance { vopenal.al_linear_distance }
		.linear_ditance_clamped { vopenal.al_linear_distance_clamped }
		.exponent_distance { vopenal.al_exponent_distance }
		.exponent_distance_clamped { vopenal.al_exponent_distance_clamped }
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

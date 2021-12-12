module al

import duarteroso.semver
import duarteroso.vopenal.al as vopenal
import duarteroso.vopenalw.alc

fn test_al_version() {
	sv := version()
	assert sv.major == vopenal.al_major_version
	assert sv.minor == vopenal.al_minor_version
	assert sv.patch == 0
	assert sv.stage == semver.Stage.release
}

fn test_type_getter() {
	test := fn () {
		values := [
			vopenal.al_distance_model,
			vopenal.al_speed_of_sound,
			vopenal.al_doppler_factor,
		]

		for value in values {
			get_boolean(value)
			get_double(value)
			get_float(value)
			get_integer(value)
		}
	}
	//
	alc.do_test(test)
}

fn test_type_getter_vector() {
	test := fn () {
		values := [
			vopenal.al_distance_model,
			vopenal.al_speed_of_sound,
			vopenal.al_doppler_factor,
		]

		for value in values {
			get_booleanv(value)
			get_doublev(value)
			get_floatv(value)
			get_integerv(value)
		}
	}
	//
	alc.do_test(test)
}

fn test_type_string() {
	test := fn () {
		get_string(vopenal.al_version)
	}
	//
	alc.do_test(test)
}

fn test_type_enum() {
	test := fn () {
		get_enum_value('AL_EAX_RAM_SIZE')
	}
	//
	alc.do_test(test)
}

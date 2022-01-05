module test

import duarteroso.semver
import duarteroso.openal.al as openal
import duarteroso.vopenal.al
import duarteroso.vopenal.alc

fn test_al_version() {
	sv := al.version()
	assert sv.major == openal.al_major_version
	assert sv.minor == openal.al_minor_version
	assert sv.patch == 0
	assert sv.stage == semver.Stage.release
}

fn test_type_getter() {
	test := fn () {
		values := [
			openal.al_distance_model,
			openal.al_speed_of_sound,
			openal.al_doppler_factor,
		]

		for value in values {
			al.get_boolean(value)
			al.get_double(value)
			al.get_float(value)
			al.get_integer(value)
		}
	}
	//
	do_test(test)
}

fn test_type_getter_vector() {
	test := fn () {
		values := [
			openal.al_distance_model,
			openal.al_speed_of_sound,
			openal.al_doppler_factor,
		]

		for value in values {
			al.get_booleanv(value)
			al.get_doublev(value)
			al.get_floatv(value)
			al.get_integerv(value)
		}
	}
	//
	do_test(test)
}

fn test_type_string() {
	test := fn () {
		al.get_string(openal.al_version)
	}
	//
	do_test(test)
}

fn test_type_enum() {
	test := fn () {
		al.get_enum_value('AL_EAX_RAM_SIZE')
	}
	//
	do_test(test)
}

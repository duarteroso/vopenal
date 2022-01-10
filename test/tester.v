module test

import duarteroso.openal.alc as openalc
import duarteroso.vopenal.alc

type AnonOptionalF = fn () ?

// do_test is used to test functionality
pub fn do_test(cb AnonOptionalF) {
	$if test {
		concrete_test(cb) or { panic(err) }
	} $else {
		dummy_test()
	}
}

fn dummy_test() {
}

fn concrete_test(cb AnonOptionalF) ? {
	mut device := alc.create_device()
	device.open(openalc.default_device) ?
	//
	mut context := alc.create_context_from_device(device) ?
	context.make_current() ?
	//
	cb() ?
	//
	context.destroy() ?
	device.close() ?
}

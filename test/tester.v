module test

import duarteroso.openal.alc as openalc
import duarteroso.vopenal.alc

// do_test is used to test functionality
pub fn do_test(cb fn ()) {
	$if test {
		concrete_test(cb) or { panic('concrete test failed') }
	} $else {
		dummy_test()
	}
}

fn dummy_test() {
}

fn concrete_test(cb fn ()) ? {
	mut device := alc.create_device()
	device.open(openalc.default_device) ?
	//
	mut context := alc.create_context_from_device(device)
	context.make_current()
	//
	cb()
	//
	context.destroy()
	device.close() ?
}

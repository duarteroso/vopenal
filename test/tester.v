module test

import duarteroso.vopenal.alc as vopenalc
import duarteroso.vopenalw.alc

// do_test is used to test functionality
pub fn do_test(cb fn ()) {
	$if test {
		concrete_test(cb)
	} $else {
		dummy_test()
	}
}

fn dummy_test() {
}

fn concrete_test(cb fn ()) {
	mut device := alc.new_device()
	device.open(vopenalc.default_device)
	defer {
		device.close()
	}
	//
	mut context := alc.new_context_from_device(device)
	defer {
		context.destroy()
	}
	context.make_current()
	//
	cb()
}

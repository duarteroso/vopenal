module test

import duarteroso.vopenal.alc as vopenalc
import duarteroso.vopenalw.alc

fn test_context() {
	mut device := alc.create_device()
	device.open(vopenalc.default_device)
	defer {
		device.close()
	}
	//
	mut context := alc.create_context_from_device(device)
	defer {
		context.destroy()
	}
	mut other_context := alc.create_context_from_device(device)
	defer {
		other_context.destroy()
	}
	//
	assert other_context.make_current()
	assert alc.remove_current_context()
	//
	assert context.make_current()
	//
	_ := alc.get_current_context()
	_ := context.get_device()
	//
	context.process()
	context.suspend()
}

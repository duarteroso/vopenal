module test

import duarteroso.semver
import duarteroso.vopenal.alc as vopenalc
import duarteroso.vopenalw.alc

fn test_alc_version() {
	sv := alc.version()
	assert sv.major == vopenalc.alc_major_version
	assert sv.minor == vopenalc.alc_minor_version
	assert sv.patch == 0
	assert sv.stage == semver.Stage.release
}

fn test_alc() {
	mut device := alc.create_device()
	assert device.open(vopenalc.default_device)
	defer {
		assert device.close()
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
	//
	context.process()
	context.suspend()
	//
	used_device := context.get_device()
	assert device == used_device
}

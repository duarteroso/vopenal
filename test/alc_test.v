module test

import duarteroso.semver
import duarteroso.openal.alc as openalc
import duarteroso.vopenal.alc

fn test_alc_version() {
	sv := alc.version()
	assert sv.major == openalc.alc_major_version
	assert sv.minor == openalc.alc_minor_version
	assert sv.patch == 0
	assert sv.stage == semver.Stage.release
}

fn test_alc() ? {
	mut device := alc.create_device()
	device.open(openalc.default_device) ?
	//
	mut context := alc.create_context_from_device(device)
	mut other_context := alc.create_context_from_device(device)
	//
	assert other_context.make_current()
	assert alc.remove_current_context()
	//
	assert context.make_current()
	other_context.destroy()
	//
	_ := alc.get_current_context()
	//
	context.process()
	context.suspend()
	//
	used_device := context.get_device()
	assert device == used_device
	//
	context.destroy()
	device.close() ?
}

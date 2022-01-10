module test

import time
import duarteroso.openal.al as openal
import duarteroso.openal.alc as openalc
import duarteroso.vopenal.alc

fn test_capture() ? {
	mut device := alc.create_capture_device()
	assert device.open_default(60, openal.al_format_mono16, 128) ?
	//
	device.start() ?
	time.sleep(1 * time.second)
	_ := device.samples(10) ?
	device.stop() ?
	//
	closed := device.close() ?
	assert closed
}

fn test_default_capture() ? {
	mut device := alc.create_device()
	device.open(openalc.default_device) ?
	_ := device.get_string(openalc.alc_capture_default_device_specifier) ?
	device.close() ?
	//
	mut capture_device := alc.create_capture_device()
	assert capture_device.open_default(60, openal.al_format_mono16, 8) ?
	assert capture_device.close() ?
}

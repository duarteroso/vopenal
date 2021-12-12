module test

import time
import duarteroso.vopenal.al as vopenal
import duarteroso.vopenal.alc as vopenalc
import duarteroso.vopenalw.alc

fn test_capture() {
	mut device := alc.create_capture_device()
	assert device.open_default(60, vopenal.al_format_mono16, 128)
	defer {
		assert device.close()
	}
	//
	device.start()
	time.sleep(1 * time.second)
	_ := device.samples(10)
	device.stop()
}

fn test_default_capture() ? {
	mut device := alc.create_device()
	device.open(vopenalc.default_device) ?
	_ := device.get_string(vopenalc.alc_capture_default_device_specifier)
	device.close() ?
	//
	mut capture_device := alc.create_capture_device()
	assert capture_device.open_default(60, vopenal.al_format_mono16, 8)
	assert capture_device.close()
}

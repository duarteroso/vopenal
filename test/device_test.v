module test

import duarteroso.openal.alc as openalc
import duarteroso.vopenal.alc

fn test_device() ? {
	mut device := alc.create_device()
	device.open(openalc.default_device) ?
	device.close() ?
}

fn test_properties() ? {
	mut device := alc.create_device()
	device.open(openalc.default_device) ?
	//
	device.get_data()
	device.is_extension_present('abc')
	device.get_proc_addr('')
	device.get_enum_value('')
	//
	device.get_string(openalc.alc_default_device_specifier)
	device.get_string(openalc.alc_device_specifier)
	device.get_string(openalc.alc_capture_default_device_specifier)
	device.get_string(openalc.alc_capture_device_specifier)
	device.get_string(openalc.alc_extentions)
	//
	device.get_integers(openalc.alc_major_version, 1)
	device.get_integers(openalc.alc_minor_version, 1)
	//
	device.close() ?
}

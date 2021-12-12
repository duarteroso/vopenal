module test

import duarteroso.vopenal.alc as vopenalc
import duarteroso.vopenalw.alc

fn test_device() ? {
	mut device := alc.create_device()
	device.open(vopenalc.default_device) ?
	device.close() ?
}

fn test_properties() ? {
	mut device := alc.create_device()
	device.open(vopenalc.default_device) ?
	//
	device.get_data()
	device.is_extension_present('abc')
	device.get_proc_addr('')
	device.get_enum_value('')
	//
	device.get_string(vopenalc.alc_default_device_specifier)
	device.get_string(vopenalc.alc_device_specifier)
	device.get_string(vopenalc.alc_capture_default_device_specifier)
	device.get_string(vopenalc.alc_capture_device_specifier)
	device.get_string(vopenalc.alc_extentions)
	//
	device.get_integers(vopenalc.alc_major_version, 1)
	device.get_integers(vopenalc.alc_minor_version, 1)
	//
	device.close() ?
}

module al

import duarteroso.vopenal.al as vopenal

// enable an OpenAL capability
pub fn enable(capability int) {
	C.alEnable(capability)
	check_error()
}

// disable an OpenAL capability
pub fn disable(capability int) {
	C.alDisable(capability)
	check_error()
}

// is_enabled checks if a capability is enabled
pub fn is_enabled(capability int) bool {
	enabled := C.alIsEnabled(capability)
	check_error()
	return enabled == vopenal.al_true
}

// get_boolean returns the boolean value of a parameter
pub fn get_boolean(param int) bool {
	value := C.alGetBoolean(param)
	check_error()
	return value == vopenal.al_true
}

// get_double returns the double value of a parameter
pub fn get_double(param int) f64 {
	value := C.alGetDouble(param)
	check_error()
	return value
}

// get_float returns the float value of a parameter
pub fn get_float(param int) f32 {
	value := C.alGetFloat(param)
	check_error()
	return value
}

// get_integer returns the integer value of a parameter
pub fn get_integer(param int) int {
	value := C.alGetInteger(param)
	check_error()
	return value
}

// get_booleanv returns the boolean values of a parameter
pub fn get_booleanv(param int) []bool {
	values := []bool{}
	C.alGetBooleanv(param, &values.data)
	check_error()
	return values
}

// get_doublev returns the double values of a parameter
pub fn get_doublev(param int) []f64 {
	values := []f64{}
	C.alGetDoublev(param, &values.data)
	check_error()
	return values
}

// get_floatv returns the float values a parameter
pub fn get_floatv(param int) []f32 {
	values := []f32{}
	C.alGetFloatv(param, &values.data)
	check_error()
	return values
}

// get_integerv returns the integer values a parameter
pub fn get_integerv(param int) []int {
	values := []int{}
	C.alGetIntegerv(param, &values.data)
	check_error()
	return values
}

// get_string returns the string value a parameter
pub fn get_string(param int) string {
	s := C.alGetString(param)
	check_error()
	return unsafe { cstring_to_vstring(s) }
}

// is_extension_present checks wether an extension is present
pub fn is_extension_present(ext string) bool {
	ok := C.alIsExtensionPresent(ext.str)
	check_error()
	return ok == vopenal.al_true
}

// get_proc_addr returns the process address
pub fn get_proc_addr(fname string) voidptr {
	addr := C.alGetProcAddress(fname.str)
	check_error()
	return addr
}

// get_enum_value returns an enumeration value
pub fn get_enum_value(ename string) int {
	value := C.alGetEnumValue(ename.str)
	check_error()
	return value
}

module al

import duarteroso.vopenal.al as vopenal

// Err defines an error code for a particular error
pub struct Err {
mut:
	code int
}

// create_error creates a new Err
fn create_error(code int) Err {
	return Err{
		code: code
	}
}

// check_error checks and panics on error
pub fn check_error() {
	code := C.alGetError()
	if code == vopenal.al_no_error {
		return
	}
	//
	err := create_error(code)
	panic(err.str())
}

// code_as_string returns an error code as string
fn code_as_string(code int) string {
	return match code {
		vopenal.al_invalid_name { 'AL_INVALID_NAME' }
		vopenal.al_invalid_enum { 'AL_INVALID_ENUM' }
		vopenal.al_invalid_value { 'AL_INVALID_VALUE' }
		vopenal.al_invalid_operation { 'AL_INVALID_OPERATION' }
		vopenal.al_out_of_memory { 'AL_OUT_OF_MEMORY' }
		else { 'AL_NO_ERROR' }
	}
}

// message_from_code returns an error code as a human readable string
fn message_from_code(code int) string {
	return match code {
		vopenal.al_invalid_name { 'A bad name (ID) was passed to an OpenAL function' }
		vopenal.al_invalid_enum { 'An invalid enum value was passed to an OpenAL function' }
		vopenal.al_invalid_value { 'An invalid value was passed to an OpenAL function' }
		vopenal.al_invalid_operation { 'The requested operation is not valid' }
		vopenal.al_out_of_memory { 'The requested operation resulted in OpenAL running out of memory' }
		else { 'There is not currently an error ' }
	}
}

// str formats the error into a string
pub fn (err &Err) str() string {
	return '${code_as_string(err.code)} - ${message_from_code(err.code)}'
}

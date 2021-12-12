module test

import duarteroso.vopenal.al as vopenal
import duarteroso.vopenalw.al
import duarteroso.vopenalw.alc

fn test_buffer_creation() {
	test := fn () {
		mut buffer := al.new_buffer()
		buffer.generate()
		assert buffer.is_valid()
		//
		buffer.release()
		assert buffer.is_valid() == false
	}
	//
	do_test(test)
}

fn test_batch_buffer_creation() {
	test := fn () {
		buffers := al.new_buffers(3)
		assert buffers.len == 3
		for buffer in buffers {
			assert buffer.is_valid()
		}
		//
		al.release_buffers(buffers)
		for buffer in buffers {
			assert buffer.is_valid() == false
		}
	}
	//
	do_test(test)
}

fn test_buffer_getters() {
	test := fn () {
		mut buffer := al.new_buffer()
		buffer.generate()
		defer {
			buffer.release()
		}
		//
		buffer.get_frequency()
		buffer.get_bits()
		buffer.get_channels()
		buffer.get_size()
	}
	//
	do_test(test)
}

fn test_buffer_attributes() {
	test := fn () {
		mut buffer := al.new_buffer()
		buffer.generate()
		defer {
			buffer.release()
		}
		//
		buffer.get_bufferi(vopenal.al_frequency)
		buffer.get_bufferi(vopenal.al_bits)
		buffer.get_bufferi(vopenal.al_channels)
		buffer.get_bufferi(vopenal.al_size)
	}
	//
	do_test(test)
}

fn test_buffer_data() {
	test := fn () {
		mut buffer := al.new_buffer()
		buffer.generate()
		defer {
			buffer.release()
		}
		//
		mono_data := []u32{len: 10, init: -1}
		buffer.set_data(vopenal.al_format_mono8, mono_data.data, mono_data.len, 60.0)
		buffer.set_data(vopenal.al_format_mono16, mono_data.data, mono_data.len, 60.0)
		//
		stereo_data := []int{len: 20, init: 10}
		buffer.set_data(vopenal.al_format_stereo8, stereo_data.data, stereo_data.len,
			60.0)
		buffer.set_data(vopenal.al_format_stereo16, stereo_data.data, stereo_data.len,
			60.0)
	}
	//
	do_test(test)
}
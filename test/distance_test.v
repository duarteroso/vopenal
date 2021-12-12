module test

import duarteroso.vopenal.al as vopenal
import duarteroso.vopenal.alc as vopenalc
import duarteroso.vopenalw.al
import duarteroso.vopenalw.alc

fn test_distance_model() {
	test := fn () {
		models := [
			vopenal.DistanceModel.inverse_distance,
			vopenal.DistanceModel.inverse_distance_clamped,
			vopenal.DistanceModel.linear_distance,
			vopenal.DistanceModel.linear_ditance_clamped,
			vopenal.DistanceModel.exponent_distance,
			vopenal.DistanceModel.exponent_distance_clamped,
		]
		for model in models {
			al.distance_model(model)
		}
	}
	do_test(test)
}
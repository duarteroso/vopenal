module test

import duarteroso.openal.al as openal
import duarteroso.openal.alc as openalc
import duarteroso.vopenal.al
import duarteroso.vopenal.alc

fn test_distance_model() {
	test := fn () {
		models := [
			openal.DistanceModel.inverse_distance,
			openal.DistanceModel.inverse_distance_clamped,
			openal.DistanceModel.linear_distance,
			openal.DistanceModel.linear_ditance_clamped,
			openal.DistanceModel.exponent_distance,
			openal.DistanceModel.exponent_distance_clamped,
		]
		for model in models {
			al.distance_model(model)
		}
	}
	do_test(test)
}

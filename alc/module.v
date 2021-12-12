module alc

import duarteroso.semver
import duarteroso.vopenal.alc as vopenalc

// version returns the ALC semantic version
pub fn version() semver.SemVer {
	return semver.SemVer{
		major: vopenalc.alc_major_version
		minor: vopenalc.alc_minor_version
		patch: 0
		stage: semver.Stage.release
	}
}

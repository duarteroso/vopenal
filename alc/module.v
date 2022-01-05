module alc

import duarteroso.semver
import duarteroso.openal.alc as openalc

// version returns the ALC semantic version
pub fn version() semver.SemVer {
	return semver.SemVer{
		major: openalc.alc_major_version
		minor: openalc.alc_minor_version
		patch: 0
		stage: semver.Stage.release
	}
}

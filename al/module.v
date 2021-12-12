module al

import duarteroso.semver
import duarteroso.vopenal.al as vopenal

// version returns the AL semantic version
pub fn version() semver.SemVer {
	return semver.SemVer{
		major: vopenal.al_major_version
		minor: vopenal.al_minor_version
		patch: 0
		stage: semver.Stage.release
	}
}

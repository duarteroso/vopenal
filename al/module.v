module al

import duarteroso.semver
import duarteroso.openal.al as openal

// version returns the AL semantic version
pub fn version() semver.SemVer {
	return semver.SemVer{
		major: openal.al_major_version
		minor: openal.al_minor_version
		patch: 0
		stage: semver.Stage.release
	}
}

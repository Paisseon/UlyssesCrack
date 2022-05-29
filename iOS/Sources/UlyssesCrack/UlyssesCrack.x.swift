import Orion
import UlyssesCrackC

class StoreHook: ClassHook<NSObject> {
	static let targetName = "ULStoreController"
	func activation() -> UInt64 {
		return 2
	}
	
	func setActivation(_ arg0: UInt64) {
		orig.setActivation(2)
	}
	
	func activationLoaded() -> Bool {
		return true
	}
	
	func setActivationLoaded(_ arg0: Bool) {
		orig.setActivationLoaded(true)
	}
	
	func activationIsExpired() -> Bool {
		return false
	}
}
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

void crackedByPaisseon() {
	Class ULStoreController = objc_getClass("ULStoreController");
	SEL activation = NSSelectorFromString(@"activation");
	IMP activationImp = imp_implementationWithBlock(^ {
		return 2;
	});
	const char* activationType = method_getTypeEncoding(class_getInstanceMethod(ULStoreController, activation));
	class_replaceMethod(ULStoreController, activation, activationImp, activationType);
	SEL activationIsExpired = NSSelectorFromString(@"activationIsExpired");
	IMP activationIsExpiredImp = imp_implementationWithBlock(^ {
		return false;
	});
	const char* activationIsExpiredType = method_getTypeEncoding(class_getInstanceMethod(ULStoreController, activationIsExpired));
	class_replaceMethod(ULStoreController, activationIsExpired, activationIsExpiredImp, activationIsExpiredType);
	SEL activationLoaded = NSSelectorFromString(@"activationLoaded");
	IMP activationLoadedImp = imp_implementationWithBlock(^ {
		return true;
	});
	const char* activationLoadedType = method_getTypeEncoding(class_getInstanceMethod(ULStoreController, activationLoaded));
	class_replaceMethod(ULStoreController, activationLoaded, activationLoadedImp, activationLoadedType);
}

__attribute__((constructor))
static void ctor(void) {
	puts("Without love, it cannot be seen.");
	crackedByPaisseon();
}
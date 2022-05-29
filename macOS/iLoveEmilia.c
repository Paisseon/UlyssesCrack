#include <objc/runtime.h>
#include <stdio.h>

int override_activation() {
    return 2;
}

bool override_activationIsExpired() {
    return false;
}

bool override_activationLoaded() {
    return true;
}

__attribute__ ((constructor)) static void init() {
    Class ULStoreController = objc_getClass("ULStoreController");
    
    SEL activation = sel_registerName("activation");
    SEL activationIsExpired = sel_registerName("activationIsExpired");
    SEL activationLoaded = sel_registerName("activationLoaded");
    
    const char *activationT = method_getTypeEncoding(class_getInstanceMethod(ULStoreController, activation));
    const char *activationIsExpiredT = method_getTypeEncoding(class_getInstanceMethod(ULStoreController, activationIsExpired));
    const char *activationLoadedT = method_getTypeEncoding(class_getInstanceMethod(ULStoreController, activationLoaded));
    
    class_replaceMethod(ULStoreController, activation, (IMP)&override_activation, activationT);
    class_replaceMethod(ULStoreController, activationIsExpired, (IMP)&override_activationIsExpired, activationIsExpiredT);
    class_replaceMethod(ULStoreController, activationLoaded, (IMP)&override_activationLoaded, activationLoadedT);
    
    puts("Emilia-tan maji tenshi");
}
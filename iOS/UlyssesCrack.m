#include <objc/runtime.h>
#include <substrate.h>

int (*orig_activation)();
bool (*orig_activationIsExpired)();
bool (*orig_activationLoaded)();

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
    MSHookMessageEx(
        objc_getClass("ULStoreController"),
        sel_registerName("activation"),
        (IMP)&override_activation,
        (IMP *)&orig_activation
    );
    
    MSHookMessageEx(
        objc_getClass("ULStoreController"),
        sel_registerName("activationIsExpired"),
        (IMP)&override_activationIsExpired,
        (IMP *)&orig_activationIsExpired
    );
    
    MSHookMessageEx(
        objc_getClass("ULStoreController"),
        sel_registerName("activationLoaded"),
        (IMP)&override_activationLoaded,
        (IMP *)&orig_activationLoaded
    );
}
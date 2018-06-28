//
//  MyClass.m
//  DynamicResolveStudy
//
//  Created by cheyipai on 2018/6/28.
//  Copyright © 2018年 cheyipai. All rights reserved.
//

#import "MyClass.h"
#import <objc/runtime.h>
//添加要动态添加的类方法的实现
void dynamicClassMethodIMP(id self,SEL _cmd){
    NSLog(@"拦截到未实现的类方法，并为之添加实现");
}
//添加要动态添加的实例化方法的实现
void dynamicInstanceMethodIMP(id self,SEL _cmd){
    NSLog(@"拦截到未实现的实例化方法，并为之添加实现");
}
/*
 * 在NSObject中有动态解析方法，我们所有的类（除NSPoxy之外）都继承于NSObject，因此，我们可以所有的类中都可以重载动态解析方法
 */
@implementation MyClass
//重载类方法的动态解析方法
+(BOOL)resolveClassMethod:(SEL)sel{
    if (sel == @selector(unknownClassMethod)) {
        //objc_getMetaClass("MyClass")，根据类于对象的继承关系，给类添加类方法这里需要找MyClass的原类
        class_addMethod(objc_getMetaClass("MyClass"),sel,(IMP)dynamicClassMethodIMP,"v@:");//"v@:"是动态的添加方法的参数类型，这里是void
        return YES;
    }
    return [super resolveClassMethod:sel];
}
//重载实例方法的动态解析方法
+(BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(unknownInstanceMethod)) {
        class_addMethod([self class],sel,(IMP)dynamicInstanceMethodIMP,"v@:");
        return YES;
    }

    return [super resolveInstanceMethod:sel];
}
@end

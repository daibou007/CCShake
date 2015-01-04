//
//  CCShake.h
//  MiniRPG
//
//  Created by 杨朋亮 on 31/12/14.
//  Copyright 2014年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CCShake : CCActionInterval{
    
}

@property (nonatomic) float m_initial_x;
@property (nonatomic) float m_initial_y;
@property (nonatomic) float m_strength_x;
@property (nonatomic) float m_strength_y;

+ (CCShake*) createWithDuration:(float)d strength:(float)strength;

+ (CCShake*) createWithDuration:(float) d strengthX:(float) strength_x strengthY:(float)strength_y;

-(id)initWithDuration:(float)duration strengthX:(float)strength_x strengthY:(float)strength_y;

        
-(void) startWithTarget:(CCNode *)pTarget;
-(void) update:(float)time;
-(void) stop;



@end

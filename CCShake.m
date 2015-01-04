//
//  CCShake.m
//  MiniRPG
//
//  Created by 杨朋亮 on 31/12/14.
//  Copyright 2014年 __MyCompanyName__. All rights reserved.
//

#import "CCShake.h"
#include "cocos2d.h"

@implementation CCShake


+(CCShake*) createWithDuration:(float)d strength:(float)strength{
    // call other construction method with twice the same strength www.it165.net
    return [self createWithDuration:d strengthX:strength strengthY:strength];
}

+ (CCShake*) createWithDuration:(float) d strengthX:(float) strength_x strengthY:(float)strength_y{
    CCShake *shake = [[CCShake alloc] initWithDuration:d strengthX:strength_x strengthY:strength_y];
    if(shake){
        
    }
    return shake;
}

-(id)initWithDuration:(float)duration strengthX:(float)strength_x strengthY:(float)strength_y{
    self = [super initWithDuration:duration];
    if (self){
        self.m_strength_x = strength_x;
        self.m_strength_y = strength_y;
    }
    return self;
}


-(void) update:(float)time{
    float randx =[CCShake fgRangeRandWithMin:-self.m_strength_x Max:self.m_strength_x ]*time;
    float randy =[CCShake fgRangeRandWithMin:-self.m_strength_y Max:self.m_strength_y ]*time;
    
    // move the target to a shaked position
    [self.target setPosition: ccpAdd(ccp(self.m_initial_x, self.m_initial_y),ccp( randx, randy))];
}

-(void) startWithTarget:(CCNode *)pTarget{
    [super startWithTarget:pTarget];
    // save the initial position
    self.m_initial_x = pTarget.position.x;
    self.m_initial_y = pTarget.position.y;
}

-(void) stop{
    // Action is done, reset clip position
    [self.target setPosition:ccp(self.m_initial_x, self.m_initial_y)];
    [super stop];
}

// Helper function. I included it here so that you can compile the whole file
// it returns a random value between min and max included
+(float) fgRangeRandWithMin:(float)min Max:(float)max{
    float rnd = ((float)rand()/(float)RAND_MAX);
    return rnd*(max-min)+min;
}

@end

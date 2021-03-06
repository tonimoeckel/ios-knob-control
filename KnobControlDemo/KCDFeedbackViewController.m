/*
 Copyright (c) 2013-14, Jimmy Dee
 All rights reserved.

 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "IOSKnobControl.h"
#import "KCDFeedbackViewController.h"

@interface KCDFeedbackViewController ()

@end

@implementation KCDFeedbackViewController {
    IOSKnobControl* knobControl;
    IOSKnobControl* dialControl;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    knobControl = [[IOSKnobControl alloc] initWithFrame:_knobHolder.bounds];
    knobControl.mode = IKCMContinuous;
    knobControl.circular = NO;
    knobControl.min = -0.25*M_PI;
    knobControl.max = 0.25*M_PI;
    if ([knobControl respondsToSelector:@selector(setTintColor:)]) {
        // default anyway
        knobControl.tintColor = [UIColor blueColor];
    }
    UIColor* titleColor = [UIColor whiteColor];
    [knobControl setTitleColor:titleColor forState:UIControlStateNormal];
    [knobControl setTitleColor:titleColor forState:UIControlStateHighlighted];

    [knobControl addTarget:self action:@selector(knobTurned:) forControlEvents:UIControlEventValueChanged];
    [_knobHolder addSubview:knobControl];

    dialControl = [[IOSKnobControl alloc] initWithFrame:_dialHolder.bounds imageNamed:@"needle"];
    dialControl.mode = IKCMContinuous;
    dialControl.enabled = NO;
    dialControl.clockwise = knobControl.clockwise;
    dialControl.circular = knobControl.circular;
    dialControl.min = knobControl.min;
    dialControl.max = knobControl.max;
    [_dialHolder addSubview:dialControl];
}

- (void)knobTurned:(IOSKnobControl*)sender
{
    dialControl.position = sender.position;
}

@end

//
//  SonosState.swift
//  djust
//
//  Created by Philip Webster on 4/8/16.
//  Copyright © 2016 phil. All rights reserved.
//

import ReactiveCocoa

class SonosState {
    static var sharedState = SonosState()
    let volume = MutableProperty(0)
}

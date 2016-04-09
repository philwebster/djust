//
//  VolumeControlVM.swift
//  djust
//
//  Created by Philip Webster on 4/8/16.
//  Copyright © 2016 phil. All rights reserved.
//

import ReactiveCocoa

class VolumeControlVM {
    let volume = MutableProperty("")
    let sonos = SonosState.sharedState

    init() {
        volume <~ sonos.volume.producer.map { "\($0)" }
    }
    
    func increaseVolume() {
        sonos.volume.modify { $0 + 1 }
    }
    
    func decreaseVolume() {
        sonos.volume.modify { $0 - 1 }
    }
    
}

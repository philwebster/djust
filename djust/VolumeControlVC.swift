//
//  VolumeControlVC.swift
//  djust
//
//  Created by Philip Webster on 4/8/16.
//  Copyright © 2016 phil. All rights reserved.
//

import UIKit
import ReactiveCocoa

class VolumeControlVC: UIViewController {
    lazy var viewModel: VolumeControlVM = {
        return VolumeControlVM()
    }()
    
    let minusButton: UIButton = {
        let minusButton = UIButton(type: .System)
        minusButton.setTitle("-", forState: .Normal)
        return minusButton
    }()
    
    let plusButton: UIButton = {
        let plusButton = UIButton(type: .System)
        plusButton.setTitle("+", forState: .Normal)
        return plusButton
    }()
    
    let volumeLabel: UILabel! = {
        let volumeLabel = UILabel()
        return volumeLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        plusButton.rac_signalForControlEvents(.TouchUpInside).subscribeNext { [unowned self] (AnyObject) -> Void in
            self.viewModel.increaseVolume()
        }
        
        minusButton.rac_signalForControlEvents(.TouchUpInside).subscribeNext { [unowned self] (AnyObject) -> Void in
            self.viewModel.decreaseVolume()
        }

        DynamicProperty(object: volumeLabel, keyPath: "text") <~ viewModel.volume.producer.map { $0 }
        
        for s in [minusButton, plusButton, volumeLabel] {
            s.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(s)
        }
        
        NSLayoutConstraint.activateConstraints([
            volumeLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor),
            volumeLabel.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor),
            
            minusButton.rightAnchor.constraintEqualToAnchor(volumeLabel.leftAnchor),
            minusButton.centerYAnchor.constraintEqualToAnchor(volumeLabel.centerYAnchor),
            
            plusButton.leftAnchor.constraintEqualToAnchor(volumeLabel.rightAnchor),
            plusButton.centerYAnchor.constraintEqualToAnchor(volumeLabel.centerYAnchor)
            ])

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

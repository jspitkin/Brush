//
//  strokeWidthChooser.swift
//  Brush
//
//  Created by Jake Pitkin on 2/5/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class strokeWidthChooser: UIControl {
    private var _width: Float?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _width = 15
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        let widthSlider: UISlider = UISlider(frame: CGRectMake(5, 0, bounds.width - 10, bounds.height))
        widthSlider.minimumValue = 0.5
        widthSlider.maximumValue = 50.0
        widthSlider.value = 15
        widthSlider.addTarget(self, action: "widthChanged:", forControlEvents: UIControlEvents.ValueChanged)
        addSubview(widthSlider)
        
    }
    
    func widthChanged(sender: UISlider) {
        _width = sender.value
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
    }
    
    var width: Float { return _width! }
}

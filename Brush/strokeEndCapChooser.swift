//
//  strokeEndCapChooser.swift
//  Brush
//
//  Created by Jake Pitkin on 2/5/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class strokeEndCapChooser: UIControl {
    
    private var _endCap: CGLineCap?
    private var _buttButton :UIButton!
    private var _roundButton :UIButton!
    private var _squareButton :UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _endCap = CGLineCap.Round
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        _buttButton = UIButton(frame: CGRect(x: bounds.width * 0.025, y: bounds.height * 0.25, width: bounds.width * 0.3, height: bounds.height * 0.5))
        _buttButton.backgroundColor = UIColor.whiteColor()
        _buttButton.addTarget(self, action: "setEndCapToButt", forControlEvents: .TouchUpInside)
        addSubview(_buttButton)
        let buttLine = UIView(frame: CGRect(x: 0, y: _buttButton.bounds.height * 0.5, width: _buttButton.bounds.width, height: 1))
        buttLine.backgroundColor = UIColor.blackColor()
        _buttButton.addSubview(buttLine)
        
        _roundButton = UIButton(frame: CGRect(x: bounds.width * 0.350, y: bounds.height * 0.25, width: bounds.width * 0.3, height: bounds.height * 0.5))
        _roundButton.backgroundColor = UIColor.yellowColor()
        _roundButton.addTarget(self, action: "setEndCapToRound", forControlEvents: .TouchUpInside)
        _roundButton.layer.cornerRadius = 10
        addSubview(_roundButton)
        let roundLine = UIView(frame: CGRect(x: _roundButton.bounds.width * 0.1, y: _roundButton.bounds.height * 0.5, width: _roundButton.bounds.width * 0.8, height: 1))
        roundLine.backgroundColor = UIColor.blackColor()
        _roundButton.addSubview(roundLine)
        
        _squareButton = UIButton(frame: CGRect(x: bounds.width * 0.675, y: bounds.height * 0.25, width: bounds.width * 0.3, height: bounds.height * 0.5))
        _squareButton.backgroundColor = UIColor.whiteColor()
        _squareButton.addTarget(self, action: "setEndCapToSquare", forControlEvents: .TouchUpInside)
        addSubview(_squareButton)
        let squareLine = UIView(frame: CGRect(x: _squareButton.bounds.width * 0.1, y: _squareButton.bounds.height * 0.5, width: _squareButton.bounds.width * 0.8, height: 1))
        squareLine.backgroundColor = UIColor.blackColor()
        _squareButton.addSubview(squareLine)
    }
    
    func setEndCapToButt() {
        _endCap = CGLineCap.Butt
        _buttButton.backgroundColor = UIColor.yellowColor()
        _roundButton.backgroundColor = UIColor.whiteColor()
        _squareButton.backgroundColor = UIColor.whiteColor()
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
    }
    
    func setEndCapToRound() {
        _endCap = CGLineCap.Round
        _buttButton.backgroundColor = UIColor.whiteColor()
        _roundButton.backgroundColor = UIColor.yellowColor()
        _squareButton.backgroundColor = UIColor.whiteColor()
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
    }
    
    func setEndCapToSquare() {
        _endCap = CGLineCap.Square
        _buttButton.backgroundColor = UIColor.whiteColor()
        _roundButton.backgroundColor = UIColor.whiteColor()
        _squareButton.backgroundColor = UIColor.yellowColor()
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
    }
    
    var endCap: CGLineCap { return _endCap! }
}

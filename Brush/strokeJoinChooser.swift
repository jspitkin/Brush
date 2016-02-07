//
//  strokeJoinChooser.swift
//  Brush
//
//  Created by Jake Pitkin on 2/5/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class strokeJoinChooser: UIControl {
    private var _join: CGLineJoin!
    private var _miterButton :UIButton!
    private var _roundButton :UIButton!
    private var _bevelButton :UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _join = CGLineJoin.Round
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        _miterButton = UIButton(frame: CGRect(x: bounds.width * 0.025, y: bounds.height * 0.25, width: bounds.width * 0.3, height: bounds.height * 0.5))
        _miterButton.backgroundColor = UIColor.whiteColor()
        _miterButton.addTarget(self, action: "setJoinToMiter", forControlEvents: .TouchUpInside)
        addSubview(_miterButton)
        let buttLine = UIView(frame: CGRect(x: 0, y: _miterButton.bounds.height * 0.5, width: _miterButton.bounds.width, height: 1))
        buttLine.backgroundColor = UIColor.blackColor()
        _miterButton.addSubview(buttLine)
        
        _roundButton = UIButton(frame: CGRect(x: bounds.width * 0.350, y: bounds.height * 0.25, width: bounds.width * 0.3, height: bounds.height * 0.5))
        _roundButton.backgroundColor = UIColor.yellowColor()
        _roundButton.addTarget(self, action: "setJoinToRound", forControlEvents: .TouchUpInside)
        _roundButton.layer.cornerRadius = 10
        addSubview(_roundButton)
        let roundLine = UIView(frame: CGRect(x: _roundButton.bounds.width * 0.1, y: _roundButton.bounds.height * 0.5, width: _roundButton.bounds.width * 0.8, height: 1))
        roundLine.backgroundColor = UIColor.blackColor()
        _roundButton.addSubview(roundLine)
        
        _bevelButton = UIButton(frame: CGRect(x: bounds.width * 0.675, y: bounds.height * 0.25, width: bounds.width * 0.3, height: bounds.height * 0.5))
        _bevelButton.backgroundColor = UIColor.whiteColor()
        _bevelButton.addTarget(self, action: "setJoinToBevel", forControlEvents: .TouchUpInside)
        addSubview(_bevelButton)
        let squareLine = UIView(frame: CGRect(x: _bevelButton.bounds.width * 0.1, y: _bevelButton.bounds.height * 0.5, width: _bevelButton.bounds.width * 0.8, height: 1))
        squareLine.backgroundColor = UIColor.blackColor()
        _bevelButton.addSubview(squareLine)
    }
    
    func setJoinToMiter() {
        _join = CGLineJoin.Miter
        _miterButton.backgroundColor = UIColor.yellowColor()
        _roundButton.backgroundColor = UIColor.whiteColor()
        _bevelButton.backgroundColor = UIColor.whiteColor()
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
    }
    
    func setJoinToRound() {
        _join = CGLineJoin.Round
        _miterButton.backgroundColor = UIColor.whiteColor()
        _roundButton.backgroundColor = UIColor.yellowColor()
        _bevelButton.backgroundColor = UIColor.whiteColor()
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
    }
    
    func setJoinToBevel() {
        _join = CGLineJoin.Bevel
        _miterButton.backgroundColor = UIColor.whiteColor()
        _roundButton.backgroundColor = UIColor.whiteColor()
        _bevelButton.backgroundColor = UIColor.yellowColor()
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
    }
    
    var join: CGLineJoin { return _join! }
}

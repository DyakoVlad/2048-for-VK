//
//  GameCell.swift
//  2048 for VK
//
//  Created by Влад Дьяков on 08/05/2019.
//  Copyright © 2019 Vlad Dyakov. All rights reserved.
//

import UIKit

class GameCell: UIView {
    var width: Int
    var value: Int
    
    override init(frame: CGRect) {
        self.width = Int(frame.width)
        self.value = 2
        super.init(frame: frame)
        layer.cornerRadius = 12
        let numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: width))
        numberLabel.font = UIFont.systemFont(ofSize: CGFloat(width/2 - 3), weight: .black)
        numberLabel.textAlignment = .center
        if Int.random(in: 0...100) <= 20 {
            numberLabel.text = "4"
            backgroundColor = UIColor.colour4
            self.value = 4
        } else {
            numberLabel.text = "2"
            backgroundColor = UIColor.colour2
        }
        self.addSubview(numberLabel)
        let appear = CASpringAnimation(keyPath: "transform.scale")
        appear.duration         = 0.55
        appear.fromValue        = 0.1
        appear.toValue          = 1.0
        appear.autoreverses     = false
        appear.repeatCount      = 0
        appear.damping          = 13
        
        self.layer.add(appear, forKey: "appear")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func changeValue(newValue: Int) {
        self.value = newValue
        for views in self.subviews {
            if views is UILabel {
                views.removeFromSuperview()
            }
        }
        let numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: width))
        numberLabel.textAlignment = .center
        switch newValue {
        case 2:
            backgroundColor         = UIColor.colour2
            numberLabel.text        = "2"
            numberLabel.font        = UIFont.systemFont(ofSize: CGFloat(width/2 - 3), weight: .black)
        case 4:
            backgroundColor         = UIColor.colour4
            numberLabel.text        = "4"
            numberLabel.font        = UIFont.systemFont(ofSize: CGFloat(width/2 - 3), weight: .black)
        case 8:
            backgroundColor         = UIColor.colour8
            numberLabel.text        = "8"
            numberLabel.font        = UIFont.systemFont(ofSize: CGFloat(width/2 - 3), weight: .black)
        case 16:
            backgroundColor         = UIColor.colour16
            numberLabel.text        = "16"
            numberLabel.font        = UIFont.systemFont(ofSize: CGFloat(width/2 - 3), weight: .black)
        case 32:
            backgroundColor         = UIColor.colour32
            numberLabel.text        = "32"
            numberLabel.font        = UIFont.systemFont(ofSize: CGFloat(width/2 - 3), weight: .black)
        case 64:
            backgroundColor         = UIColor.colour64
            numberLabel.text        = "64"
            numberLabel.font        = UIFont.systemFont(ofSize: CGFloat(width/2 - 3), weight: .black)
            numberLabel.textColor   = UIColor.white
        case 128:
            backgroundColor         = UIColor.colour128
            numberLabel.text        = "128"
            numberLabel.font        = UIFont.systemFont(ofSize: CGFloat(width/2 - 12), weight: .black)
            numberLabel.textColor   = UIColor.white
        case 256:
            backgroundColor         = UIColor.colour256
            numberLabel.text        = "256"
            numberLabel.font        = UIFont.systemFont(ofSize: CGFloat(width/2 - 12), weight: .black)
            numberLabel.textColor   = UIColor.white
        case 512:
            backgroundColor         = UIColor.colour512
            numberLabel.text        = "512"
            numberLabel.font        = UIFont.systemFont(ofSize: CGFloat(width/2 - 12), weight: .black)
            numberLabel.textColor   = UIColor.white
        case 1024:
            backgroundColor         = UIColor.colour1024
            numberLabel.text        = "1024"
            numberLabel.font        = UIFont.systemFont(ofSize: CGFloat(width/3 - 3), weight: .black)
            numberLabel.textColor   = UIColor.white
        case 2048:
            backgroundColor         = UIColor.colour2048
            numberLabel.text        = "2048"
            numberLabel.font        = UIFont.systemFont(ofSize: CGFloat(width/3 - 3), weight: .black)
            numberLabel.textColor   = UIColor.white
        default:
            fatalError()
        }
        self.addSubview(numberLabel)
    }
    
    func moveCell(to: [Int], newValue: Int) {
        UIView.animate(withDuration: 0.13, animations: {
            var frame = self.frame
            frame.origin.x = CGFloat(to[0])
            frame.origin.y = CGFloat(to[1])
            
            self.frame = frame
            if self.value != newValue {
                self.changeValue(newValue: newValue)
                let pulse = CASpringAnimation(keyPath: "transform.scale")
                pulse.duration      = 0.2
                pulse.fromValue     = 1.0
                pulse.toValue       = 1.2
                pulse.autoreverses  = false
                pulse.repeatCount   = 0
            
                self.layer.add(pulse, forKey: "pulse")
            }
        })
    }
}
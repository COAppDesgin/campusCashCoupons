//
//  CAGradientLayer.swift
//  
//
//  Created by Tyler Jordan Cagle on 9/6/17.
//
//

import UIKit

extension CAGradientLayer {
    
    func blueColor() -> CAGradientLayer {
        
        let topColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        let bottomColor = UIColor(red: 50/255, green: 50/255, blue: 186/255, alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]
        
        return gradientLayer
    }
    
    func redColor() -> CAGradientLayer {
        
        let topColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        let bottomColor = UIColor(red: 186/255, green: 50/255, blue: 50/255, alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]
        
        return gradientLayer
    }
    
    func greyColor() -> CAGradientLayer {
        
        let topColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        let bottomColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]
        
        return gradientLayer
    }
    
    
    
    
}

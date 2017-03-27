//
//  UITableView+Capture.swift
//  WeaponsPerStage
//
//  Created by 南　京兵 on 2017/03/27.
//  Copyright © 2017年 南　京兵. All rights reserved.
//

import UIKit

extension UITableView {
    
    var contentBottom: CGFloat {
        return contentSize.height - bounds.height
    }
    
    override func captureImage() -> UIImage? {
        
        let images = captureImages()
        
        UIGraphicsBeginImageContext(contentSize);
        
        var y: CGFloat = 0
        for image in images {
            let cropImage = image.cropping(to: CGRect(x: 0, y: CGFloat(124), width: bounds.width, height: CGFloat(493) ))
            cropImage?.draw(at: CGPoint(x: 0, y: y))
            y = min(y + bounds.height, contentBottom)
        }
        let concatImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return concatImage
    }
    
    func captureImages() -> [UIImage] {
        
        var images: [UIImage?] = []
        
        while true {
            
            images.append(superview?.captureImage())
            
            if contentOffset.y < (contentBottom - bounds.height) {
                contentOffset.y += bounds.height
            } else {
                contentOffset.y = contentBottom
                images.append(superview?.captureImage())
                break
            }
        }
        
        return images.flatMap{ $0 }
    }
}

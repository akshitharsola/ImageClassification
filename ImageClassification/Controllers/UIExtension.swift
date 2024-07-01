//
//  UIExtension.swift
//  ImageClassification
//
//  Created by Akshit Harsola on 30/06/24.
//

import Foundation
import UIKit

extension UIImage{

    func resizeTo(size:CGSize) -> UIImage?{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in:CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizedImage
    }
    
        
    func toBuffer() -> CVPixelBuffer? {
            let attrs = [
                kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
                kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue
            ] as CFDictionary
            
            var pixelBuffer: CVPixelBuffer?
            let status = CVPixelBufferCreate(
                kCFAllocatorDefault,
                Int(self.size.width),
                Int(self.size.height),
                kCVPixelFormatType_32ARGB,
                attrs,
                &pixelBuffer
            )
            
            guard status == kCVReturnSuccess, let buffer = pixelBuffer else {
                return nil
            }
            
            CVPixelBufferLockBaseAddress(buffer, .init(rawValue: 0))
            defer { CVPixelBufferUnlockBaseAddress(buffer, .init(rawValue: 0)) }
            
            let pixelData = CVPixelBufferGetBaseAddress(buffer)
            let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
            guard let context = CGContext(
                data: pixelData,
                width: Int(self.size.width),
                height: Int(self.size.height),
                bitsPerComponent: 8,
                bytesPerRow: CVPixelBufferGetBytesPerRow(buffer),
                space: rgbColorSpace,
                bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue
            ) else {
                return nil
            }
            
            context.translateBy(x: 0, y: self.size.height)
            context.scaleBy(x: 1.0, y: -1.0)
            UIGraphicsPushContext(context)
            self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
            UIGraphicsPopContext()
            return buffer


        }
}

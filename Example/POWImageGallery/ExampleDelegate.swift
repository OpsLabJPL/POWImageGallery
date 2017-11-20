//
//  ExampleDelegate.swift
//  POWImageGallery_Example
//
//  Created by Powell, Mark W (397F) on 11/6/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import POWImageGallery

public class ExampleDelegate : ImageGalleryViewControllerDelegate {
    
    public var images:[ImageCreator] = [
        ImageCreator(url:URL(string:"https://msl-raws.s3.amazonaws.com/msl-raw-images/proj/msl/redops/ods/surface/sol/00000/opgs/edr/fcam/FLA_397506083EDR_F0010008AUT_04096M_.JPG")!,delegate: nil),
        ImageCreator(url:URL(string:"https://msl-raws.s3.amazonaws.com/msl-raw-images/proj/msl/redops/ods/surface/sol/01500/opgs/edr/fcam/FLB_530660118EDR_F0582394FHAZ00318M_.JPG")!,delegate: nil),
        ImageCreator(url:URL(string:"https://msl-raws.s3.amazonaws.com/msl-raw-images/proj/msl/redops/ods/surface/sol/01500/opgs/edr/ncam/NLB_530656506EDR_D0582136TRAV00508M_.JPG")!,delegate: nil)]
    
    public var captions:[String?] = [
        "Space is big. Really big. You just won't believe how vastly, hugely, mind-bogglingly big it is. I mean, you may think it's a long way down the road to the chemist, but that's just peanuts to space",
        "Ceci n'est pas une pipe.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ]
}

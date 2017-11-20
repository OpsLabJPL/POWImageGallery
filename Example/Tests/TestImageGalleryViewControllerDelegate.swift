//
//  TestDelegate.swift
//  POWImageGallery_Example
//
//  Created by Powell, Mark W (397F) on 11/6/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import POWImageGallery

public class TestImageGalleryViewControllerDelegate : ImageGalleryViewControllerDelegate {
    
    public static let imageUrl0 = "https://msl-raws.s3.amazonaws.com/msl-raw-images/proj/msl/redops/ods/surface/sol/00000/opgs/edr/fcam/FLA_397506083EDR_F0010008AUT_04096M_.JPG"
    public static let imageUrl1 = "https://msl-raws.s3.amazonaws.com/msl-raw-images/proj/msl/redops/ods/surface/sol/01500/opgs/edr/fcam/FLB_530660118EDR_F0582394FHAZ00318M_.JPG"
    public static let imageUrl2 = "https://msl-raws.s3.amazonaws.com/msl-raw-images/proj/msl/redops/ods/surface/sol/01500/opgs/edr/ncam/NLB_530656506EDR_D0582136TRAV00508M_.JPG"
    public static let lincoln = "The time has come for all good people to cmoe to the aid of their country."
    
    public var images:[ImageCreator] = [
        ImageCreator(url:URL(string:imageUrl0)!, delegate:nil),
        ImageCreator(url:URL(string:imageUrl1)!, delegate:nil),
        ImageCreator(url:URL(string:imageUrl2)!, delegate:nil)
    ]
    
    public var captions:[String?] = [
        lincoln,
        nil,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ]
    
}


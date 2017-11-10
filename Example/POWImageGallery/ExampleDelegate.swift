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
    public var urls:[URL] = [ URL(string:"https://msl-raws.s3.amazonaws.com/msl-raw-images/proj/msl/redops/ods/surface/sol/00000/opgs/edr/fcam/FLA_397506083EDR_F0010008AUT_04096M_.JPG")!,
                       URL(string:"https://msl-raws.s3.amazonaws.com/msl-raw-images/proj/msl/redops/ods/surface/sol/01500/opgs/edr/fcam/FLB_530660118EDR_F0582394FHAZ00318M_.JPG")!,
                       URL(string:"https://msl-raws.s3.amazonaws.com/msl-raw-images/proj/msl/redops/ods/surface/sol/01500/opgs/edr/ncam/NLB_530656506EDR_D0582136TRAV00508M_.JPG")!]
}
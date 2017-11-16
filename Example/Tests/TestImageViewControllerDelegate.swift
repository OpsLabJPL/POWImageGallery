//
//  TestImageViewControllerDelegate.swift
//  POWImageGallery_Example
//
//  Created by Powell, Mark W (397F) on 11/16/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import POWImageGallery

class TestImageViewControllerDelegate : ImageViewControllerDelegate {
    public var loaded = false
    func imageLoaded() {
        loaded = true
    }
}

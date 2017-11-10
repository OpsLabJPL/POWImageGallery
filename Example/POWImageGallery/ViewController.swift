//
//  ViewController.swift
//  POWImageGallery
//
//  Created by drmarkpowell on 11/01/2017.
//  Copyright (c) 2017 drmarkpowell. All rights reserved.
//

import UIKit
import POWImageGallery

class ViewController: ImageGalleryViewController {

    override func viewDidLoad() {
        self.delegate = ExampleDelegate()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


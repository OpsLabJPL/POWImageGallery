//
//  ImageViewController.swift
//  POWImageGallery
//
//  Created by Powell, Mark W (397F) on 11/2/17.
//

import UIKit
import SDWebImage

open class ImageViewController : UIViewController {
    
    @objc public var imageView: UIImageView!
    @objc public var scrollView: UIScrollView!
    public var loadInProgress = false
    public var image: ImageCreator? {
        didSet {
            loadInProgress = true
            self.image?.requestImage()
         }
    }
    
    public var imageIndex:Int?

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public convenience init() {
        self.init(nibName:nil, bundle:nil)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        imageView = UIImageView()
        imageView.contentMode = .center
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.insertSubview(imageView, at: 0)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bouncesZoom = false
        view.insertSubview(scrollView, at: 0)
        
        let constraints = [
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        if let image = imageView.image {
            //this will give the Scroll View a non-zero width & height for the image view to reside in
            view.layoutSubviews()
            initializeImageViewLayout(image: image)
        }
    }
    
    public func initializeImageViewLayout(image:UIImage) {
        self.loadViewIfNeeded()
        self.imageView.image = image
        self.imageView.frame = CGRect(x: 0, y: 0,
                                      width: self.scrollView.frame.width,
                                      height: self.scrollView.frame.height)
        self.imageView.contentMode = .scaleAspectFit
        self.scrollView.contentSize = self.imageView.frame.size
        self.scrollView.maximumZoomScale = 4
    }
}

extension ImageViewController : UIScrollViewDelegate {
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}

extension ImageViewController: ImageDelegate {
    public func progress(receivedSize: Int, expectedSize:Int){
        //TODO
    }
    
    public func finished(image: UIImage) {
        initializeImageViewLayout(image:image)
        loadInProgress = false
    }
    
    public func failure() {
        //TODO
        loadInProgress = false
    }
}

//
//  ImageGalleryViewController.swift
//  FBSnapshotTestCase
//
//  Created by Powell, Mark W (397F) on 11/1/17.
//

import UIKit

open class ImageGalleryViewController : UIViewController {
    
    @objc public var pageViewController: UIPageViewController!
    public var delegate: ImageGalleryViewControllerDelegate!
    public var pageIndex = 0
    
    public convenience init(delegate: ImageGalleryViewControllerDelegate) {
        self.init(nibName:nil, bundle:nil)
        self.delegate = delegate
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                  navigationOrientation: .horizontal,
                                                  options: nil)
        // Setup pages
        setupPageViewController()
        reloadData() //load for the first time, really
    }
    
    public func numberOfImages() -> Int {
        return delegate?.images.count ?? 0
    }
    
    public func reloadData() {
        if delegate.images.count > 0 {
            pageViewController.setViewControllers([makeImageViewController(imageIndex:pageIndex, image:delegate.images[pageIndex])],
                                                  direction: .forward,
                                                  animated: true,
                                                  completion: nil)
        }
    }
    
    func setupPageViewController() {
        addChildViewController(pageViewController)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(pageViewController.view, at: 0)
        let constraints = [
            pageViewController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            pageViewController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            pageViewController.view.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0),
            pageViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func makeImageViewController(imageIndex:Int, image: ImageCreator) -> ImageViewController {
        let vc = ImageViewController()
        vc.imageIndex = imageIndex
        vc.image = image
        image.delegate = vc
        image.requestImage() //TODO look at this again and make sure it doesn't smell funny
        return vc
    }
}

extension ImageGalleryViewController : UIPageViewControllerDataSource {
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let imageVC = viewController as? ImageViewController {
            if let index = imageVC.imageIndex {
                if index > 0 {
                    let image = delegate.images[index-1]
                    print("Image view \(index-1) is being made")
                    return makeImageViewController(imageIndex:index-1, image: image)
                }
            }
        }
        return nil
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let imageVC = viewController as? ImageViewController {
            if let index = imageVC.imageIndex {
                if index < delegate.images.count-1 {
                    let image = delegate.images[index+1]
                    print("Image view \(index+1) is being made")
                    return makeImageViewController(imageIndex:index+1, image: image)
                }
            }
        }
        return nil
    }
}

extension ImageGalleryViewController : UIPageViewControllerDelegate {
    
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let imageVC = pageViewController.viewControllers?[0] as? ImageViewController {
            if let index = imageVC.imageIndex {
                self.pageIndex = index
            }
        }
    }
}

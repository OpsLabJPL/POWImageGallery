// https://github.com/Quick/Quick

import Quick
import Nimble
import POWImageGallery

class POWImageGallerySpec: QuickSpec {
    override func spec() {
        describe("ImageViewController creation") {
            let imageVC = ImageViewController()
            _ = imageVC.view //this will trigger viewDidLoad()
            it("should have a scroll view") {
                expect(imageVC.scrollView).notTo(beNil())
            }
            it("should have an image view") {
                expect(imageVC.imageView).notTo(beNil())
            }
        }
        describe("ImageViewController image loading") {
            it("should load an image from a bundle URL") {
                let imageVC = ImageViewController()
                _ = imageVC.view //this will trigger viewDidLoad()
                let bundle = Bundle(for: ImageGalleryViewController.self)
                let url = bundle.url(forResource: "FLA_397506083EDR_F0010008AUT_04096M_", withExtension: "JPG")!
                expect(imageVC.imageView.image).to(beNil())
                imageVC.image = ImageCreator(url: url, delegate: imageVC)
                expect(imageVC.loadInProgress).to(beTrue())
                expect(imageVC.imageView.image).toNotEventually(beNil())
            }
            it("should load an image from a http URL") {
                let imageVC = ImageViewController()
                _ = imageVC.view //this will trigger viewDidLoad()
                let url = URL(string: "http://msl-raws.s3.amazonaws.com/msl-raw-images/proj/msl/redops/ods/surface/sol/00000/opgs/edr/fcam/FLA_397506083EDR_F0010008AUT_04096M_.JPG")!
                expect(imageVC.imageView.image).to(beNil())
                imageVC.image = ImageCreator(url: url, delegate: imageVC)
                expect(imageVC.loadInProgress).to(beTrue())
                expect(imageVC.imageView.image).toNotEventually(beNil())
            }
        }
        describe("ImageGalleryViewController creation") {
            it ("should have a PageViewController") {
                let galleryVC = ImageGalleryViewController(delegate: TestDelegate())
                _ = galleryVC.view //this will trigger viewDidLoad()
                expect(galleryVC.pageViewController).notTo(beNil())
            }
        }
        describe("ImageGalleryViewController creation with delegate") {
            let testDelegate = TestDelegate()
            let galleryVC = ImageGalleryViewController()
            galleryVC.delegate = testDelegate

            it ("should have 3 images from its delegate") {
                expect(galleryVC.numberOfImages()).to(equal(3))
            }
        }
        describe("ImageGalleryViewController set pageIndex creates the corresponding ImageViewController") {
            let testDelegate = TestDelegate()
            let galleryVC = ImageGalleryViewController()
            galleryVC.delegate = testDelegate

            it ("should start at page 0 after creation") {
                expect(galleryVC.pageIndex).to(equal(0))
                _ = galleryVC.view //this will trigger viewDidLoad()
               let imageVC = galleryVC.pageViewController.viewControllers?[0] as? ImageViewController
                expect(imageVC?.image?.url.absoluteString).to(equal(TestDelegate.imageUrl0))
            }
            it ("should create an ImageViewController for page 2 when pageIndex is set to 2.") {
                galleryVC.setPageIndex(2)
                let imageVC = galleryVC.pageViewController.viewControllers?[0] as? ImageViewController
                expect(imageVC?.image?.url.absoluteString).to(equal(TestDelegate.imageUrl2))
            }
        }
    }
}



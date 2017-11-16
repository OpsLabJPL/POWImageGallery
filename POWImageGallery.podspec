#
# Be sure to run `pod lib lint POWImageGallery.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'POWImageGallery'
  s.version          = '0.1.1'
  s.summary          = 'Image gallery view controller for iOS apps.'


  s.description      = <<-DESC
Image gallery view controller for iOS apps. Written in Swift 4 for XCode 9.
                       DESC

  s.homepage         = 'https://github.com/OpsLabJPL/POWImageGallery'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'drmarkpowell' => 'Mark.Powell@jpl.nasa.gov' }
  s.source           = { :git => 'https://github.com/OpsLabJPL/POWImageGallery.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'POWImageGallery/Classes/**/*.{swift,h,m}'
  s.resources = ['POWImageGallery/Assets/**/*.{storyboard,xib}',
                 'POWImageGallery/Assets/**/*.{png,PNG,jpg,JPG,xcassets}']
  s.dependency 'SDWebImage', '~> 4.2'
end

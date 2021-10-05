source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
project 'Archive.xcodeproj'
inhibit_all_warnings!
use_frameworks!

def pods
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxFlow'
  pod 'ReactorKit'
  pod 'Moya'
  pod 'SwiftGen'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'Kingfisher', '~> 7.0'
  pod 'SnapKit', '~> 5.0.0'
end

def pods_debug
  pod 'SwiftLint'
end

target 'Archive' do
  pods
end

target 'Archive_debug' do
  pods
  pods_debug
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
        end
    end
end

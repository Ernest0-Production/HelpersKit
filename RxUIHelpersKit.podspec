Pod::Spec.new do |spec|

  spec.name         = "RxUIHelpersKit"
  spec.version      = "0.0.3"
  spec.summary      = "Universal swift/functinal/uikit/rxswift helpers"
  spec.homepage     = "https://github.com/Ernest0-Production/HelpersKit"
  spec.author             = { "Ernest" => "magatar136@yandex.ru" }
  spec.social_media_url   = "https://t.me/Ernest0n"

  spec.platform     = :ios
  spec.ios.deployment_target = "11.0"
  spec.swift_versions = '5.4'

  spec.source       = {
    :git => "https://github.com/Ernest0-Production/HelpersKit.git",
    :branch => "main",
    :tag => "#{spec.version}"
   }

  spec.dependency "RxCoreHelpersKit"
  spec.dependency "RxCocoa", "~> 6.2"
  spec.source_files  = "Sources/RxUIHelpersKit/**/*.swift"
end

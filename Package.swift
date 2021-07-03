// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HelpersKit",
    
    platforms: [.iOS(.v11)],
    
    products: [
        .library(name: "CoreHelpersKit", targets: ["CoreHelpersKit"]),
        
        .library(name: "UIHelpersKit", targets: ["UIHelpersKit"]),
        
        .library(name: "FunctionalHelpersKit", targets: ["FunctionalHelpersKit"]),
        
        .library(name: "RxCoreHelpersKit", targets: ["RxCoreHelpersKit"]),
        
        .library(name: "RxUIHelpersKit", targets: ["RxUIHelpersKit"]),
        
        .library(
            name: "HelpersKit",
            targets: ["CoreHelpersKit", "UIHelpersKit", "FunctionalHelpersKit"]
        ),
        
        .library(
            name: "RxHelpersKit",
            targets: ["RxCoreHelpersKit", "RxUIHelpersKit", "FunctionalHelpersKit"]
        )
    ],
    
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .exact("6.2.0"))
    ],
    
    targets: [
        .target(name: "CoreHelpersKit"),
        
        .target(
            name: "UIHelpersKit",
            dependencies: ["CoreHelpersKit"]
        ),
        
        .target(name: "FunctionalHelpersKit"),
        
        .target(
            name: "RxCoreHelpersKit",
            dependencies: [
                "CoreHelpersKit",
                .product(name: "RxRelay", package: "RxSwift")
            ]
        ),
        
        .target(
            name: "RxUIHelpersKit",
            dependencies: [
                "RxCoreHelpersKit",
                .product(name: "RxCocoa", package: "RxSwift"),
            ]
        ),
        
        .testTarget(
            name: "RxHelpersKitTest",
            dependencies: ["CoreHelpersKit", "UIHelpersKit", "FunctionalHelpersKit", "RxCoreHelpersKit", "RxUIHelpersKit"]
        ),
    ]
)

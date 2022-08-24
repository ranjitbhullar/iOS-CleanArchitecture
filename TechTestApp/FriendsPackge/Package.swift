// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FriendsPackge",
    platforms: [
        .iOS(.v15)
        ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FriendsModule",
            targets: ["PresentationLayer", "DomainLayer","DataLayer"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/mxcl/PromiseKit.git", .upToNextMajor(from: "6.18.1")) 
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "PresentationLayer",
            dependencies: ["DomainLayer"]),
        .target(
            name: "DomainLayer",
            dependencies: ["PromiseKit"]),
        .target(
            name: "DataLayer",
            dependencies: ["DomainLayer"]),
        //MARK: - Tests
        .testTarget(
            name: "FriendsPackgeTests",
            dependencies: ["PresentationLayer", "DomainLayer", "DataLayer"]),
    ]
)

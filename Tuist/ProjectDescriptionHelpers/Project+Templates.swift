import ProjectDescription

extension Project {
    
    public static func app(name: String,
                           platform: Platform,
                           dependencies: [TargetDependency] = []) -> Project {
        return self.project(name: name,
                            product: .app,
                            platform: platform,
                            dependencies: dependencies,
                            infoPlist: [:])
    }
    
    public static func framework(name: String,
                                 platform: Platform,
                                 dependencies: [TargetDependency] = []) -> Project {
        return self.project(name: name,
                            product: .framework,
                            platform: platform,
                            dependencies: dependencies)
    }
    
    public static func project(name: String,
                               product: Product,
                               platform: Platform,
                               dependencies: [TargetDependency] = [],
                               infoPlist: [String: InfoPlist.Value] = [:]) -> Project {
        return Project(name: name,
                       targets: [
                        Target(name: name,
                               platform: platform,
                               product: product,
                               bundleId: "pl.msut\(name)",
                            infoPlist: .file(path: .relativeToManifest("../\(name)/\(name).plist")),
                            sources: ["Sources/**"],
                            resources: ["Resources/**"],
                            dependencies: dependencies),
                        Target(name: "\(name)Tests",
                            platform: platform,
                            product: .unitTests,
                            bundleId: "pl.msut.\(name)Tests",
                            infoPlist: .file(path: .relativeToManifest("../\(name)/\(name)Tests.plist")),
                            sources: "Tests/**",
                            resources: ["Resources/**"],
                            dependencies: [
                                .target(name: "\(name)")
                        ])
        ])
    }
    
}

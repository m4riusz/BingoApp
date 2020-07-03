import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(name: "Modules", platform: .iOS, dependencies: [
    .project(target: "Core", path: .relativeToManifest("../Core"))
])

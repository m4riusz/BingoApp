import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(name: "BingoApp", platform: .iOS, dependencies: [
    .project(target: "Modules", path: .relativeToManifest("../Modules")),
    .project(target: "Core", path: .relativeToManifest("../Core"))
])

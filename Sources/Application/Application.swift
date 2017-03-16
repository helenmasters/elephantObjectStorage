import Foundation
import Kitura
import LoggerAPI
import Configuration
import CloudFoundryConfig
import SwiftMetrics
import SwiftMetricsDash
import BluemixObjectStorage

public let router = Router()
public let manager = ConfigurationManager()
public var port: Int = 8080

internal var objectStorage: ObjectStorage?

public func initialize() throws {

    manager.load(file: "config.json", relativeFrom: .project)
           .load(.environmentVariables)

    port = manager.port

    let sm = try SwiftMetrics()
    let _ = try SwiftMetricsDash(swiftMetricsInstance : sm, endpoint: router)

    let objectStorageService = try manager.getObjectStorageService(name: "elephant-Object-Storage-e7a3")
    objectStorage = ObjectStorage(service: objectStorageService)
    try objectStorage?.connectSync(service: objectStorageService)

    objectStorage!.retrieveContainersList { (error, containers) in
	if let error = error {
		print("retrieve containers list error :: \(error)")
	} else {
		print("retrieve containers list success :: \(containers?.description)")
	}
    }

    router.all("/*", middleware: BodyParser())
    router.all("/", middleware: StaticFileServer())
    initializeSwaggerRoute(path: ConfigurationManager.BasePath.project.path + "/definitions/elephant.yaml")
    initializeProductRoutes()
}

public func run() throws {
    Kitura.addHTTPServer(onPort: port, with: router)
    Kitura.run()
}

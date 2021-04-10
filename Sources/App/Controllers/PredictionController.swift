import Fluent
import Vapor

struct PredictionController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        
    }

    func index(req: Request) throws -> EventLoopFuture<[Prediction]> {
    
    }
    
    func predictionsByAuthor(req: Request) throws -> EventLoopFuture<[Prediction]> {
    
    }

    func create(req: Request) throws -> EventLoopFuture<Prediction> {
        
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        
    }
}

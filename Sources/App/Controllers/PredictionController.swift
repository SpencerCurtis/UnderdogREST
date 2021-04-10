import Fluent
import Vapor

struct PredictionController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        
        // .grouped allows us to not have to repetitively add a path component to the URL if they are all the same.
        let predictions = routes.grouped("predictions")
        
        predictions.get(use: index)
        predictions.get(":author", use: predictionsByAuthor)
        predictions.post(use: create)
        predictions.group(":predictionID") { todo in
            todo.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Prediction]> {
        return Prediction.query(on: req.db).all()
    }
    
    func predictionsByAuthor(req: Request) throws -> EventLoopFuture<[Prediction]> {
        
        let author = try req.parameters.require("author")
        
        return Prediction
            .query(on: req.db)
            .filter(\.$author == author)
            .sort(\.$title)
            .all()
    }

    func create(req: Request) throws -> EventLoopFuture<Prediction> {
        let prediction = try req.content.decode(Prediction.self)
        return prediction
            .save(on: req.db)
            .map {
                /* return */ prediction
            }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Prediction.find(req.parameters.get("predictionID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}

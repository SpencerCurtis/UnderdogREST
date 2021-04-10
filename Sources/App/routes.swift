import Fluent
import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: PredictionController())
    // try app.register(collection: QuestionController())
    // try app.register(collection: ChatController())
}

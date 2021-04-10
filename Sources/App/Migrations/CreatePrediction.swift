//
//  File.swift
//  
//
//  Created by Spencer Curtis on 4/4/21.
//

import Fluent

struct CreatePrediction: Migration {
    
    var name: String {
        return "CreatePrediction"
    }
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Prediction.schema)
            .id()
            .field("title", .string, .required)
            .field("author", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Prediction.schema).delete()
    }
}

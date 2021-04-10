//
//  File.swift
//  
//
//  Created by Spencer Curtis on 4/4/21.
//

import Vapor
import Fluent

final class Prediction: Model, Content {
    
    /// The name of the table or "location" where these will be stored in the database.
    static let schema: String = "CreatePredictions"
    
    /// The unique identifier for each prediction. If one isn't assigned to it on creation, one will be created upon being added to the database.
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "author")
    var author: String
    
    init(id: UUID?, title: String, author: String) {
        self.id = id
        self.title = title
        self.author = author
    }
    
    init() {
        
    }
}

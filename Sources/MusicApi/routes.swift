import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get("api", "albums") { req async throws -> [Album] in
        let albums = try await Album.query(on: req.db).all()
        return albums
    }
	
	app.post("api", "albums") { req async throws -> Album in
		let album = try req.content.decode(Album.self)
		try await album.save(on: req.db)
		
		return album
	}

    try app.register(collection: TodoController())
}

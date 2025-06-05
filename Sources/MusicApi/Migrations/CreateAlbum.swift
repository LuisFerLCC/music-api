//
//  CreateAlbum.swift
//  MusicApi
//
//  Created by Luis Fernando Maldonado Ramírez on 02/06/2025.
//

import Fluent

struct CreateAlbum: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema("album")
            .id()
            .field("title", .string, .required)
            .field("image", .custom("VARCHAR(50)"), .required)
            .field("description", .string, .required)
            .field("artist", .string, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema("album").delete()
    }
}

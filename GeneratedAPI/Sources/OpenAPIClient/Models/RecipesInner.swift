//
// RecipesInner.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct RecipesInner: Codable, JSONEncodable, Hashable {

    /** Type of cuisine */
    public var cuisine: String?
    /** Name of the recipe */
    public var name: String?
    /** URL to the large photo of the recipe */
    public var photoUrlLarge: String?
    /** URL to the small photo of the recipe */
    public var photoUrlSmall: String?
    /** URL to the recipe source */
    public var sourceUrl: String?
    /** Unique identifier for the recipe */
    public var uuid: String?
    /** URL to the YouTube video of the recipe */
    public var youtubeUrl: String?

    public init(cuisine: String? = nil, name: String? = nil, photoUrlLarge: String? = nil, photoUrlSmall: String? = nil, sourceUrl: String? = nil, uuid: String? = nil, youtubeUrl: String? = nil) {
        self.cuisine = cuisine
        self.name = name
        self.photoUrlLarge = photoUrlLarge
        self.photoUrlSmall = photoUrlSmall
        self.sourceUrl = sourceUrl
        self.uuid = uuid
        self.youtubeUrl = youtubeUrl
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case cuisine
        case name
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case sourceUrl = "source_url"
        case uuid
        case youtubeUrl = "youtube_url"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(cuisine, forKey: .cuisine)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(photoUrlLarge, forKey: .photoUrlLarge)
        try container.encodeIfPresent(photoUrlSmall, forKey: .photoUrlSmall)
        try container.encodeIfPresent(sourceUrl, forKey: .sourceUrl)
        try container.encodeIfPresent(uuid, forKey: .uuid)
        try container.encodeIfPresent(youtubeUrl, forKey: .youtubeUrl)
    }
}


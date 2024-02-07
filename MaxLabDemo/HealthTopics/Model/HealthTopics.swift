//
//  HealthTopics.swift
//  MaxLabDemo
//
//  Created by Sumit Kumar on 07/02/24.
//

import Foundation


// MARK: - Welcome
struct HealthTopics: Codable {
    let result: ResultHealthTopics

    enum CodingKeys: String, CodingKey {
        case result = "Result"
    }
}

// MARK: - Result
struct ResultHealthTopics: Codable {
    let error: String
    let total: Int
    let query: Query
    let language: String
    let resources: Resources

    enum CodingKeys: String, CodingKey {
        case error = "Error"
        case total = "Total"
        case query = "Query"
        case language = "Language"
        case resources = "Resources"
    }
}

// MARK: - Query
struct Query: Codable {
    let apiVersion, apiType: String
    let topicID, toolID, categoryID, populationID: String?
    let keyword, who, age, sex: String?
    let pregnant, tobaccoUse, sexuallyActive, category: String?
    let lang: String
    let type: String?
    let returnType: String
    let callback, healthfinderPage: String?
    let aPiType: String

    enum CodingKeys: String, CodingKey {
        case apiVersion = "ApiVersion"
        case apiType = "ApiType"
        case topicID = "TopicId"
        case toolID = "ToolId"
        case categoryID = "CategoryId"
        case populationID = "PopulationId"
        case keyword = "Keyword"
        case who = "Who"
        case age = "Age"
        case sex = "Sex"
        case pregnant = "Pregnant"
        case tobaccoUse = "TobaccoUse"
        case sexuallyActive = "SexuallyActive"
        case category = "Category"
        case lang = "Lang"
        case type = "Type"
        case returnType = "ReturnType"
        case callback = "Callback"
        case healthfinderPage = "HealthfinderPage"
        case aPiType = "APiType"
    }
}

// MARK: - Resources
struct Resources: Codable {
    let resource: [HealthTopic]

    enum CodingKeys: String, CodingKey {
        case resource = "Resource"
    }
}

// MARK: - Resource
struct HealthTopic: Codable,Identifiable {
    var id: UUID = UUID()
    let type: String?
    let idx, title, translationID, translationTitle: String
    let categories, populations, myHFTitle, myHFDescription: String
    let myHFCategory, myHFCategoryHeading, lastUpdate: String
    let imageURL: String
    let imageAlt: String
    let accessibleVersion: String
    let relatedItems: RelatedItems
    let sections: Sections
    let moreInfoItems: String?
    let healthfinderLogo: String
    let healthfinderURL: String

    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case idx = "Id"
        case title = "Title"
        case translationID = "TranslationId"
        case translationTitle = "TranslationTitle"
        case categories = "Categories"
        case populations = "Populations"
        case myHFTitle = "MyHFTitle"
        case myHFDescription = "MyHFDescription"
        case myHFCategory = "MyHFCategory"
        case myHFCategoryHeading = "MyHFCategoryHeading"
        case lastUpdate = "LastUpdate"
        case imageURL = "ImageUrl"
        case imageAlt = "ImageAlt"
        case accessibleVersion = "AccessibleVersion"
        case relatedItems = "RelatedItems"
        case sections = "Sections"
        case moreInfoItems = "MoreInfoItems"
        case healthfinderLogo = "HealthfinderLogo"
        case healthfinderURL = "HealthfinderUrl"
    }
}

// MARK: - RelatedItems
struct RelatedItems: Codable {
    let relatedItem: [RelatedItem]

    enum CodingKeys: String, CodingKey {
        case relatedItem = "RelatedItem"
    }
}

// MARK: - RelatedItem
struct RelatedItem: Codable {
    let type: String?
    let id, title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case id = "Id"
        case title = "Title"
        case url = "Url"
    }
}

// MARK: - Sections
struct Sections: Codable {
    let section: [Section]
}

// MARK: - Section
struct Section: Codable {
    let title, description: String?
    let content: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case description = "Description"
        case content = "Content"
    }
}

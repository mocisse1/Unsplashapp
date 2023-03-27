//
//  DataModel.swift
//  Unsplashapp
//
//  Created by Mamoudou Cisse on 3/23/23.
//

import Foundation
struct WelcomeElement: Codable {
    var id: String?
    var createdAt: Date?
    var updatedAt: Date?
    var promotedAt: Date?
    var width: Int
    var height: Int?
    var color:  String?
    var blurHash: String?
    var description: String?
    var altDescription: String?
    var urls: Urls?
    var links: WelcomeLinks?
    var likes: Int?
    var likedByUser: Bool?
    var currentUserCollections: String?
    var sponsorship: Sponsorship?
    var topicSubmissions: TopicSubmissions?
    var user: User?
}
struct Urls: Codable {
    var raw: String?
    var full:  String?
    var regular:  String?
    var small: String?
    var thumb:  String?
    var smallS3: String?
}
struct WelcomeLinks: Codable {
    var linksSelf: String?
    var html: String?
    var download: String?
    var downloadLocation: String?
}
struct Sponsorship: Codable{
    var impressionUrls: String?
    var tagline: String?
    var taglineURL: String?
    var sponsor: User?
}
struct TopicSubmissions: Codable {
    var film: Film?
}
struct Film: Codable {
    var status: String?
}

struct User: Codable {
    var id: String?
    var updatedAt: Date?
    var username: String?
    var name: String?
    var firstName: String?
    var lastName: String?
    var twitterUsername: String?
    var portfolioURL: String?
    var bio: String?
    var location: String?
    var links: UserLinks?
    var profileImage: ProfileImage?
    var instagramUsername: String?
    var totalCollections: String?
    var totalLikes: Int?
    var totalPhotos: Int?
    var acceptedTos: Bool?
    var forHire: Bool?
    var social: Social?
}
struct UserLinks: Codable {
    var linksSelf: String?
    var html: String?
    var photos: String?
    var likes: String?
    var portfolio: String?
    var following: String?
    var followers: String?
}
struct ProfileImage: Codable {
    var small: String?
    var medium: String?
    var large: String?
}
struct Social: Codable{
    var instagramUsername: String?
    var portfolioURL: String?
    var twitterUsername: String?
    var paypalEmail: String?
}

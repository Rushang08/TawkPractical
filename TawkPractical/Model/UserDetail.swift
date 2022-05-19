//
//  UserDetail.swift
//
//  Created by Rushang Prajapati on 17/05/22
//  Copyright (c) . All rights reserved.
//

import Foundation
import UIKit

class UserDetail: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case nodeId = "node_id"
    case name
    case organizationsUrl = "organizations_url"
    case receivedEventsUrl = "received_events_url"
    case reposUrl = "repos_url"
    case followersUrl = "followers_url"
    case login
    case publicGists = "public_gists"
    case publicRepos = "public_repos"
    case createdAt = "created_at"
    case bio
    case following
    case gistsUrl = "gists_url"
    case siteAdmin = "site_admin"
    case blog
    case subscriptionsUrl = "subscriptions_url"
    case avatarUrl = "avatar_url"
    case url
    case updatedAt = "updated_at"
    case followers
    case starredUrl = "starred_url"
    case htmlUrl = "html_url"
    case followingUrl = "following_url"
    case eventsUrl = "events_url"
    case gravatarId = "gravatar_id"
    case type
  }

  var id: Int?
  var nodeId: String?
  var name: String?
  var organizationsUrl: String?
  var receivedEventsUrl: String?
  var reposUrl: String?
  var followersUrl: String?
  var login: String?
  var publicGists: Int?
  var publicRepos: Int?
  var createdAt: String?
  var bio: String?
  var following: Int?
  var gistsUrl: String?
  var siteAdmin: Bool?
  var blog: String?
  var subscriptionsUrl: String?
  var avatarUrl: String?
  var url: String?
  var updatedAt: String?
  var followers: Int?
  var starredUrl: String?
  var htmlUrl: String?
  var followingUrl: String?
  var eventsUrl: String?
  var gravatarId: String?
  var type: String?
    
    init() {
        
    }

  init (id: Int?, nodeId: String?, name: String?, organizationsUrl: String?, receivedEventsUrl: String?, reposUrl: String?, followersUrl: String?, login: String?, publicGists: Int?, publicRepos: Int?, createdAt: String?, bio: String?, following: Int?, gistsUrl: String?, siteAdmin: Bool?, blog: String?, subscriptionsUrl: String?, avatarUrl: String?, url: String?, updatedAt: String?, followers: Int?, starredUrl: String?, htmlUrl: String?, followingUrl: String?, eventsUrl: String?, gravatarId: String?, type: String?) {
    self.id = id
    self.nodeId = nodeId
    self.name = name
    self.organizationsUrl = organizationsUrl
    self.receivedEventsUrl = receivedEventsUrl
    self.reposUrl = reposUrl
    self.followersUrl = followersUrl
    self.login = login
    self.publicGists = publicGists
    self.publicRepos = publicRepos
    self.createdAt = createdAt
    self.bio = bio
    self.following = following
    self.gistsUrl = gistsUrl
    self.siteAdmin = siteAdmin
    self.blog = blog
    self.subscriptionsUrl = subscriptionsUrl
    self.avatarUrl = avatarUrl
    self.url = url
    self.updatedAt = updatedAt
    self.followers = followers
    self.starredUrl = starredUrl
    self.htmlUrl = htmlUrl
    self.followingUrl = followingUrl
    self.eventsUrl = eventsUrl
    self.gravatarId = gravatarId
    self.type = type
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    nodeId = try container.decodeIfPresent(String.self, forKey: .nodeId)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    organizationsUrl = try container.decodeIfPresent(String.self, forKey: .organizationsUrl)
    receivedEventsUrl = try container.decodeIfPresent(String.self, forKey: .receivedEventsUrl)
    reposUrl = try container.decodeIfPresent(String.self, forKey: .reposUrl)
    followersUrl = try container.decodeIfPresent(String.self, forKey: .followersUrl)
    login = try container.decodeIfPresent(String.self, forKey: .login)
    publicGists = try container.decodeIfPresent(Int.self, forKey: .publicGists)
    publicRepos = try container.decodeIfPresent(Int.self, forKey: .publicRepos)
    createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
    bio = try container.decodeIfPresent(String.self, forKey: .bio)
    following = try container.decodeIfPresent(Int.self, forKey: .following)
    gistsUrl = try container.decodeIfPresent(String.self, forKey: .gistsUrl)
    siteAdmin = try container.decodeIfPresent(Bool.self, forKey: .siteAdmin)
    blog = try container.decodeIfPresent(String.self, forKey: .blog)
    subscriptionsUrl = try container.decodeIfPresent(String.self, forKey: .subscriptionsUrl)
    avatarUrl = try container.decodeIfPresent(String.self, forKey: .avatarUrl)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt)
    followers = try container.decodeIfPresent(Int.self, forKey: .followers)
    starredUrl = try container.decodeIfPresent(String.self, forKey: .starredUrl)
    htmlUrl = try container.decodeIfPresent(String.self, forKey: .htmlUrl)
    followingUrl = try container.decodeIfPresent(String.self, forKey: .followingUrl)
    eventsUrl = try container.decodeIfPresent(String.self, forKey: .eventsUrl)
    gravatarId = try container.decodeIfPresent(String.self, forKey: .gravatarId)
    type = try container.decodeIfPresent(String.self, forKey: .type)
  }

}

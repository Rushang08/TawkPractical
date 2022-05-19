//
//  UserList.swift
//
//  Created by Rushang Prajapati on 17/05/22
//  Copyright (c) . All rights reserved.
//

import Foundation

class UserList: Codable {

  enum CodingKeys: String, CodingKey {
    case starredUrl = "starred_url"
    case id
    case gravatarId = "gravatar_id"
    case avatarUrl = "avatar_url"
    case subscriptionsUrl = "subscriptions_url"
    case htmlUrl = "html_url"
    case receivedEventsUrl = "received_events_url"
    case login
    case followingUrl = "following_url"
    case type
    case url
    case gistsUrl = "gists_url"
    case reposUrl = "repos_url"
    case siteAdmin = "site_admin"
    case followersUrl = "followers_url"
    case nodeId = "node_id"
    case organizationsUrl = "organizations_url"
    case eventsUrl = "events_url"
    case notes = "notes"
  }

  var starredUrl: String?
  var id: Int?
  var gravatarId: String?
  var avatarUrl: String?
  var subscriptionsUrl: String?
  var htmlUrl: String?
  var receivedEventsUrl: String?
  var login: String?
  var followingUrl: String?
  var type: String?
  var url: String?
  var gistsUrl: String?
  var reposUrl: String?
  var siteAdmin: Bool?
  var followersUrl: String?
  var nodeId: String?
  var organizationsUrl: String?
  var eventsUrl: String?
    var notes: String = KEY.COREDATA.NO_NOTES_PATTERN
    
  init (starredUrl: String?, id: Int?, gravatarId: String?, avatarUrl: String?, subscriptionsUrl: String?, htmlUrl: String?, receivedEventsUrl: String?, login: String?, followingUrl: String?, type: String?, url: String?, gistsUrl: String?, reposUrl: String?, siteAdmin: Bool?, followersUrl: String?, nodeId: String?, organizationsUrl: String?, eventsUrl: String?,notes: String?) {
    self.starredUrl = starredUrl
    self.id = id
    self.gravatarId = gravatarId
    self.avatarUrl = avatarUrl
    self.subscriptionsUrl = subscriptionsUrl
    self.htmlUrl = htmlUrl
    self.receivedEventsUrl = receivedEventsUrl
    self.login = login
    self.followingUrl = followingUrl
    self.type = type
    self.url = url
    self.gistsUrl = gistsUrl
    self.reposUrl = reposUrl
    self.siteAdmin = siteAdmin
    self.followersUrl = followersUrl
    self.nodeId = nodeId
    self.organizationsUrl = organizationsUrl
    self.eventsUrl = eventsUrl
    self.notes = notes!
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    starredUrl = try container.decodeIfPresent(String.self, forKey: .starredUrl)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    gravatarId = try container.decodeIfPresent(String.self, forKey: .gravatarId)
    avatarUrl = try container.decodeIfPresent(String.self, forKey: .avatarUrl)
    subscriptionsUrl = try container.decodeIfPresent(String.self, forKey: .subscriptionsUrl)
    htmlUrl = try container.decodeIfPresent(String.self, forKey: .htmlUrl)
    receivedEventsUrl = try container.decodeIfPresent(String.self, forKey: .receivedEventsUrl)
    login = try container.decodeIfPresent(String.self, forKey: .login)
    followingUrl = try container.decodeIfPresent(String.self, forKey: .followingUrl)
    type = try container.decodeIfPresent(String.self, forKey: .type)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    gistsUrl = try container.decodeIfPresent(String.self, forKey: .gistsUrl)
    reposUrl = try container.decodeIfPresent(String.self, forKey: .reposUrl)
    siteAdmin = try container.decodeIfPresent(Bool.self, forKey: .siteAdmin)
    followersUrl = try container.decodeIfPresent(String.self, forKey: .followersUrl)
    nodeId = try container.decodeIfPresent(String.self, forKey: .nodeId)
    organizationsUrl = try container.decodeIfPresent(String.self, forKey: .organizationsUrl)
    eventsUrl = try container.decodeIfPresent(String.self, forKey: .eventsUrl)
    notes = try container.decodeIfPresent(String.self, forKey: .notes) ?? KEY.COREDATA.NO_NOTES_PATTERN
  }

}

//
//  UsersList+CoreDataProperties.swift
//  TawkPractical
//
//  Created by Rushang Prajapati on 17/05/22.
//
//

import Foundation
import CoreData


extension UsersList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UsersList> {
        return NSFetchRequest<UsersList>(entityName: "UsersList")
    }

    @NSManaged public var starredUrl: String?
    @NSManaged public var id: Int64
    @NSManaged public var gravatarId: String?
    @NSManaged public var avatarUrl: String?
    @NSManaged public var subscriptionsUrl: String?
    @NSManaged public var htmlUrl: String?
    @NSManaged public var receivedEventsUrl: String?
    @NSManaged public var login: String?
    @NSManaged public var followingUrl: String?
    @NSManaged public var url: String?
    @NSManaged public var type: String?
    @NSManaged public var gistsUrl: String?
    @NSManaged public var reposUrl: String?
    @NSManaged public var siteAdmin: Bool
    @NSManaged public var followersUrl: String?
    @NSManaged public var nodeId: String?
    @NSManaged public var organizationsUrl: String?
    @NSManaged public var eventsUrl: String?
    @NSManaged public var notes: String?

}

extension UsersList : Identifiable {

}

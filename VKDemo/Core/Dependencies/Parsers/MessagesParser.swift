//
//  MessagesParser.swift
//  VKDemo
//
//  Created by Anton Krylov on 01.11.2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct ConversationItem {
//    let item: FeedItemDto
//    let profiles: [UserDto]?
//    let groups: [GroupDto]?
}

protocol IMessagesParser {
    func parse(conversationsResponse: ConversationsResponse) -> [ConversationItem]
}

class MessagesParser: IMessagesParser {
    func parse(conversationsResponse: ConversationsResponse) -> [ConversationItem] {
//        var feedItems = [FeedItem]()
//        let profiles = feedResponse.profiles ?? []
//        let groups = feedResponse.groups ?? []
//
//        feedResponse.items.forEach { feedItemDto in
//            let copyHistoryOwnerIds: [Int]
//            if let copyHistory = feedItemDto.copyHistory {
//                copyHistoryOwnerIds = copyHistory.map { $0.ownerId }
//            } else {
//                copyHistoryOwnerIds = [Int]()
//            }
//
//            let copyHistoryFromIds: [Int]
//            if let copyHistory = feedItemDto.copyHistory {
//                copyHistoryFromIds = copyHistory.map { $0.fromId }
//            } else {
//                copyHistoryFromIds = [Int]()
//            }
//
//            var optionalProfileAndGroupIds = [Int]()
//            if let signerId = feedItemDto.signerId {
//                optionalProfileAndGroupIds.append(signerId)
//            }
//
//            let distinctProfileAndGroupIds = Set(
//                copyHistoryOwnerIds
//                + copyHistoryFromIds
//                + optionalProfileAndGroupIds
//                + [feedItemDto.sourceId]
//            )
//
//            let distinctProfileIds = distinctProfileAndGroupIds
//                .filter { $0 > 0 }
//
//            let distinctGroupIds = distinctProfileAndGroupIds
//                .filter { $0 < 0 }
//                .map { abs($0) }
//
//            let profilesForCurrentFeedItem = profiles.filter { distinctProfileIds.contains($0.id) }
//            let groupsForCurrentFeedItem = groups.filter { distinctGroupIds.contains($0.id) }
//
//            let feedItem = FeedItem(item: feedItemDto,
//                                    profiles: profilesForCurrentFeedItem,
//                                    groups: groupsForCurrentFeedItem)
//            feedItems.append(feedItem)
//        }
//
//        return feedItems
        return [ConversationItem]()
    }
}

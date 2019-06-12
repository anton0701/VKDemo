//
//  PollDto.swift
//  VKDemo
//
//  Created by Anton Krylov on 12/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct PollDto: Codable {
    let id: Int
    let ownerId: Int
    let created: Int
    let question: String
    let votesCount: Int
    let answers: [PossibleAnswer]
    let isAnonymous: Bool
    let isMultiple: Bool
    let answerIds: [Int]
    let endDate: Int
    let isClosed: Bool
    let isBoard: Bool
    let canEdit: Bool
    let canVote: Bool
    let canReport: Bool
    let canShare: Bool
    let authorId: Int
    let photo: PhotoDto
    let background: Int
    let friends: [Int]?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case ownerId = "owner_id"
        case created
        case question
        case votesCount = "votes"
        case answers
        case isAnonymous = "anonymous"
        case isMultiple = "multiple"
        case answerIds = "answer_ids"
        case endDate = "end_date"
        case isClosed = "closed"
        case isBoard = "is_board"
        case canEdit = "can_edit"
        case canVote = "can_vote"
        case canReport = "can_report"
        case canShare = "can_share"
        case authorId = "author_id"
        case photo
        case background
        case friends
    }
}

struct PossibleAnswer: Codable {
    let id: Int
    let text: String
    let votes: Int
    let rate: Double
}

struct PollBackground: Codable {
    let id: Int
    let type: PollBackgroundType
    let angle: Int?
    let color: String
    let width: Int?
    let height: Int?
    let images: [PhotoDto]?
    let points: [PollBackgroundPoint]?
    
    enum PollBackgroundType: String, Codable {
        case gradient = "gradient"
        case tile = "tile"
    }
    
    struct PollBackgroundPoint: Codable {
        let position: Double
        let color: String
    }
}

//
//  MatchDetails.swift
//  PlayoffTree
//
//  Created by Siddhant Jain on 30/09/18.
//  Copyright © 2018 Siddhant Jain. All rights reserved.
//

import UIKit

///
class MatchDetailsResponse: Codable {
    let matches: [MatchDetails]?
    enum CodingKeys: String, CodingKey {
        case matches = "matches"
    }
}

class MatchDetails: NSObject, Codable {


    let matchId: Int?
    let homeTeam: String?
    let awayTeam: String?
    let stage: String?
    let seed: Int?

    private enum CodingKeys: String, CodingKey {
        case matchId = "match_id"
        case homeTeam = "home_team"
        case awayTeam = "away_team"
        case stage
        case seed
    }

}

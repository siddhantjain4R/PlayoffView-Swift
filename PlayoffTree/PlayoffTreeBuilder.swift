//
//  PlayoffTreeBuilder.swift
//  PlayoffTree
//
//  Created by Siddhant Jain on 30/09/18.
//  Copyright © 2018 Siddhant Jain. All rights reserved.
//

import UIKit

///
class PlayoffTreeBuilder: NSObject {

    // MARK: - Variable

    /// Sequence matter for the below Array
    private let allStagesToSearch = ["Round of 16", "Quarterfinal", "Semifinal", "Final"]
    ///
    var stagesFound = [String]()
    ///
    let jsonFileName = "world_cup_playoff_tree"
    ///
    let fileType = "json"
    ///
    var totalSection = 0
    ///
    var matchList: [MatchDetails]?
    ///
    var roundBasedMatchDetails = [String: [MatchDetails]]()

    // MARK: - Life Cycle Method

    ///
    override init() {
        super.init()

        readDataFromJsonFile()
    }

    // MARK: - Helper Methods

    ///
    func readDataFromJsonFile() {
        if let path = Bundle.main.path(forResource: jsonFileName, ofType: fileType) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                // do stuff
                    do {
                        //here dataResponse received from a network request
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(MatchDetailsResponse.self, from:
                            data) //Decode JSON Response Data
                        matchList = response.matches
                        extractValueFromMatchesData()
                    } catch let parsingError {
                        print("Error", parsingError)
                    }
            } catch {
                // handle error
            }
        }
    }

    /// Saves match details in Array of dictionary form. Where stages are key.
    func extractValueFromMatchesData() {
        guard let matchList = matchList else { return }
        allStagesToSearch.forEach { (stage) in
            let values = matchList.filter({ (details) -> Bool in
                if details.stage == stage {
                    return true
                }
                return false
            })
            if values.count > 0 {
                stagesFound.append(stage)
//                let sortedValues = values.sorted(by: { (first, second) -> Bool in
//                    return (first.seed ?? 0) < (second.seed ?? 0)
//                })
                roundBasedMatchDetails[stage] = values
            }
        }

        print(roundBasedMatchDetails)
    }


    /// Fetch no. of cells for that section
    ///
    /// - Parameter section: section who's no. of cell are needed
    /// - Returns: no. of cell
    func getNumberOfCellFor(section: Int) -> Int {
        guard let count = roundBasedMatchDetails[stagesFound[section]]?.count else { return 0}
        return count
    }
}

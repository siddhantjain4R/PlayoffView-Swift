//
//  playOffCollectionCell.swift
//  PlayoffTree
//
//  Created by Siddhant Jain on 01/10/18.
//  Copyright © 2018 Siddhant Jain. All rights reserved.
//

import UIKit

///
class playOffCollectionCell: UICollectionViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var AwayTeamLabel: UILabel!
    @IBOutlet weak var downView: UIView!
    @IBOutlet weak var upView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var stageLbl: UILabel!

    // MARK: - Setup UI
    func setupUI(withPlayoffValues playoffTree: PlayoffTreeBuilder, indexPath: IndexPath) {
        let key = playoffTree.stagesFound[indexPath.section]
        let matchDetails = playoffTree.roundBasedMatchDetails[key]?[indexPath.row]
        homeTeamLabel.text = matchDetails?.homeTeam
        AwayTeamLabel.text = matchDetails?.awayTeam
        if indexPath.section == playoffTree.roundBasedMatchDetails.keys.count - 1 {
            upView.isHidden = true
            downView.isHidden = true
            frontView.isHidden = true
            backView.isHidden = false

        } else if indexPath.row%2 == 0 {
            upView.isHidden = true
            downView.isHidden = false
            backView.isHidden = false
            frontView.isHidden = false
        } else {
            upView.isHidden = false
            downView.isHidden = true
            backView.isHidden = false
            frontView.isHidden = false
        }
        if indexPath.section == 0 {
            backView.isHidden = true
        }
        if indexPath.row == 0 {
            stageLbl.isHidden = false
            stageLbl.text = key
        } else {
            stageLbl.isHidden = true
        }
    }
}

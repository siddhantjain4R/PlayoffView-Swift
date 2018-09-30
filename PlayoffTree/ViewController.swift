//
//  ViewController.swift
//  PlayoffTree
//
//  Created by Siddhant Jain on 26/09/18.
//  Copyright © 2018 Siddhant Jain. All rights reserved.
//

import UIKit
///
class ViewController: UIViewController {

    // MARK: - Variable

    ///
    let playoffTree = PlayoffTreeBuilder()
    /// Height of cell
    let cellHeight = 50
    /// Width of cell
    let cellWidth = 250
    /// Extra height for collectionView
    let extraHeight = 300

    // MARK: - IBOutlet

    ///
    @IBOutlet weak var playOffCollectionView: UICollectionView!
    ///
    @IBOutlet weak var playoffCollectionViewHeightConstraint: NSLayoutConstraint!


    // MARK: - Life cycle methods

    ///
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCollectionViewUI()
    }

    ///
    func setupCollectionViewUI() {
        let totalCell = playoffTree.getNumberOfCellFor(section: 0)
        playoffCollectionViewHeightConstraint.constant = CGFloat(totalCell * cellHeight) + CGFloat(extraHeight)
    }
}

///
extension ViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return playoffTree.roundBasedMatchDetails.keys.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playoffTree.getNumberOfCellFor(section: section)

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playOffCell", for: indexPath) as? playOffCollectionCell else { return UICollectionViewCell() }
        cell.setupUI(withPlayoffValues: playoffTree, indexPath: indexPath)
        return cell
    }
}



///
extension ViewController: UICollectionViewDelegateFlowLayout {


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let height = Int(playoffCollectionViewHeightConstraint.constant)/playoffTree.getNumberOfCellFor(section: indexPath.section)
        print(height)
        return CGSize(width: cellWidth, height: height)
    }
}

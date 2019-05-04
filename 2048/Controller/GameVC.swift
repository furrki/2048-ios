//
//  GameVC.swift
//  2048
//
//  Created by Furkan Kaynar on 4.05.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import UIKit

class GameVC: UIViewController {

    var game = Game()
    
    @IBOutlet weak var gameTable: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameTable.delegate = self
        gameTable.reloadData()
    }
    
}

extension GameVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.table.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gameTable.dequeueReusableCell(withReuseIdentifier: "gameCell", for: indexPath) as! GameCell
        cell.initialize(no: game.table[indexPath.row])
        return cell
    }
}

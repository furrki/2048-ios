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
        
        game.delegate = self
        
        addGestureRecognizers()
    }
    
    func addGestureRecognizers() {
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swiped(gesture:)))
        rightSwipeRecognizer.direction = .right
        gameTable.addGestureRecognizer(rightSwipeRecognizer)
        
        let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swiped(gesture:)))
        leftSwipeRecognizer.direction = .left
        gameTable.addGestureRecognizer(leftSwipeRecognizer)
        
        let upSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swiped(gesture:)))
        upSwipeRecognizer.direction = .up
        gameTable.addGestureRecognizer(upSwipeRecognizer)
        
        let downSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swiped(gesture:)))
        downSwipeRecognizer.direction = .down
        gameTable.addGestureRecognizer(downSwipeRecognizer)
    }
    
    @objc func swiped(gesture: UISwipeGestureRecognizer) {
        print(gesture.direction)
        switch gesture.direction {
        case .up:
            game.doMove(move: .Up)
            break
        case .down:
            game.doMove(move: .Down)
            break
        case .right:
            game.doMove(move: .Right)
            break
        case .left:
            game.doMove(move: .Left)
            break
        default: break
        }
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

extension GameVC: GameDelegate {
    func game(_ tableChanged: [Int]) {
        gameTable.reloadData()
    }
}

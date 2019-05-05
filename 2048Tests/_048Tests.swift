//
//  _048Tests.swift
//  2048Tests
//
//  Created by Furkan Kaynar on 4.05.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import XCTest
@testable import _048

class _048Tests: XCTestCase {
    
    
    func testRightMove() {
        let game = Game()
        var result = game.moveRight(col: [0, 2, 2, 0])
        XCTAssert(result == [0, 0, 0, 4])
        
        result = game.moveRight(col: [2, 2, 2, 0])
        XCTAssert(result == [0, 0, 2, 4])
        
        result = game.moveRight(col: [0, 2, 4, 4])
        XCTAssert(result == [0, 0, 2, 8])
        
        result = game.moveRight(col: [512, 512, 2048, 2048])
        XCTAssert(result == [0, 0, 1024, 4096])
        
        result = game.moveRight(col: [2, 0, 2, 0])
        XCTAssert(result == [0, 0, 0, 4])
        
        result = game.moveRight(col: [4, 8, 8, 4])
        XCTAssert(result == [0, 4, 16, 4])
    }
    
    func testLeftMove() {
        let game = Game()
        var result = game.moveLeft(col: [0, 2, 2, 0])
        XCTAssert(result == [4, 0, 0, 0])
        
        result = game.moveLeft(col: [2, 2, 2, 0])
        XCTAssert(result == [4, 2, 0, 0])
        
        result = game.moveLeft(col: [0, 2, 4, 4])
        XCTAssert(result == [2, 8, 0, 0])
        
        result = game.moveLeft(col: [512, 512, 2048, 2048])
        XCTAssert(result == [1024, 4096, 0, 0])
        
        result = game.moveLeft(col: [2, 0, 2, 0])
        XCTAssert(result == [4, 0, 0, 0])
        
        result = game.moveLeft(col: [4, 8, 8, 4])
        XCTAssert(result == [4, 16, 4, 0])
    }
    
}


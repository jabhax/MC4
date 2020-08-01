//
//  Board.swift
//  MC4
//
//  Created by Justin Barros on 7/31/20.
//  Copyright © 2020 JabKamHax. All rights reserved.
//

import Foundation


class Board {
    // Board Class
    private var grid = [[Int]]()
    private let row_size: Int?
    private let col_size: Int?
    
    convenience init() {
        self.init(r: 7, c: 7)
    }
    
    init(r: Int, c: Int) {
        self.row_size = r
        self.col_size = c
        self.clean()
    }
    
    func clean() {
        self.grid = Array(repeating: Array(repeating: -1, count: self.row_size! ), count: self.col_size!)
    }
    
    func print_b() {
        for row in 0...self.grid.count-1 {
            var row_line = ""
            for col in 0...self.grid[row].count-1 {
                let slot = self.grid[row][col]
                row_line += String(slot) + " "
            }
            print("row_line \(row): \(row_line)")
        }
    }
}

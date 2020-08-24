//
//  Board.swift
//  MC4
//
//  Created by Justin Barros on 7/31/20.
//  Copyright © 2020 JabKamHax. All rights reserved.
//

import Foundation
import SpriteKit


class Board {
        
    // Board Class
    enum Direction : String {
        case UP = "UP"
        case DOWN = "DOWN"
        case LEFT = "LEFT"
        case RIGHT = "RIGHT"
    }
    
    private var grid = [[Int]]()
    private let row_size: Int?
    private let col_size: Int?
    private var players = [Player]()
    private var chips = Chips()
    
    
    convenience init() {
        self.init(r: 7, c: 7)
    }
    
    init(r: Int, c: Int) {
        self.row_size = r
        self.col_size = c
        self.clean()
    }
    
    func rows() -> Int {
        return self.grid.count
    }
    
    func cols(r: Int) -> Int {
        return self.grid[r].count
    }
    
    func get_grid() -> [[Int]] {
        return self.grid
    }
    
    func grid_at(r: Int, c: Int) -> Int {
        return self.grid[r][c]
    }
    
    func get_players() -> [Player] {
        return self.players
    }
    
    func set_player(p: Player) {
        self.players.append(p)
    }
    
    func get_chips() -> Chips {
        return self.chips
    }
    
    func clean() {
        // Cleans the current Board object by setting all slots to -1
        self.grid = Array(repeating: Array(repeating: -1, count: self.row_size! ), count: self.col_size!)
    }
    
    func print_players() {
        if self.players.count == 0 {
            print("0 Players...it's a lonely world...")
        }
        else if self.players.count == 1 {
            print("Player \(1): \(self.players[0])")
        }
        else {
            for p in 0...self.players.count-1 {
                print("Player \(p+1): \(self.players[p])")
            }
        }
    }
    
    func print_board() {
        // Prints all current Board object slots
        for r in 0...self.rows()-1 {
            var row_line = ""
            for c in 0...self.cols(r:r)-1 {
                let slot = self.grid[r][c]
                row_line += String(slot) + " "
            }
            print("row_line \(r): \(row_line)")
        }
    }
        
    func insert(d: Direction, r: Int, c: Int)  {
        // Insert a chip in the following direction, row, and column.
        if !check_valid_slot(r:r, c:c) {
            print("Invalid Slot: (\(r), \(c)) Please select valid row AND col.")
            return
        }
        self.grid[r][c] = self.players.count
        let x = 100 + 50*c
        let y = 100 + 50*r
        var loc = CGPoint(x: x, y: y)
        self.chips.drawChip(location: loc)
        print("Inserted at position: (row: \(r), col: \(c))")
    }
    
    func insert_up(c: Int) {
        let d = Direction.UP
        let (irow, icol) = find_slot_in_col(d:d, c:c)
        insert(d:d, r:irow, c:icol)
        
    }

    func insert_down(c: Int) {
        let d = Direction.DOWN
        let (irow, icol) = find_slot_in_col(d:d, c:c)
        insert(d:d, r:irow, c:icol)
    }
    
    func insert_left(r: Int) {
        let d = Direction.LEFT
        let (irow, icol) = find_slot_in_row(d:d, r:r)
        insert(d:d, r:irow, c:icol)
    }

    func insert_right(r: Int) {
        let d = Direction.RIGHT
        let (irow, icol) = find_slot_in_row(d:d, r:r)
        insert(d:d, r:irow, c:icol)
    }
    
    private func check_valid_slot(r: Int, c: Int) -> Bool {
        if r < 0 || c < 0 { return false }
        if r > self.grid.count-1 ||  c > self.grid[0].count-1 { return false }
        return true
    }
    
    private func find_slot_in_row(d: Direction, r: Int) -> (Int, Int) {
        var last_available_slot = (-1, -1)

        if !self.check_valid_slot(r:r, c:0) {
            return last_available_slot
        }
        if d == Direction.LEFT {
            for i in stride(from: self.grid[r].count-1, to:0, by: -1) {
                let slot = self.grid[r][i]
                if slot == -1 { last_available_slot = (r, i) }
                else { return last_available_slot }
            }
        }
        else if d == Direction.RIGHT {
            for i in 0...self.grid[r].count-1 {
                let slot = self.grid[r][i]
                if slot == -1 { last_available_slot = (r, i) }
                else { return last_available_slot }
            }
        }
        return last_available_slot
    }
    
    private func find_slot_in_col(d: Direction, c: Int) -> (Int, Int) {
        var last_available_slot = (-1, -1)
        if !self.check_valid_slot(r:0, c:c) { return last_available_slot }
        if d == Direction.DOWN {
            for i in 0...self.grid.count-1{
                let slot = self.grid[i][c]
                if slot == -1 {
                    last_available_slot = (i, c)
                    return last_available_slot
                }
                else { return last_available_slot }
            }
        }
        else if d == Direction.UP {
            for i in stride(from: self.grid.count-1, to: 0, by: -1) {
                let slot = self.grid[i][c]
                if slot == -1 {
                    last_available_slot = (i, c)
                    return last_available_slot
                }
                else {
                    return last_available_slot
                }
            }
        }
        return last_available_slot
    }
}

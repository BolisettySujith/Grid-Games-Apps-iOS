//
//  ViewController.swift
//  LightsOut
//
//  Created by Havells on 28/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    var board = [[UIButton]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }
    
    func initBoard(){
        board.append([a1, a2, a3])
        board.append([b1, b2, b3])
        board.append([c1, c2, c3])
        
        randomizeLights()

    }
    
    func randomizeLights() {
        for row in 0..<3 {
            for col in 0..<3 {
                // Randomly decide if the button should be on or off
                let shouldTurnOn = Bool.random() // Randomly returns true or false
                
                if shouldTurnOn {
                    board[row][col].backgroundColor = .systemOrange // Turn on
                } else {
                    board[row][col].backgroundColor = .darkGray // Turn off
                }
            }
        }
    }

    @IBAction func onButtonTap(_ sender: UIButton) {

        for row in 0..<3 {
            for col in 0..<3{
                if board[row][col] == sender {
                    toggleAdjacentButtons(row: row, col: col)
                    if checkWinCondition() {
                        showWinAlert()
                    }
                    break
                }
            }
        }
    }
    
    
    func toggleAdjacentButtons(row: Int, col: Int) {
        toggleButton(board[row][col])
        
        let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)] // right, down, left, up

        for direction in directions {
            let newRow = row + direction.0
            let newCol = col + direction.1
            
            if newRow >= 0 && newRow < 3 && newCol >= 0 && newCol < 3 {
                toggleButton(board[newRow][newCol])
            }
        }
    }
    
    
    func toggleButton(_ button: UIButton) {
        if button.backgroundColor == .systemOrange {
            button.backgroundColor = .darkGray // Turn off
        } else {
            button.backgroundColor = .systemOrange // Turn on
        }
    }
    
    func checkWinCondition() -> Bool {
        for row in 0..<3 {
            for col in 0..<3 {
                if board[row][col].backgroundColor == .systemOrange {
                    return false // Found a button that is still on
                }
            }
        }
        return true // All buttons are off
    }
    
    func showWinAlert() {
        let alert = UIAlertController(title: "Congratulations!", message: "You've turned off all the lights!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onResetButtonTap(_ sender: UIButton) {
        randomizeLights()
    }
    

}


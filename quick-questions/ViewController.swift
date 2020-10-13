//
//  ViewController.swift
//  quick-questions
//
//  Created by karime on 10/7/20.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var option1Btn: UIButton!
    @IBOutlet weak var option2Btn: UIButton!
    @IBOutlet weak var option3Btn: UIButton!
    
    //MARK: - Variables
    var selectedOption = 0
    
    
    //MARK: - View functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    //MARK: - Button actions
    @IBAction func option1Tap(_ sender: Any) {
        selectOption1()
    }
    
    func selectOption1() {
        selectedOption = selectedOption == 1 ? 0 : 1
    }
    
    @IBAction func option2Tap(_ sender: Any) {
        selectOption2()
    }
    
    func selectOption2() {
        selectedOption = selectedOption == 2 ? 0 : 2
    }
    
    @IBAction func option3Tap(_ sender: Any) {
        selectOption3()
    }
    
    func selectOption3() {
        selectedOption = selectedOption == 3 ? 0 : 3
    }
}


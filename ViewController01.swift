//
//  ViewController.swift
//  Project
//
//  Created by ChenLight on 2021/12/26.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var label01: UILabel!
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func textfield_enter(_ sender: Any) {
        label01.text = textfield.text;
    }
    
    @IBAction func segment_change(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            label01.text = "嗨";
            break;
        
        case 1:
            label01.text = "你好";
            break;
            
        case 2:
            label01.text = "：）";
            break;
        
        default:
            break;
        }
    }
    
    //收起鍵盤
    
    @IBOutlet weak var messageNewTitleTextField: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    //回到上一頁
    @IBAction func unwing(for segue : UIStoryboardSegue) {}
}


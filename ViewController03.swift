//
//  NewViewController.swift
//  Project
//
//  Created by ChenLight on 2021/12/26.
//

import UIKit

class NewViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var enter_btn: UIButton!
    @IBOutlet weak var testlable: UILabel!
    @IBOutlet weak var first_text: UITextField!
    @IBOutlet weak var second_text: UITextField!
    @IBOutlet weak var third_text: UITextField!
    @IBOutlet weak var forth_text: UITextField!
    
    private var origincenter = CGPoint.zero;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerObserver();
        // Do any additional setup after loading the view.
    }
    
    @IBAction func TouchFirstText(_ sender: UITextField) {
        first_text.text = "";
        ButtonEnableChange(first_text);
    }
    
    @IBAction func TouchSecondText(_ sender: UITextField) {
        second_text.text = "";
        ButtonEnableChange(second_text);
    }
    
    @IBAction func TouchThirdText(_ sender: UITextField) {
        third_text.text = "";
        ButtonEnableChange(third_text);
    }
    
    @IBAction func TouchForthText(_ sender: UITextField) {
        forth_text.text = "";
        ButtonEnableChange(forth_text);
    }
    
    
    @IBAction func FirstTextChange(_ sender: UITextField) {
        let text = String(first_text.text!);
        let num = text.count ;
        if num == 4 {
            second_text.becomeFirstResponder();
            ButtonEnableChange(first_text);
        }
        else if num >= 5{
            first_text.text = FourWord(text: text);
        }
    }
    
    @IBAction func SecondTextChange(_ sender: UITextField) {
        let text = String(second_text.text!);
        let num = text.count ;
        if num >= 4 {
            second_text.text = FourWord(text: text);
            third_text.becomeFirstResponder();
            ButtonEnableChange(second_text);
        }
    }
    
    @IBAction func ThirdTextChange(_ sender: UITextField) {
        let text = String(third_text.text!);
        let num = text.count ;
        if num >= 4 {
            third_text.text = FourWord(text: text);
            forth_text.becomeFirstResponder();
            ButtonEnableChange(forth_text);
        }
    }
    
    @IBAction func ForthTextChange(_ sender: UITextField) {
        let text = String(forth_text.text!);
        let num = text.count ;
        if num == 4 {
            forth_text.text = FourWord(text: text);
            ButtonEnableChange(forth_text);
        }
    }
    
    private func FourWord(text: String) -> String{
        return String(text.prefix(4));
    }
    
    private func ButtonEnableChange(_ sender:UITextField){
        
        let num1 = first_text.text?.count ?? 0;
        let num2 = second_text.text?.count ?? 0;
        let num3 = third_text.text?.count ?? 0;
        let num4 = forth_text.text?.count ?? 0;
        let num_total = num1 + num2 + num3 + num4;
        if num_total == 16{
            sender.resignFirstResponder();
            enter_btn.isEnabled = true;
        }
        else{
            enter_btn.isEnabled = false;
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
        }
    
    //鍵盤位移
    
    @IBAction func onEnd(_ sender: Any) {
        view.endEditing(true);
    }
    
    private func registerObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        origincenter = view.center;
    }
    
    @objc private func keyboardWillShow(_ sender: Notification){
        var firstResponder : UITextField!;
        view.center = origincenter;
        view.subviews.forEach{
            view in if view is UITextField{
                if (view as! UITextField).isFirstResponder{
                    firstResponder = view as? UITextField;
                }
            }
        }
        
        let rect = sender.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect;
        let keyboardHeight = rect.height;
        let distance = view.frame.height - firstResponder.frame.origin.y + firstResponder.frame.height;
        if distance < keyboardHeight + 65{view.center = CGPoint(
                x: view.center.x,
                y: view.center.y - keyboardHeight
            );
        }
    }
    
    @objc private func keyboardWillHide(_ sender: Notification){
        view.center = origincenter;
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

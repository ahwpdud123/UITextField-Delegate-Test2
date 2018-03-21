//
//  ViewController.swift
//  UITextField
//
//  Created by D7703_06 on 2018. 3. 19..
//  Copyright © 2018년 IceArrow. All rights reserved.
//

import UIKit

//UITextField의 델리게이트를 사용하기위해 UITextFieldDelegate사용
class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var hello: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField.delegate = self //델리 게이트 연결
        textField.clearButtonMode = UITextFieldViewMode.always
        textField.placeholder = "입력하세요!"
    }

    @IBAction func button(_ sender: Any) {
        hello.text = "Hello " + textField.text!
        textField.text = ""
        textField.resignFirstResponder() //버튼을 실행시키면 키보드를 내린다
    }
    
    // background view를 touch하면 카패드가 사라짐s
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //UItextFieldDelegate method
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("I pressed return key")
        hello.text = "Hello " + textField.text!
        textField.text = ""
        textField.resignFirstResponder()
        //버튼을 실행시키면 키보드를 내린다
        return true
    }
    // called when 'return' key pressed. return NO to ignore.
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        view.backgroundColor = UIColor.yellow
        return true
    }
    
    // if implemented, called in place of textFieldDidEndEditing:
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        view.backgroundColor = UIColor.green
    }

}


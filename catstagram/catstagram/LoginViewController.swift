//
//  LoginViewController.swift
//  catstagram
//
//  Created by Jin younkyum on 2022/03/26.
//

import UIKit

class LoginViewController: UIViewController {
    var email = String()
    var password = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func emailTextFieldEditingChainged(_ sender: UITextField) {
        let text = sender.text ?? "" // 옵셔널
        self.email = text
    }
    @IBAction func passWordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? "" // 옵셔널
        self.password = text
    }
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
    }
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
    }
    
}

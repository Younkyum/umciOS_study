//
//  RegisterViewController.swift
//  catstagram
//
//  Created by Jin younkyum on 2022/03/26.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    // 유효성 검사를 위한 프로퍼티
    var isValidEmail = false
    
    var isValidName = false
    
    var isValidNickname = false
    
    var isValidPassword = false
    
    @IBOutlet weak var signupButton: UIButton!
    
    // TextField
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var textField: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Action
    @objc
    func textFieldEditingChanged(_ sender : UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            print("email")
        case nameTextField:
            print("name")
        case nicknameTextField:
            print("nickname")
        case passwordTextField:
            print("password")
        default:
            fatalError("Missing TextField...")
        }
    }
    
    
    //MARK: - Helpers
    private func setupTextField() {
        textField.forEach() { tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    
    }
    // 사용자가 입력한 회원정보 확인하고 -> UI 업데이트
    private func validateUserInfo() {
        if isValidEmail
            && isValidName
            && isValidNickname
            && isValidPassword {
            self.signupButton.backgroundColor = UIColor.fa
        } else {
            self.signupButton.backgroundColor = disabledColor
        }
    }
    
}

extension String {
    func isValidPassWord() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        return passwordValidation.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

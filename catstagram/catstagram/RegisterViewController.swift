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
    var isValidEmail = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidName = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false {
        didSet {
            self.validateUserInfo()
        }
    }
   
    
    // TextField
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nickNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextFiled: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextField()
    }
    
    //MARK: - Action
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
        case nameTextField:
            self.isValidName = text.count > 2
        case nickNameTextField:
            self.isValidNickname = text.count > 2
        case passwordTextFiled:
            self.isValidPassword = text.isValidPassWord()
        default:
            print("help")
        }
    }
    
    
    //MARK: - Helpers
    private func setUpTextField() {
        emailTextField.addTarget(self,
                                 action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        nickNameTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        passwordTextFiled.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
    }

    // 사용자가 입력한 회원정보 확인하고 -> UI 업데이트
    private func validateUserInfo() {
        if isValidEmail && isValidName && isValidNickname && isValidPassword {
            
            UIView.animate(withDuration: 0.33, animations: {
                self.signupButton.backgroundColor = UIColor.facebookColor
            })
            
        } else {
            UIView.animate(withDuration: 0.33, animations: {
                self.signupButton.backgroundColor = UIColor.disabledButtonColor
            })
        }
    }
    
    
}

extension String {
    func isValidPassWord() -> Bool {
        let regex = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}" // 8자리 ~ 50자리 영어+숫자+특수문자
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regex)
        return passwordValidation.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailTest.evaluate(with: self)
    }
}

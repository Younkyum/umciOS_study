//
//  RegisterViewController.swift
//  catstagram
//
//  Created by Jin younkyum on 2022/03/26.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    var email:String = ""
    var name:String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
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
    
    @IBOutlet weak var popLoginButton: UIButton!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextField()
        setupAttribute()
        
        // bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        signupButton.layer.cornerRadius = 5
    }
    
    //MARK: - Action
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
        case nickNameTextField:
            self.isValidNickname = text.count > 2
            self.nickname = text
        case passwordTextFiled:
            self.isValidPassword = text.isValidPassWord()
            self.password = text
        default:
            print("help")
        }
    }
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(email: self.email, name: self.name, nickname: self.nickname, password: self.password)
        
        self.userInfo?(userInfo)
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
    
    
    private func setupAttribute() { // registerButton의 글자 색 다르게 하는 view method 사용
        //register Button
        
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attribute = generateButtonAttribute(self.popLoginButton, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
        
        self.popLoginButton.setAttributedTitle(attribute, for: .normal
        )
    }
}

extension String {
    func isValidPassWord() -> Bool { // 비밀번호 적합성 확인
        let regex = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}" // 8자리 ~ 50자리 영어+숫자+특수문자
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regex)
        return passwordValidation.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool { // 이메일 적합성 확인
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailTest.evaluate(with: self)
    }
}

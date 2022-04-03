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
    var userInfo: UserInfo?
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
    }
    
    
    @IBAction func emailTextFieldEditingChainged(_ sender: UITextField) {
        let text = sender.text ?? "" // 옵셔널
        self.loginButton.backgroundColor = text.isValidEmail() ? .facebookColor : .disabledButtonColor
        self.email = text
    }
    @IBAction func passWordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? "" // 옵셔널
        self.loginButton.backgroundColor = text.count > 2 ? .facebookColor : .disabledButtonColor
        self.password = text
    }
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        guard let userInfo = self.userInfo else { return }
        
        if userInfo.email == self.email, userInfo.password == self.password {
            self.loginButton.backgroundColor = .facebookColor
            self.loginButton.isEnabled = true
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        } else {
            self.loginButton.backgroundColor = .disabledButtonColor
            self.loginButton.isEnabled = false
        }
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        // 1. 스토리보드를 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // 2. ViewController 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        // 3. 화면전환 메소드 (present)를 사용하여 화면을 전환
        //self.present(registerViewController, animated: true, completion: nil)
        // 3-1. navigationController 이용하여 pushViewController로 화면 전환 가능
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        registerViewController.userInfo = { [weak self] (userInfo) in
            self?.userInfo = userInfo
        }
    }
    
    private func setupAttribute() {
        //register Button
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attribute = generateButtonAttribute(self.registerButton, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attribute, for: .normal
        )
    }
}

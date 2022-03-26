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
        // 1. 스토리보드를 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // 2. ViewController 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        // 3. 화면전환 메소드 (present)를 사용하여 화면을 전환
        //self.present(registerViewController, animated: true, completion: nil)
        // 3-1. navigationController 이용하여 pushViewController로 화면 전환 가능
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
}

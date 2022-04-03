//
//  SecondViewController.swift
//  Protocol Practice
//
//  Created by Jin younkyum on 2022/04/03.
//

import UIKit

class SecondViewController: UIViewController, ChangeLabelDelegate {
    func doChange() {
        previousViewController?.label.text = self.textfField.text
    }
    
    
    @IBOutlet weak var textfField: UITextField!
    
    var previousViewController : ViewController?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        previousViewController?.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonDismiss(_ sender: Any) {
        doChange()
        dismiss(animated: true)
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

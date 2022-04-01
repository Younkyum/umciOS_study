//
//  UIViewController+Extension.swift
//  catstagram
//
//  Created by Jin younkyum on 2022/03/30.
//

import UIKit

extension UIViewController {
    func generateButtonAttribute(_ button: UIButton,
                                 texts: String...,
                                 fonts: UIFont...,
                                 colors: UIColor...) -> NSMutableAttributedString {
        guard let wholeText = button.titleLabel?.text else { fatalError("No TEXTS on the Button") }
        
        let customFonts: [UIFont] = fonts
        
        let customTextsRanges = texts.indices.map { index in
            (wholeText as NSString).range(of: texts[index])
        }
        
        let customColors = colors
        
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        texts.indices.forEach{ index in
            attributedString.addAttribute(.font, value: customFonts[index], range: customTextsRanges[index])
            
            attributedString.addAttribute(.foregroundColor, value: customColors[index], range: customTextsRanges[index])
        }
        
        return attributedString
    }
}

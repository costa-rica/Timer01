//
//  TemplateVC.swift
//  Timer01
//
//  Created by Nick Rodriguez on 28/09/2024.
//

import UIKit

class TemplateVC: UIViewController {
    
    var strNameOfScreen = String()
    var lblScreenTitle = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("- TemplateVC viewDidLoad")
        
    }
    
    func setupViews(){
        view.backgroundColor = UIColor(red: 102/255, green: 102/255, blue: 51/255, alpha: 1.0)
        print("- TemplateVC setupViews")
        lblScreenTitle.text = strNameOfScreen
        lblScreenTitle.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(lblScreenTitle)
        NSLayoutConstraint.activate([
            lblScreenTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            lblScreenTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        print("- TemplateVC setupViews: \(lblScreenTitle.text)")
    }
    
    
    @objc func touchDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.curveEaseOut], animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: nil)
    }
    
}

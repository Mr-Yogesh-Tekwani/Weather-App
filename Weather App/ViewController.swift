//
//  ViewController.swift
//  Weather App
//
//  Created by Yogesh Tekwani on 5/19/23.
//

import UIKit

class ViewController: UIViewController {

    let textinput : UITextField = {
    let textField = UITextField()
     textField.placeholder = "Enter text"
     textField.borderStyle = .roundedRect
     textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
    }()
    
    let searchButton : UIButton = {
        let b1 = UIButton()
        b1.setTitle("Search Weather ", for: .normal)
        b1.backgroundColor = .systemBlue
        b1.tintColor = .white
        b1.translatesAutoresizingMaskIntoConstraints = false
        b1.addTarget(self, action: #selector(okClicked), for: .touchUpInside)
        return b1
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        textinput.delegate = self
        self.view.addSubview(textinput)
        self.view.addSubview(searchButton)
        self.view.backgroundColor = .gray
        
        NSLayoutConstraint.activate([
            
            textinput.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textinput.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textinput.widthAnchor.constraint(equalToConstant: 200),
                        
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.topAnchor.constraint(equalTo: textinput.bottomAnchor, constant: 30)
            
        ])
        
    }


}


extension ViewController: UITextFieldDelegate {
    @objc func okClicked() {
        let fvc = FirstViewController()
        fvc.city  = textinput.text!
        navigationController?.show(fvc, sender: self)
        
    }
}
 

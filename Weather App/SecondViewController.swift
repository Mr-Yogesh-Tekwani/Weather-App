//
//  SecondViewController.swift
//  Weather App
//
//  Created by Yogesh Tekwani on 5/19/23.
//

import UIKit

class SecondViewController: UIViewController {

    var label3text : String?
    var label4text : String?
        
    let label3 : UILabel = {
       let l1 = UILabel()
        //l1.text = "Minimum Temperature: "
        l1.textColor = .systemBlue
        l1.font = UIFont(name: "Times New Roman", size: 33)
        return l1
    }()

    let label4 : UILabel = {
       let l1 = UILabel()
        //l1.text = "Maximum Temperature: "
        l1.textColor = .systemBlue
        l1.font = UIFont(name: "Times New Roman", size: 33)
        return l1
    }()
    
    let mainstack : UIStackView = {
        let ms = UIStackView()
        ms.distribution = .fillEqually
        ms.axis = .vertical
        ms.alignment = .center
        ms.backgroundColor = .black
        return ms
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        mainstack.addArrangedSubview(label3)
        mainstack.addArrangedSubview(label4)
        
        label3.text = label3text
        label4.text = label4text
        
        
        self.view.addSubview(mainstack)
        
        mainstack.translatesAutoresizingMaskIntoConstraints = false

        let safeArea = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            mainstack.topAnchor.constraint(equalTo: safeArea.topAnchor),
            mainstack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            mainstack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            mainstack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)

        ])
       
    }

}

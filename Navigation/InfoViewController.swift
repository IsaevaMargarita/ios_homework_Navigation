//
//  InfoViewController.swift
//  Navigation
//
//  Created by m.isaeva on 05.07.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Show alert", for: .normal)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonClose: UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.addTarget(self, action: #selector(tapClose), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        navigationItem.title = "Информация"
        
        view.addSubview(button) //показываем кнопку на вьюконтролере
        view.addSubview(buttonClose)
        button.sizeToFit() // задаем размер
        button.center = view.center // распологаем по центру
        
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonClose.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            buttonClose.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            buttonClose.widthAnchor.constraint(equalToConstant: 60),
            buttonClose.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    //кнопка по нажатию отображается аллерт
    @objc private func tap() {
        let alertController = UIAlertController(title: "Alert", message: "Вы уверенны, что хотите зделать это?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Да", style: .default ) {_ in 
            print("okAction")
        }// кнопка на алерте
        let cancelAction = UIAlertAction(title: "Нет", style: .default) {_ in
           print("cancelAction")
       }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
        print(#function)

    }
    
    @objc private func tapClose() {
        dismiss(animated: true)
    }


}

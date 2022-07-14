//
//  PostViewController.swift
//  Navigation
//
//  Created by m.isaeva on 10.07.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = "Post"
    
    
    private lazy var rightBarButtonItem: UIBarButtonItem = {
              let button = UIBarButtonItem(image: UIImage(systemName: "exclamationmark.circle"), style: .plain, target: self, action: #selector(tap)) //
//        let button = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(tap))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        self.navigationItem.title = titlePost
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
 
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc private func tap () {
        let infoViewController = InfoViewController()
        infoViewController.modalPresentationStyle = .overCurrentContext
       // self.navigationController?.pushViewController(infoViewController, animated: true)
        present(infoViewController, animated: true)
    }
}

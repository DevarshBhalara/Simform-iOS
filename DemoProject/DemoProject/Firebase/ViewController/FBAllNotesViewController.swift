//
//  FBAllNotesViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 02/08/23.
//

import UIKit

class FBAllNotesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addNote)), animated: true)
    }
    
    @objc func addNote() {
        guard let vc = storyboard?.instantiateViewController(identifier: "FBAddNoteViewController") as? FBAddNoteViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

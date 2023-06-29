//
//  Coordinator.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 20/06/23.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

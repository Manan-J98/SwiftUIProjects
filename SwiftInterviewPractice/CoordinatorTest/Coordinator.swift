//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by Manan Juneja on 2025-02-19.
//
import UIKit
import Foundation

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

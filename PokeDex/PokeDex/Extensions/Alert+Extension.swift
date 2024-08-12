//
//  Alert+Extension.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/08/12.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Strings.Alerts.action, style: .default, handler: nil))
        present(alert, animated: true)
    }
}

//
//  UIImageView+Extension.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/24.
//

import Foundation
import UIKit

extension UIImageView {
    
    func load(urlString: String) {
        guard let safeURL = URL(string: urlString) else { return }
        
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: safeURL),
                  let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}





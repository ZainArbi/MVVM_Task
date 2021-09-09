//
//  Extensions.swift
//  MVVM_Task
//
//  Created by ZainAli on 08/09/2021.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL!) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

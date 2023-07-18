//
//  MainSceneViewController.swift
//  ColorizedApp
//
//  Created by Динара Шарафутдинова on 17.07.2023.
//

import UIKit

protocol SetColorViewControllerDelegate {
    func setColor(_ color: UIColor)
}

class MainSceneViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? SetColorViewController else { return }
        colorVC.delegate = self
        colorVC.mixedColor = view.backgroundColor
    }
}

extension MainSceneViewController: SetColorViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

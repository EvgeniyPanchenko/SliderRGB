//
//  MainViewController.swift
//  SliderRGB
//
//  Created by Евгений Панченко on 05.09.2021.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setNewColor(for colorOfScreen: UIView)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingColor = segue.destination as? SettingViewController else { return }
        settingColor.colorOfMainView = view.backgroundColor
        settingColor.delegate = self
    }
}

extension MainViewController: SettingViewControllerDelegate {
    func setNewColor(for colorOfScreen: UIView) {
        view.backgroundColor = colorOfScreen.backgroundColor
    }
}

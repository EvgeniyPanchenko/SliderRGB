//
//  SettingViewController.swift
//  SliderRGB
//
//  Created by Евгений Панченко on 21.08.2021.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    var colorOfMainView: UIColor!
    var delegate: SettingViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        
        setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
        
        colorView.backgroundColor = colorOfMainView
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider: redLabel.text = string(from: redSlider)
        case greenSlider: greenLabel.text = string(from: greenSlider)
        default: blueLabel.text = string(from: blueSlider)
        }
    }
    
    @IBAction func rgbTextField(_ sender: UITextField) {
        setColor()
        
        switch sender {
        case redTF: redTF.text = string(from: redSlider)
        case greenTF: greenTF.text = string(from: greenSlider)
        default: blueTF.text = string(from: blueSlider)
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewColor(for: colorView)
        dismiss(animated: true)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel: redLabel.text = string(from: redSlider)
            case greenLabel: greenLabel.text = string(from: greenSlider)
            default: blueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

extension SettingViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case redTF: redSlider.setValue(currentValue, animated: true)
                redLabel.text = string(from: redSlider)
            case greenTF: greenSlider.setValue(currentValue, animated: true)
                greenLabel.text = string(from: greenSlider)
            default: blueSlider.setValue(currentValue, animated: true)
                blueLabel.text = string(from: blueSlider)
            }
        
            setColor()
            return
        }
    }
}

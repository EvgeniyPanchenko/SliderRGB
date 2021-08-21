//
//  ViewController.swift
//  SliderRGB
//
//  Created by Евгений Панченко on 21.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var ViewColorized: UIView!
    
    @IBOutlet var labelRedValue: UILabel!
    @IBOutlet var LabelGreenValue: UILabel!
    @IBOutlet var LabelBlueValue: UILabel!
    
    @IBOutlet var sliderRedValue: UISlider!
    @IBOutlet var sliderGreenValue: UISlider!
    @IBOutlet var sliderBlueValue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ViewColorized
        ViewColorized.layer.cornerRadius = 10
        
        // Label
        labelRedValue.text = String(sliderRedValue.value)
        LabelGreenValue.text = String(sliderGreenValue.value)
        LabelBlueValue.text = String(sliderBlueValue.value)
    }


    @IBAction func sliderActionRedValue() {
        labelRedValue.text = String(sliderRedValue.value)
    }
    
    @IBAction func sliderActionGreenValue() {
        LabelGreenValue.text = String(sliderGreenValue.value)
    }
    
    @IBAction func sliderActionBlueValue() {
        LabelBlueValue.text = String(sliderBlueValue.value)
    }
    
    
}


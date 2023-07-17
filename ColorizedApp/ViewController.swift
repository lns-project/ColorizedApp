//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Динара Шарафутдинова on 05.01.2023.
//

import UIKit

// MARK: ViewController

class ViewController: UIViewController {

    @IBOutlet var mixedColorView: UIView!
    
    @IBOutlet var firstColorSlider: UISlider!
    @IBOutlet var secondColorSlider: UISlider!
    @IBOutlet var thirdColorSlider: UISlider!
    
    @IBOutlet var firstColorValue: UILabel!
    @IBOutlet var secondColorValue: UILabel!
    @IBOutlet var thirdColorValue: UILabel!
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mixedColorView.layer.cornerRadius = 10
        
        setupSlider(firstColorSlider, color: .red, value: firstColorSlider.value)
        setupSlider(secondColorSlider, color: .blue, value: secondColorSlider.value)
        setupSlider(thirdColorSlider, color: .green, value: thirdColorSlider.value)
        
        setViewColor()
    }
    
    // MARK: Methods

    @IBAction func sliderAction() {
        textColorForSlider(firstColorSlider, label: firstColorValue)
        textColorForSlider(secondColorSlider, label: secondColorValue)
        textColorForSlider(thirdColorSlider, label: thirdColorValue)
        
        setViewColor()
    }
    
    // MARK: - Private methods
    
    private func setupSlider(_ slider: UISlider, color: UIColor, value: Float) {
        slider.value = value
        slider.minimumTrackTintColor = color
    }
    
    private func setViewColor() {
        mixedColorView.backgroundColor = UIColor(
            red: CGFloat(firstColorSlider.value),
            green: CGFloat(secondColorSlider.value),
            blue: CGFloat(thirdColorSlider.value),
            alpha: 1
        )
    }
    
    private func textColorForSlider(_ slider: UISlider, label: UILabel) {
        label.text = String(format: "%0.2f", slider.value)
    }
    
}

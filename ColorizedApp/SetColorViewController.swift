//
//  SetColorViewController.swift
//  ColorizedApp
//
//  Created by Динара Шарафутдинова on 05.01.2023.
//

import UIKit

// MARK: ViewController

class SetColorViewController: UIViewController {

    @IBOutlet var mixedColorView: UIView!
    
    @IBOutlet var firstColorSlider: UISlider!
    @IBOutlet var secondColorSlider: UISlider!
    @IBOutlet var thirdColorSlider: UISlider!
    
    @IBOutlet var firstColorValue: UILabel!
    @IBOutlet var secondColorValue: UILabel!
    @IBOutlet var thirdColorValue: UILabel!
    
    var delegate: SetColorViewControllerDelegate!
    var mixedColor: UIColor!
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mixedColorView.layer.cornerRadius = 10
        mixedColorView.backgroundColor = mixedColor
        
        let colorComponents = CIColor(color: mixedColor)

        setupSlider(firstColorSlider,
                    color: .red,
                    value: Float(colorComponents.red),
                    label: firstColorValue
        )
        setupSlider(secondColorSlider,
                    color: .green,
                    value: Float(colorComponents.green),
                    label: secondColorValue
        )
        setupSlider(thirdColorSlider,
                    color: .blue,
                    value: Float(colorComponents.blue),
                    label: thirdColorValue
        )
        
    }
    
    // MARK: Methods

    @IBAction func sliderAction() {

        textColorForSlider(firstColorSlider, label: firstColorValue)
        textColorForSlider(secondColorSlider, label: secondColorValue)
        textColorForSlider(thirdColorSlider, label: thirdColorValue)
        
        setViewColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setColor(mixedColorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    // MARK: - Private methods
    
    private func setupSlider(_ slider: UISlider, color: UIColor, value: Float, label: UILabel) {
        slider.value = value
        slider.minimumTrackTintColor = color
        label.text = String(format: "%0.2f", slider.value)
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

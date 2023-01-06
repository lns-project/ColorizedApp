//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Динара Шарафутдинова on 05.01.2023.
//

import UIKit

// MARK: Constants

struct Constants {
    static let firstColorValue = 0.05
    static let secondColorValue = 0.27
    static let thirdColorValue = 0.49
    static let firstColorName = "Red:"
    static let secondColorName = "Green:"
    static let thirdColorName = "Blue:"
    static let minimumValueForSlider = 0
    static let maximumValueForSlider = 1
    static let cornerRadius: CGFloat = 10
}

// MARK: ViewController

class ViewController: UIViewController {

    @IBOutlet var mixedColorView: UIView!
    
    @IBOutlet var firstColorSlider: UISlider!
    @IBOutlet var secondColorSlider: UISlider!
    @IBOutlet var thirdColorSlider: UISlider!
    
    @IBOutlet var firstColorValue: UILabel!
    @IBOutlet var secondColorValue: UILabel!
    @IBOutlet var thirdColorValue: UILabel!
    
    @IBOutlet var firstColorLabel: UILabel!
    @IBOutlet var secondColorLabel: UILabel!
    @IBOutlet var thirdColorLabel: UILabel!
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
        setupUI()
    }
    
    // MARK: Methods

    @IBAction func sliderAction(_ sender: Any) {
        firstColorValue.text = String(format: "%0.2f", firstColorSlider.value)
        secondColorValue.text = String(format: "%0.2f", secondColorSlider.value)
        thirdColorValue.text = String(format: "%0.2f", thirdColorSlider.value)
        mixedColorView.backgroundColor = UIColor(
            red: CGFloat(firstColorSlider.value),
            green: CGFloat(secondColorSlider.value),
            blue: CGFloat(thirdColorSlider.value),
            alpha: 1
        )
    }
    
    // MARK: - Private methods
    
    private func setupSlider() {
        firstColorSlider.value = Float(Constants.firstColorValue)
        firstColorSlider.minimumValue = Float(Constants.minimumValueForSlider)
        firstColorSlider.maximumValue = Float(Constants.maximumValueForSlider)
        firstColorSlider.minimumTrackTintColor = .red
        
        secondColorSlider.value = Float(Constants.secondColorValue)
        secondColorSlider.minimumValue = Float(Constants.minimumValueForSlider)
        secondColorSlider.maximumValue = Float(Constants.maximumValueForSlider)
        secondColorSlider.minimumTrackTintColor = .green
        
        thirdColorSlider.value = Float(Constants.thirdColorValue)
        thirdColorSlider.minimumValue = Float(Constants.minimumValueForSlider)
        thirdColorSlider.maximumValue = Float(Constants.maximumValueForSlider)
        thirdColorSlider.minimumTrackTintColor = .blue
    }
    
    private func setupUI() {
        firstColorLabel.text = Constants.firstColorName
        secondColorLabel.text = Constants.secondColorName
        thirdColorLabel.text = Constants.thirdColorName
        
        firstColorValue.text = String(Constants.firstColorValue)
        secondColorValue.text = String(Constants.secondColorValue)
        thirdColorValue.text = String(Constants.thirdColorValue)
        
        mixedColorView.layer.cornerRadius = Constants.cornerRadius
        mixedColorView.backgroundColor = UIColor(
            red: CGFloat(Constants.firstColorValue),
            green: CGFloat(Constants.secondColorValue),
            blue: CGFloat(Constants.thirdColorValue),
            alpha: 1
        )
    }
}

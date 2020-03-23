//
//  ViewController.swift
//  RGBtoHex
//
//  Created by Hasan Ali on 21.03.2020.
//  Copyright © 2020 Hasan Ali Şişeci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var selectedColorLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    var selectIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        convertButton.layer.cornerRadius = 12
        
        selectedColorLabel?.layer.cornerRadius = (selectedColorLabel?.frame.size.height ?? 0)/2.0
        selectedColorLabel?.layer.masksToBounds = true
        
        resultLabel?.layer.cornerRadius = (resultLabel?.frame.size.height ?? 0)/3.0
        resultLabel?.layer.masksToBounds = true
        
        //Klavyeyi Kapatma
        let gesRecKey = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gesRecKey)
        
    }

    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        selectIndex = sender.selectedSegmentIndex
        
        
        resultLabel.text?.removeAll()
        redTextField.text?.removeAll()
        greenTextField.text?.removeAll()
        blueTextField.text?.removeAll()
        selectedColorLabel.backgroundColor = UIColor.white
        
        if selectIndex == 0 {
            convertButton.setTitle("RGB to HEX Convert", for: UIControl.State.normal)
        } else {
            convertButton.setTitle("HEX to RGB Convert", for: UIControl.State.normal)
            
        }
        
    }
    
    @IBAction func convertButtonClicked(_ sender: Any) {
        if selectIndex == 0 {
            //RGB'den Hex'e çevirme işlemi
            convertRGBtoHEX()
        } else {
            //Hex'ten RGB'ye çevirme işlemi
            convertHEXTtoRGB()
        }
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func convertRGBtoHEX() {
        
        guard let redValue = UInt8(redTextField.text!) else {return}
            
        guard let greenValue = UInt8(greenTextField.text!) else {return}
        
        guard let blueValue = UInt8(blueTextField.text!) else {return}
                    
                    //buraya kadar gelinirse kullanıcı değerleri düzgün bir şekilde girmiştir
                    
                    let redHex = String(format: "%2X", redValue)
                    let greenHex = String(format: "%2X", greenValue)
                    let blueHex = String(format: "%2X", blueValue)
                    
                    resultLabel.text = "HEX Color: #\(redHex)\(greenHex)\(blueHex)"
                    selectedColorLabel.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                
      
        
    }
    
    func convertHEXTtoRGB() {
        
        if let redValue = UInt8(redTextField.text!, radix: 16) {
        
        if let greenValue = UInt8(greenTextField.text!, radix: 16) {
            
            if let blueValue = UInt8(blueTextField.text!, radix: 16) {
                
                resultLabel.text = "Red: \(redValue) \nGreen: \(greenValue) \nBlue: \(blueValue)"
                selectedColorLabel.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                
                
            }
                }
                    }
        
    }
}


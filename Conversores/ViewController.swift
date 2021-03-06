//
//  ViewController.swift
//  Conversores
//
//  Created by kamilla.antunes on 30/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbUnit: UILabel!
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //convert(nil)
    }

    @IBAction func showNext(_ sender: UIButton) {
        guard let text = lbUnit.text else {return}
        
        switch text {
            case "Temperatura":
                lbUnit.text = "Peso"
                btUnit1.setTitle("Kilograma", for: .normal)
                btUnit2.setTitle("Libra", for: .normal)
            case "Peso":
                lbUnit.text = "Moeda"
                btUnit1.setTitle("Real", for: .normal)
                btUnit2.setTitle("Dólar", for: .normal)
            case "Moeda":
                lbUnit.text = "Distância"
                btUnit1.setTitle("Metro", for: .normal)
                btUnit2.setTitle("Kilômetro", for: .normal)
            default:
                lbUnit.text = "Temperatura"
                btUnit1.setTitle("Celcius", for: .normal)
                btUnit2.setTitle("Farenheint", for: .normal)
        }
        
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            } else {
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1
        }
        
        switch lbUnit.text {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrency()
            default:
                calcDistance()
        }
    }
    
    func calcTemperature() {
        guard let temperature = Double(tfValue.text!) else { return }
        
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Farenheint"
            lbResult.text = String(Int(temperature * 1.8 + 32.0))
        } else {
            lbResultUnit.text = "Celsius"
            lbResult.text = String(Int((temperature - 32.0) / 1.8))
        }
    }
    
    func calcWeight() {
        guard let weight = Double(tfValue.text!) else { return }
        
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Libra"
            lbResult.text = String(Int(weight * 2.2046))
        } else {
            lbResultUnit.text = "Kilograma"
            lbResult.text = String(Int(weight / 2.2046))
        }
    }
    
    func calcCurrency() {
        guard let currency = Double(tfValue.text!) else { return }
        
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Dólar"
            lbResult.text = String(Int(currency / 5.4))
        } else {
            lbResultUnit.text = "Real"
            lbResult.text = String(Int(currency * 5.4))
        }
    }
    
    func calcDistance() {
        guard let distance = Double(tfValue.text!) else { return }
        
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Kilômetros"
            lbResult.text = String(Int(distance / 1000.0))
        } else {
            lbResultUnit.text = "Metros"
            lbResult.text = String(Int(distance * 1000.0))
        }
    }
}


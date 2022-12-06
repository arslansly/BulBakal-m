//
//  ViewController.swift
//  BulBakalım
//
//  Created by Süleyman Arslan on 6.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var random: UILabel!
    @IBOutlet weak var star: UILabel!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var number: UITextField!
    
    var correct = 0
    var heart = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadDefaultData()
    }
        
    func loadDefaultData() {
        btn.layer.cornerRadius = 6
        random.text = "?"
        star.text = "⭐️ ⭐️ ⭐️"
        heart = 3
        number.text = ""
        message.text = ""
        correct = Int(arc4random_uniform(UInt32(10)))
    }
    
    
    @IBAction func btn(_ sender: Any) {
    
        print(correct)
        let number1 = number.text ?? ""
        
        if let n1 = Int(number1) {
            
            help(number: n1)
            if correct == n1 {
                print("Tahmin DOĞRU")
                random.text = "\(correct)"
                defaultAlert(title: "⭐️ TEBRİKLER ⭐️ ", message: "Sen Bir Dahisin.")
            }
            
            else {
                heart = heart - 1
                
                if heart < 1 {
                    random.text = "\(correct)"
                    defaultAlert(title: "OYUN BİTTİ!", message: "Malasef Başarısız, Yeniden Oynamak İstermisin?")

                }
                heartCalculator(heart: heart)
            }
        }
    }
    
    func defaultAlert(title:String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            switch action.style{
            case .default:
                self.loadDefaultData()
            case.cancel:
                print("ÇIKIŞ")
            default:
                print("")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func heartCalculator(heart:Int){
        
        switch heart {
        case 3:
            star.text = "⭐️ ⭐️ ⭐️"
        case 2:
            star.text = "⭐️ ⭐️"
        case 1:
            star.text = "⭐️"
        default:
            star.text = ""
            
        }
    }
    func help(number: Int){
        message.text = correct > number ? "Yukarı" : "Aşağı"
    }
}


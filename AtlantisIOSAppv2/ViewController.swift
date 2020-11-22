//
//  ViewController.swift
//  AtlantisIOSAppv2
//
//  Created by Ira Gorelick on 11/21/20.
//

import UIKit

let DomainURL = "https://atlantisschoolofcommunication.org/wp-json/wp/v2/arguments"
let TestText = "helldddddddo"

class Arguments {
    static func fetch() {
    let urlString = DomainURL
        
        if let url = URL.init(string: urlString) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                print(urlString)
                print(String.init(data: data!, encoding: .ascii) ?? "no data")
            })
            task.resume()
        }
    }
}
class ViewController: UIViewController {

    @IBOutlet weak var TextTest1: UITextView!
    
    @IBOutlet weak var TextField1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Arguments.fetch()
        
        
    }

    @IBAction func ButtonTest1(_ sender: Any) {
        TextTest1.text = "hello \(TextField1.text!)"
    }
    
    }
    


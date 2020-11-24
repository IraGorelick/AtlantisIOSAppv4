//
//  ViewController.swift
//  AtlantisIOSAppv2
//
//  Created by Ira Gorelick on 11/21/20.
//

import UIKit

struct Todo: Codable, Identifiable {
    public var id: Int
    public var title: String
    public var completed: Bool
}

class ReadWriteText{
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
 
}

let DomainURL = "https://atlantisschoolofcommunication.org/wp-json/wp/v2/arguments"
let TestText = "helldddddddo"

class Arguments {
    static func fetch() {
    let urlString = DomainURL
        
        if let url = URL.init(string: urlString) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                print("Learning Request - " + urlString)
                
                print(String.init(data: data!, encoding: .ascii) ?? "no data")
            })
            task.resume()
        }
    }
}
class FetchToDo: ObservableObject {
  // 1.
  @Published var todos = [Todo]()
     
    init() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        // 2.
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode([Todo].self, from: todoData)
                    DispatchQueue.main.async {
                        self.todos = decodedData
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}


class ViewController: UIViewController {

    @IBOutlet weak var fileOutput1: UITextField!
    @IBOutlet weak var TextTest1: UITextView!
    
    @IBOutlet weak var TextField1: UITextField!
    var tempInsert = "jdjdjdj"
    var testArray = ["Easy", "Moderate", "Veteran", "Nightmare"]
    var beliefTest = [
        "Trump": [
            "Belief1": "Trump Lost",
            "Belief2": "Trump Won"
        ],
        "Biden": [
            "Belief1": "Biden Won",
            "Belief2": "Biden Lost"
        ],
        "Harris": [
            "Belief1": "Biden Won",
            "Belief2": "Biden Lost"
        ],
        
    ]

    
    
    var extraSyntax1: Array<String> = Array<String>()
    var testURL = "https://atlantisschoolofcommunication.org/wp-json/wp/v2/arguments"
    var newurl = URL.init(string: "https://atlantisschoolofcommunication.org/wp-json/wp/v2/arguments")

 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Arguments.fetch()
        
        print(tempInsert + "  - hslslsl")
        print(tempInsert.count)
        print(testArray.count)
        print(testArray.isEmpty)
        testArray[3] = "new"
        print(testArray[1] + "hello")
        
        testArray.append("First W")
        testArray.insert("new Insert", at: 2)
        title = "actionable"
        
        
      
        var testArray2 = beliefTest["Harris"]?["Belief2"]
        
        
        // Print results
        fileOutput1.text = testArray2
        print(testArray)
        print(beliefTest)
        print(testArray2)
        
      
        
        
    }

    @IBAction func ButtonTest1(_ sender: Any) {
        TextTest1.text = "hello \(beliefTest)"
    }
    
    }
    


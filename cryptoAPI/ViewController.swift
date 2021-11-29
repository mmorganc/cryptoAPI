//
//  ViewController.swift
//  cryptoAPI
//
//  Created by Matthew  Morgan on 11/18/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if let symbol = textField.text {
            
            getData(symbol : symbol)
            
        }
        
        
    }
    

    
    var url = "https://min-api.cryptocompare.com/data/price?tsyms=USD"
    
    func getData(symbol : String) {
        
        url = "\(url)&fsym=\(symbol)"
        
        
        //1. Initialize the URL
        
        guard let url = URL(string: url) else {return}
        
        //2. Initialize Task and URL Session
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else {return}
                
                print("Data Recieved")
                
                
            do {
                
            let Result = try JSONDecoder().decode(APIResponse.self, from: data)
                print(Result.USD)
                    
                    //who.what = value
                    //"\(Result.USD) allows the float value to be passed through as text
                    DispatchQueue.main.async {
                    
                        self.outputLabel.text = "\(Result.USD)"
                    
                    }
            }
                catch {
                        print(error.localizedDescription)
                    }
    
  
        
        
    }
        
        task.resume()
        //Closure - create a function within a function
        
    }
    
    //5. Create a structure and mention what the parameters are
    
    struct APIResponse : Codable {
        
        let USD : Float }
    //Steps to Use an API in xCode, converting JSON object -> Swift object
    
    //1. Initialize URL
    
    //2. Initialize Task and URL Session
    
    //3. Check Optionals
    
    //4. Resume Task
    
    //5. Define Response Parameters in a Structure
    
    


    




}

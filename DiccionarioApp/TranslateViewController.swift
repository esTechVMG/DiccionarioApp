//
//  ViewController.swift
//  DiccionarioApp
//
//  Created by esTechVMG on 4/12/20.
//

import UIKit

class TranslateViewController : UIViewController,UITabBarControllerDelegate {
    
    
    /*func getDictionary() -> Diccionario {
        return dict
    }
    
    func setDictionary(dict: Diccionario) {
        self.dict = dict
    }*/
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    var dict:Diccionario!
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputTextField: UITextField!
    @IBOutlet weak var translateButton: UIButton!
    @IBOutlet weak var language1: UILabel!
    @IBOutlet weak var language2: UILabel!
    
    var myTabBar:MyUITabBarController!
    override func viewDidLoad() {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        //print(dict!.searchTranslation(word: "Hello"))
        myTabBar = parent! as! MyUITabBarController
        dict = myTabBar.dict!
        print(dict!.searchTranslation(word: "Hello"))
        
        
        let search = dict.searchTranslation(word: "payaso")
        print(search)
    }
    @IBAction func translateButtonPressed(_ sender: Any) {
        let i:[(String,String)] = dict!.searchTranslation(word: inputTextField.text!)
        if i.isEmpty {
            print(i)
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        dict!.addToWordList(word: ("Hola","Hello"))
    }
    
    
    /*func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            if let answer = ac.textFields![0].text! as Optional{
                print(answer)
            }
            
        }

        ac.addAction(submitAction)

        present(ac, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        promptForAnswer()
    }*/
}


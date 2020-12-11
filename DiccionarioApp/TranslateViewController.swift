//
//  ViewController.swift
//  DiccionarioApp
//NSObject, UICollectionViewDataSource, UICollectionViewDelegate
//  Created by esTechVMG on 4/12/20.
//

import UIKit
class TranslateViewController : UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    //Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var dict:Diccionario=Diccionario.init();
    
    //IBOutlets

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputTextField: UITextField!
    @IBOutlet weak var translateButton: UIButton!
    @IBOutlet weak var language1: UILabel!
    @IBOutlet weak var language2: UILabel!
    
    //IBActions
    @IBAction func translateButtonPressed(_ sender: Any) {
        let i:[(String,String)] = dict.searchTranslation(word: inputTextField.text!)
        if i.isEmpty {
            print(i)
            outputTextField.text = "No se encontro traduccion"
        }else{
            let order = inputTextField.text?.lowercased() == i[0].0
            outputTextField.text =  order ? i[0].1 : i[0].0
            let lang2:String = "English",lang1:String = "Spanish"
            language1.text = order ? lang1 : lang2
            language2.text = order ? lang2 : lang1
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
    }
    @IBAction func addTranslationBtnPressed(_ sender: Any) {
        let ac = UIAlertController(title: "Añadir palabra", message: nil, preferredStyle: .alert)
        
        ac.addTextField(configurationHandler: {(textField) in
            textField.placeholder = "Palabra en Español"
        })
        
        
        ac.addTextField(configurationHandler: {(textField) in
            textField.placeholder = "Palabra en Ingles"
        })
        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: {(action) in
            let a1:String = ac.textFields![0].text!
            let a2:String = ac.textFields![1].text!
            print(a1)
            print(a2)
            if !self.dict.addToWordList(word: (a1,a2)){
                print("Error Adding word")
            }else{
                self.collection.reloadData()
            }
        })
        
        ac.addAction(submitAction)
        present(ac, animated: true, completion:nil)
    }
    //UICollectionView functions
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 20)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dict.getWordListSize()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WordCell", for: indexPath) as! MyCollectionCell
        //Untested
        let word = dict.getWordAtIndex(pos: indexPath.row)
        cell.spanish.text = word.0
        cell.english.text = word.1
        return cell
    }
}

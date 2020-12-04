//
//  MyUITabBarController.swift
//  DiccionarioApp
//
//  Created by A4-iMAC01 on 04/12/2020.
//

import UIKit
class MyUITabBarController: UITabBarController, DictionaryMaster {

    @IBOutlet weak var tabBarOutlet: UITabBar!
    
    override func viewDidLoad() {
        tabBarOutlet.delegate=self
    }
    func searchTranslation(word: String) -> [(String, String)] {
        dict!.searchTranslation(word: word)
    }
    
    func addToWordList(word: (spanish: String, english: String)) -> Bool {
        dict!.addToWordList(word: word)
    }
    
    func deleteWord(word: String) -> Bool {
        dict!.deleteWord(word: word)
    }
    
    func modifyWord(pos: Int, newModify: (String, String)) {
        dict!.modifyWord(pos: pos, newModify: newModify)
    }
    
    func getWordAtIndex(pos: Int) -> (String, String) {
        return dict!.getWordAtIndex(pos: pos)
    }
    
    func getWordListSize() -> Int {
        return dict!.getWordListSize()
    }
    
    func checkEmpty(word: (String, String)) -> Bool {
        return dict!.checkEmpty(word: word)
    }
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var dict:Diccionario? = Diccionario.init()
}

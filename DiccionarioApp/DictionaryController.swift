//
//  DiccionarioController.swift
//  DiccionarioApp
//
//  Created by A4-iMAC01 on 04/12/2020.
//

import Foundation
protocol DictionaryMaster {
    func searchTranslation(word:String) -> [(String,String)]
    func addToWordList(word:(spanish:String, english:String)) -> Bool
    func deleteWord(word:String) -> Bool
    func modifyWord(pos:Int,newModify:(String,String)) -> Void
    func getWordAtIndex(pos:Int) -> (String,String)
    func getWordListSize() -> Int
    func checkEmpty(word:(String,String)) -> Bool
}

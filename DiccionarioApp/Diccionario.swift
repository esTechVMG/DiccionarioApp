import Foundation

class Diccionario{
    var wordList:Array<(String,String)>=[
        ("payaso","clown"),
        ("gratis","free"),
        ("capa","layer"),
        ("perro","dog"),
        ("cangrejo","crab"),
        ("realidad","reality")
    ]
    func searchTranslation(word:String) -> String {
        for dictWord in wordList as Array<(String,String)> {
            if dictWord.0 == word {
                return dictWord.1
            }
            if dictWord.1 == word{
                return dictWord.0
            }
        }
        return "Error: no se encontro ninguna traduccion"
    }
    func addToWordList(word:(spanish:String, english:String)) -> Bool {
        if word.0.isEmpty || word.1.isEmpty{
            return false
        }else{
            wordList.append(word)
            return true
        }
    }
    func deleteWord(word:String) -> Bool {
        for index in wordList.startIndex ... wordList.endIndex-1 {
            if wordList[index].0 == word || wordList[index].1 == word {
                wordList.remove(at: index)
                return true
            }
        }
        return false
    }
    func modifyWord() -> Void {
        
        return
    }
}





import Foundation

class Diccionario{
    private var wordList:Array<(String,String)>
    
    init(){
        wordList=[
            ("payaso","clown"),
            ("gratis","free"),
            ("capa","layer"),
            ("perro","dog"),
            ("cangrejo","crab"),
            ("realidad","reality")
        ]
    }
    public func searchTranslation(word:String) -> [(String,String)] {
        return wordList.filter({(wordItem:(es:String,en:String)) in return wordItem.0.contains(word) || wordItem.1.contains(word)})
    }
    public func addToWordList(word:(spanish:String, english:String)) -> Bool {
        if checkEmpty(word: word){
            return false
        }else{
            wordList.append(word)
            return true
        }
    }
    public func deleteWord(word:String) -> Bool {
        for index in wordList.startIndex ... wordList.endIndex-1 {
            if wordList[index].0 == word || wordList[index].1 == word {
                wordList.remove(at: index)
                return true
            }
        }
        return false
    }
    public func modifyWord(pos:Int,newModify:(String,String)) -> Void {
        if(checkEmpty(word: newModify)){
            wordList[pos] = newModify
        }
    }
    //Added just for easing app development. not sure if its really going to be used
    public func getWordAtIndex(pos:Int) -> (String,String) {
        return wordList[pos]
    }
    
    public func checkEmpty(word:(String,String)) -> Bool {
        return !word.0.isEmpty || word.1.isEmpty
    }
}





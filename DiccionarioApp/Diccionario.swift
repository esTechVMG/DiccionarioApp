import Foundation

class Diccionario{
    private var wordList:Array<(String,String)> = [
            ("payaso","clown"),
            ("gratis","free"),
            ("capa","layer"),
            ("perro","dog"),
            ("cangrejo","crab"),
            ("realidad","reality")
    ]
    public func searchTranslation(word:String) -> [(String,String)] {
        return wordList.filter({(wordItem:(es:String,en:String)) in return wordItem.es.contains(word.lowercased()) || wordItem.en.contains(word.lowercased())})
    }
    public func addToWordList(word:(spanish:String, english:String)) -> Bool {
        let wordLow = lowCase(word: word)
        if checkEmpty(word: wordLow) && checkRepeated(word: wordLow){
            return false
        }else{
            print(wordLow)
            wordList.append(wordLow)
            return true
        }
    }
    
    public func deleteWordAtIndex(pos:Int){
        wordList.remove(at: pos)
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
    public func getWordListSize() -> Int{
        return wordList.count
    }
    
    private func checkEmpty(word:(String,String)) -> Bool {
        return word.0.isEmpty || word.1.isEmpty
    }
    private func checkRepeated(word:(spanish:String, english:String)) -> Bool {
        return searchTranslation(word: word.spanish).isEmpty && searchTranslation(word: word.english).isEmpty
    }
    private func lowCase(word:(spanish:String,english:String)) -> (String,String) {
        return (word.spanish.lowercased(),word.english.lowercased())
    }
}





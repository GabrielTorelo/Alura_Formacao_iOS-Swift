import UIKit

class Refeicao: NSObject, NSCoding {
    
    // MARK: Attributes
    let name: String
    let happ: Int
    var items: [Item] = []
    
    // MARK:  Constructor
    init(name: String, happ: Int, items: [Item] = []) {
        self.name = name
        self.happ = happ
        self.items = items
    }
    
    // MARK: Create encoded file in device with "refeicao" data
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(happ, forKey: "happ")
        coder.encode(items, forKey: "items")
    }
    
    // MARK: Create decoder for created file
    required init?(coder: NSCoder) {
        
        // MARK: Decoding, casting type Any to const/varType and storing in const/var
        name = coder.decodeObject(forKey: "name") as! String
        happ = coder.decodeInteger(forKey: "happ")
        items = coder.decodeObject(forKey: "items") as! [Item]
    }
    
    // MARK: Create method which return total calories
    func totCal() -> Double {
        var tot = 0.0
        
        for item in items {
            tot += item.cal
        }
        
        return tot
    }
    
    // MARK: Create method which return details
    func details() -> String {
        
        var msg = "Felic: \(happ)"
        
        // MARK: Get all names and calories of item
        for item in items {
            msg += ", \(item.name) - calorias: \(item.cal)"
        }
        
        return msg
    }
}

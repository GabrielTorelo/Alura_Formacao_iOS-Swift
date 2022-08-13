import UIKit

class Item: NSObject, NSCoding {
    
    // MARK: Attributes
    let name: String
    let cal: Double

    // MARK: Constructor
    init(name: String, cal: Double) {
        self.name = name
        self.cal = cal
    }
    
    // MARK: Create encoded file in device with "refeicao" data
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(cal, forKey: "cal")
    }
    
    // MARK: Create decoder for created file
    required init?(coder: NSCoder) {
        
        // MARK: Decoding, casting type Any to constType and storing in const
        name = coder.decodeObject(forKey: "name") as! String
        cal = coder.decodeDouble(forKey: "cal")
    }
    
    // MARK: Create method which return details
    func details() -> String {
        let msg = "Calorias: \(cal)"
        
        return msg
    }
}

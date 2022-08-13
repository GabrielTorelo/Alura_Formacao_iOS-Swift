import UIKit

// Mark: Declaration constants
let nome = "Churrasco"
let felic = 5
let calorias = 79.5
let vegetal = false

// Mark: Create method
func alimentoConsumido(_ n: String, _ f: Int, _ c: Double) {
    print("Comi \(n), e fiquei com \(f) de felicidade. Com isso, consumi \(c) calorias")
}

// Mark: Call method
alimentoConsumido(nome, felic, calorias)

// ------------------------ //

// Mark: Declaration constants/variables
let calories1 = [50.5, 100, 300, 500]
var total1 = 0.0
var total2 = 0.0
var total3 = 0.0

// Mark: for -> static positions
for i in 0...3 {
    total1 += calories1[i]
}

// Mark: for -> total array positions - 1
for i in 0...calories1.count-1 {
    total2 += Double(calories1[i])
}

// Mark: for -> each array element *[THE BEST]*
for cal in calories1 {
    total3 += cal
}

print("Total de calorias consumidas é \(total1)")
print("Total de calorias consumidas é \(total2)")
print("Total de calorias consumidas é \(total3)")

// ------------------------ //

// Mark: Declaration variable
var calories2 = [50.0, 190, 300, 500]

// Mark: Create method with return double
func todasCalo(totCal: [Double]) -> Double {
    var total = 0.0
    
    for cal in calories2 {
        total += cal
    }
    
    return total
}

// Mark: Call method and store in constant
let totalCal = todasCalo(totCal: calories2)

print("Total de calorias consumidas é \(totalCal)")

// ------------------------ //

// Mark: Declaration variables
var nome2 = "Churros"
var felic2 = 10

// Mark: Create class
class Refeicao {
    var nome: String
    var felic: Int
    
    // Mark: Create constructor method
    init(nome: String, felic: Int) {
        self.nome = nome
        self.felic = felic
    }
    
    // Mark: Create method with return array
    func getValues() -> [(String, Int)] {
        return [(nome, felic)]
    }
}

// Mark: Call method and store in constant
let refeicao1 = Refeicao(nome: nome, felic: felic)
let refeicao2 = Refeicao(nome: nome2, felic: felic2)

print("Refeição 1 (Class): \(refeicao1.getValues()), Refeição 2 (Class): \(refeicao2.getValues())")

// ------------------------ //

// Mark: Create Struct -> don't need a constructor
struct Refeicao2 {
    var nome: String
    var felic: Int
    
    // Mark: Create method with return array
    func getValues() -> [(String, Int)] {
        return [(nome, felic)]
    }
}

var refeicao3 = Refeicao2(nome: "Arroz", felic: 10)

print("Refeição 3 (Struct): \(refeicao3.getValues())")

// ------------------------ //

// Mark: Declaration variables
var nome3 = "Macarrão"
var felic3 = 7

// Mark: Create class
class Refeicao3 {
    var nome: String?
    var felic: Int?
    
    func getDataIfLet(){
        if let newNome = nome, let newFelic = felic {
            print("Nome: \(newNome) | Felicidade: \(newFelic) - (ifLed)")
        }
        else {
            print("Campos não podem ser nulos (ifLet)!")
        }
        
    }
    
    func getDataGuard(){
        guard let newNome = nome, let newFelic = felic else {
            print("Campos não podem ser nulos (guard)!")
            return
        }
        
        print("Nome: \(newNome) | Felicidade: \(newFelic) - (guard)")
    }

}

// Mark: initialize class
let refeicao4 = Refeicao3()
refeicao4.nome = nome3
refeicao4.felic = felic3

// Mark: Call methods
refeicao4.getDataIfLet()
refeicao4.getDataGuard()

// ------------------------ //

// Mark: Declaration variables
var nome4 = "Lasanha"
var felic4 = 20

// Mark: Create class
class Refeicao4 {
    var nome: String
    var felic: Int
    var itens: [Item] = []
    
    // Mark: Create constructor method
    init(nome: String, felic: Int) {
        self.nome = nome
        self.felic = felic
    }
    
    func getData() {
        guard let name = itens.first?.nome, let cal = itens.first?.calorias else {
            print("Campos não podem ser nulos!")
            return
        }
        print("Comida: \(nome), Felicidade: \(felic) | Array -> Nome: \(name), Calorias: \(cal)")
    }
}

// Mark: Create class
class Item {
    var nome: String
    var calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}

// Mark: Initialize class and create item
var arroz = Item(nome: "arroz", calorias: 51.0)
var refeicao5 = Refeicao4(nome: nome4, felic: felic4)
refeicao5.itens.append(arroz)

// Mark: Call method getData
refeicao5.getData()

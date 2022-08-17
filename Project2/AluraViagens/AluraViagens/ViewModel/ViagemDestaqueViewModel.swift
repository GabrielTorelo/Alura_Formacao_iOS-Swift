import Foundation

class ViagemDestaqueViewModel: ViagemViewModel {
    
    // MARK: Implement variables (return to get)
    // {
    var titleSession: String {
        return "Destaques"
    }
    //
    var type: ViagemViewModelType {
        return .destaques
    }
    //
    var travel: [Viagem]
    //
    var numbLine: Int {
        return travel.count
    }
    // }
    
    // MARK: Create constructor method
    init(_ travel: [Viagem]) {
        self.travel = travel
    }
}

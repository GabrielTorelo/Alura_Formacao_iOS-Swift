import Foundation

// MARK: All travels type
enum ViagemViewModelType: String {
    case destaques
    case ofertas
    case internacionais
}

// MARK: All visualize models
protocol ViagemViewModel {
    var titleSession: String { get }
    var type: ViagemViewModelType { get }
    var travel: [Viagem] { get set }
    var numbLine: Int { get }
}

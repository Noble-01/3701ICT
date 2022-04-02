import Foundation
import SwiftUI
import Combine

struct Task : Identifiable {
    var id = String()
    var Item = String()
    
    //Add more complicated stuff later if you want.
    
}

class TaskStore : ObservableObject {
    @Published var tasks = [Task]()
}

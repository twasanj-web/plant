

import Foundation
import Combine



class MyPlantsViewModel: ObservableObject {
    
    @Published var isShowingSetReminderSheet = false
    
    func showSetReminderSheet() {
        isShowingSetReminderSheet = true
    }
}

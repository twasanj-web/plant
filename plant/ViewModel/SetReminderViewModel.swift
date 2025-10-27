import Foundation
import Combine

class SetReminderViewModel: ObservableObject {
    
    @Published var plant = Plant()
    
    
    let roomOptions: [Room] = Room.allCases
    let lightOptions: [Light] = Light.allCases
    
   
    let wateringDaysOptions: [WateringDays] = WateringDays.allCases
    let waterAmountOptions: [WaterAmount] = WaterAmount.allCases
    
    @Published var lightSelection: String = Light.fullSun.rawValue
    
  
    
    func saveReminder() {
        // يمكنك هنا إضافة منطق الحفظ الفعلي
        print("Reminder saved for plant: \(plant.name)")
        print("Room: \(plant.room.rawValue), Light: \(plant.light.rawValue)")
        print("Watering: \(plant.wateringDays.rawValue), Amount: \(plant.waterAmount.rawValue)") // للتأكد
    }
}

import Foundation
import Combine

class SetReminderViewModel: ObservableObject {
    
    @Published var plant = Plant()
    
    // الخيارات التي سيتم عرضها في الواجهة
    let roomOptions: [Room] = Room.allCases
    let lightOptions: [Light] = Light.allCases
    
    // ✅ --- أضف هذين السطرين ---
    let wateringDaysOptions: [WateringDays] = WateringDays.allCases
    let waterAmountOptions: [WaterAmount] = WaterAmount.allCases
    
    @Published var lightSelection: String = Light.fullSun.rawValue
    
    init() {
        // يمكنك ترك هذا فارغاً
    }
    
    func saveReminder() {
        // يمكنك هنا إضافة منطق الحفظ الفعلي
        print("Reminder saved for plant: \(plant.name)")
        print("Room: \(plant.room.rawValue), Light: \(plant.light.rawValue)")
        print("Watering: \(plant.wateringDays.rawValue), Amount: \(plant.waterAmount.rawValue)") // للتأكد
    }
}

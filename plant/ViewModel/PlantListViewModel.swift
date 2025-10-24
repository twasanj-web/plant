//
//import Foundation
//import Combine
//
//class PlantListViewModel: ObservableObject {
//    @Published var plants: [NewPlant] = []
//
//    init() {
//        // يمكن إضافة منطق تحميل البيانات هنا إذا كانت موجودة
//    }
//
//    func addPlant(name: String, location: String, wateringNeeds: String, sunExposure: String) {
//        let newPlant = NewPlant(name: name, location: location, wateringNeeds: wateringNeeds, sunExposure: sunExposure)
//        plants.append(newPlant)
//    }
//}
// ملف: PlantListViewModel.swift (النسخة المصححة)
import Foundation
import Combine
import SwiftUI // ✨ تم إضافة هذا السطر لإصلاح خطأ الحذف

class PlantListViewModel: ObservableObject {
    @Published var plants: [Plant] = []
    
    init() {
        // يمكنك إضافة بيانات تجريبية هنا إذا أردت
        // addSamplePlants()
    }

    // إضافة نبتة جديدة
    func addPlant(_ plant: Plant) {
        plants.append(plant)
    }

    // إزالة نبتة (ستعمل الآن بدون أخطاء)
    func removePlant(at indexSet: IndexSet) {
        plants.remove(atOffsets: indexSet)
    }
    
    // دالة اختيارية لإضافة بيانات تجريبية
    private func addSamplePlants() {
        plants = [
            Plant(name: "Monstera", room: .kitchen, light: .partialSun, wateringDays: .onceAWeek, waterAmount: .medium, isSelected: true),
            Plant(name: "Pothos", room: .bedroom, light: .lowLight, wateringDays: .every10Days, waterAmount: .low),
            Plant(name: "Orchid", room: .livingRoom, light: .lowLight, wateringDays: .every3Days, waterAmount: .low)
        ]
    }
}

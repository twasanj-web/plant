
//import Foundation
//import Combine
//import SwiftUI
//
//class PlantListViewModel: ObservableObject {
//    @Published var plants: [Plant] = []
//    
//    init() {
//        // يمكنك إضافة بيانات تجريبية هنا إذا أردت
//        // addSamplePlants()
//    }
//
//    // إضافة نبتة جديدة
//    func addPlant(_ plant: Plant) {
//        plants.append(plant)
//    }
//
//    // إزالة نبتة (ستعمل الآن بدون أخطاء)
//    func removePlant(at indexSet: IndexSet) {
//        plants.remove(atOffsets: indexSet)
//    }
//    
//    // دالة اختيارية لإضافة بيانات تجريبية
//    private func addSamplePlants() {
//        plants = [
//            Plant(name: "Monstera", room: .kitchen, light: .partialSun, wateringDays: .onceAWeek, waterAmount: .medium, isSelected: true),
//            Plant(name: "Pothos", room: .bedroom, light: .lowLight, wateringDays: .every10Days, waterAmount: .low),
//            Plant(name: "Orchid", room: .livingRoom, light: .lowLight, wateringDays: .every3Days, waterAmount: .low)
//        ]
//    }
//}


// PlantListViewModel.swift

import Foundation
import Combine
import SwiftUI

class PlantListViewModel: ObservableObject {
    @Published var plants: [Plant] = []
    
    // ✅ --- التعديل الوحيد هنا --- ✅
    var allPlantsSelected: Bool {
        // إذا كانت القائمة فارغة، لا تعتبر مكتملة
        if plants.isEmpty {
            return false
        }
        // تحقق مما إذا كانت كل النباتات في القائمة محددة
        return plants.allSatisfy { $0.isSelected }
    }
    // ---------------------------------
    
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
        // قمت بتغيير isSelected إلى false للبيانات التجريبية للبدء بشكل صحيح
        plants = [
            Plant(name: "Monstera", room: .kitchen, light: .partialSun, wateringDays: .onceAWeek, waterAmount: .medium, isSelected: false),
            Plant(name: "Pothos", room: .bedroom, light: .lowLight, wateringDays: .every10Days, waterAmount: .low),
            Plant(name: "Orchid", room: .livingRoom, light: .lowLight, wateringDays: .every3Days, waterAmount: .low)
        ]
    }
}

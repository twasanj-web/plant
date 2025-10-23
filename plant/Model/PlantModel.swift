//import Foundation
//
////================================================
////  ملف: PlantModel.swift
////  المجلد: Models
////  الغرض: تعريف نماذج البيانات للتطبيق
////================================================
//
//// Enum لخيارات الغرفة
//enum Room: String, CaseIterable, Identifiable {
//    case bedroom = "Bedroom"
//    case livingRoom = "Living Room"
//    case kitchen = "Kitchen"
//    case balcony = "Balcony"
//    case bathroom = "Bathroom"
//    
//    var id: Self { self }
//}
//
//// Enum لخيارات الإضاءة
//enum Light: String, CaseIterable, Identifiable {
//    case fullSun = "Full Sun"
//    case partialSun = "Partial Sun"
//    case lowLight = "Low Light"
//    
////    var id: Self { self }
//    var id : String {rawValue}
//}
//
//// --- جديد ---
//// Enum لخيارات أيام الري
//enum WateringDays: String, CaseIterable, Identifiable {
//    case everyDay = "Every day"
//    case every2Days = "Every 2 days"
//    case every3Days = "Every 3 days"
//    case onceAWeek = "Once a week"
//    case every10Days = "Every 10 days"
//    case every2Weeks = "Every 2 weeks"
//    
//    var id: Self { self }
//}
//
//// --- جديد ---
//// Enum لخيارات كمية الماء
//enum WaterAmount: String, CaseIterable, Identifiable {
//    case low = "20-50 ml"
//    case medium = "50-100 ml"
//    case high = "100-200 ml"
//    case veryHigh = "200-300 ml"
//    
//    var id: Self { self }
//}
//
//
//// Struct لبيانات النبتة (تم تحديثه)
//struct Plant {
//    var name: String = ""
//    var room: Room = .bedroom           // قيمة افتراضية للغرفة
//    var light: Light = .fullSun      // قيمة افتراضية للإضاءة
//    
//    // --- جديد ---
//    var wateringDays: WateringDays = .everyDay// قيمة افتراضية لأيام الري
//    var waterAmount: WaterAmount = .low      // قيمة افتراضية لكمية الماء
//}
//
//
//struct NewPlant: Identifiable {
//    let id = UUID()
//    var name: String
//    var location: String
//    var wateringNeeds: String
//    var sunExposure: String
//}


import Foundation

//================================================
//  ملف: PlantModel.swift
//  المجلد: Models
//  الغرض: تعريف نماذج البيانات للتطبيق
//================================================

// Enum لخيارات الغرفة
enum Room: String, CaseIterable, Identifiable {
    case bedroom = "Bedroom"
    case livingRoom = "Living Room"
    case kitchen = "Kitchen"
    case balcony = "Balcony"
    case bathroom = "Bathroom"
    
    var id: Self { self }
}

// Enum لخيارات الإضاءة
enum Light: String, CaseIterable, Identifiable {
    case fullSun = "Full Sun"
    case partialSun = "Partial Sun"
    case lowLight = "Low Light"
    
    var id: Self { self }
}

// Enum لخيارات أيام الري
enum WateringDays: String, CaseIterable, Identifiable {
    case everyDay = "Every day"
    case every2Days = "Every 2 days"
    case every3Days = "Every 3 days"
    case onceAWeek = "Once a week"
    case every10Days = "Every 10 days"
    case every2Weeks = "Every 2 weeks"
    
    var id: Self { self }
}

// Enum لخيارات كمية الماء
enum WaterAmount: String, CaseIterable, Identifiable {
    case low = "20-50 ml"
    case medium = "50-100 ml"
    case high = "100-200 ml"
    case veryHigh = "200-300 ml"
    
    var id: Self { self }
}

// Struct لبيانات النبتة
struct Plant {
    var name: String = ""
    var room: Room = .bedroom           // قيمة افتراضية للغرفة
    var light: Light = .fullSun         // قيمة افتراضية للإضاءة
    var wateringDays: WateringDays = .everyDay // قيمة افتراضية لأيام الري
    var waterAmount: WaterAmount = .low        // قيمة افتراضية لكمية الماء
}

// Struct آخر يمكن استخدامه للنباتات الجديدة أو لقوائم العرض
struct NewPlant: Identifiable {
    let id = UUID()
    var name: String
    var location: String
    var wateringNeeds: String
    var sunExposure: String
}

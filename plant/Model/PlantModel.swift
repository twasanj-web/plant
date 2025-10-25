


import Foundation

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
    
    var id: String { rawValue }
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

// Struct لبيانات النبتة (النسخة النهائية والصحيحة)
struct Plant: Identifiable {
    let id = UUID()
    var name: String = ""
    var room: Room = .bedroom
    var light: Light = .fullSun
    var wateringDays: WateringDays = .everyDay
    var waterAmount: WaterAmount = .low
    var isSelected: Bool = false // ضروري لشريط التقدم والاختيار
}

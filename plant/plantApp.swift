//
//  plantApp.swift
//  plant
//
//  Created by wasan jayid althagafi on 27/04/1447 AH.
//

//import SwiftUI
//
//@main
//struct plantApp: App {
//    var body: some Scene {
//        WindowGroup {
//            MyPlantsView()
//        }
//    }
//}
//
//import SwiftUI
//
//@main
//struct plantApp: App {
//    // 1. قم بإنشاء الـ ViewModel الرئيسي هنا كـ @StateObject
//    // سيتم إنشاء هذا الكائن مرة واحدة فقط طوال عمر التطبيق
//    @StateObject private var plantListViewModel = PlantListViewModel()
//
//    var body: some Scene {
//        WindowGroup {
//            // 2. قم بتمرير الـ ViewModel إلى الواجهة الجذرية (Root View)
//            MyPlantsView(plantListViewModel: plantListViewModel)
//        }
//    }
//}


import SwiftUI

@main
struct plantApp: App {
    
    @StateObject private var plantListViewModel = PlantListViewModel()

    // --- أضف هذا الجزء ---
    init() {
        // هذا الكود سيتم تشغيله مرة واحدة فقط عند بدء تشغيل التطبيق
        // وهو المكان المثالي لطلب إذن الإشعارات
        NotificationManager.shared.requestAuthorization()
    }
    // --------------------

    var body: some Scene {
        WindowGroup {
            MyPlantsView(plantListViewModel: plantListViewModel)
        }
    }
}

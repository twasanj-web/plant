

import Foundation
import Combine

//================================================
//  ملف: MyPlantsViewModel.swift
//  المجلد: ViewModels
//  الغرض: هذا هو الـ ViewModel (وسيط العرض)
//================================================

class MyPlantsViewModel: ObservableObject {
    
    @Published var isShowingSetReminderSheet = false
    
    func showSetReminderSheet() {
        isShowingSetReminderSheet = true
    }
}

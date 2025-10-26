//
////
//import SwiftUI
//
//// View: مسؤولة فقط عن عرض واجهة "نباتاتي"
//struct MyPlantsView: View {
//    
//    // 1. اجعل MyPlantsView تستقبل الـ ViewModel الخاص بالقائمة
//    // هذا الـ ViewModel سيتم تمريره من المشهد (Scene) الرئيسي للتطبيق
//    @ObservedObject var plantListViewModel: PlantListViewModel
//    
//    // @StateObject لإنشاء وإدارة نسخة من الـ ViewModel الخاص بهذه الواجهة فقط
//    @StateObject private var viewModel = MyPlantsViewModel()
//    
//    var body: some View {
//        // استخدام NavigationView في المستوى الأعلى لضمان عمل الـ Toolbar والـ Navigation
//        NavigationView {
//            // 3. ✅ الحل: بناءً على حالة القائمة، نعرض إما شاشة الترحيب أو قائمة النباتات
//            Group {
//                if plantListViewModel.plants.isEmpty {
//                    // إذا كانت القائمة فارغة، اعرض واجهة الترحيب
//                    emptyStateView
//                } else {
//                    // إذا لم تكن القائمة فارغة، اعرض PlantListView
//                    // 4. ✅ الحل: تمرير نفس الـ plantListViewModel لضمان استخدام نفس البيانات
//                    PlantListView(viewModel: plantListViewModel)
//                }
//            }
//            .navigationBarHidden(true) // إخفاء شريط التنقل في كلتا الحالتين
//            .preferredColorScheme(.dark)
//            .sheet(isPresented: $viewModel.isShowingSetReminderSheet) {
//                // 5. ✅ تمرير الـ ViewModel المطلوب إلى SetReminderView
//                SetReminderView(
//                    plantListViewModel: plantListViewModel,
//                    isPresented: $viewModel.isShowingSetReminderSheet
//                )
//            }
//        }
//    }
//    
//    // فصل واجهة حالة القائمة الفارغة في متغير لسهولة القراءة
//    private var emptyStateView: some View {
//        VStack(alignment: .leading) {
//            
//            Text("My Plants 🌱")
//                .font(.largeTitle).fontWeight(.bold).foregroundColor(.white)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(.top, 20)
//                .padding(.leading, 16)
//            
//            Divider()
//                .background(Color.white.opacity(0.5))
//                .padding(.horizontal, 16)
//            
//            Spacer()
//            
//            HStack {
//                Spacer()
//                
//                 Image("pp") // تأكد من وجود هذا الأصل (Asset) في المشروع
//                     .resizable()
//                     .aspectRatio(contentMode: .fit)
//                     .frame(height: 200)
//                     .padding(.top, 100)
//                Spacer()
//            }
//            
//            Spacer()
//                .frame(height: 16)
//            
//            VStack(spacing: 8) {
//                Text("Start your plant journey!")
//                    .font(.system(size: 25, weight: .semibold))
//                    .foregroundColor(.white)
//                
//                Text("Now all your plants will be in one place and\nwe will help you take care of them :)🪴")
//                    .font(.system(size: 16, weight: .regular))
//                    .foregroundColor(Color(red: 159/255, green: 159/255, blue: 145/255).opacity(0.7))
//                    .multilineTextAlignment(.center)
//                    .padding(.horizontal, 40)
//            }
//            .frame(maxWidth: .infinity)
//            
//            Spacer()
//            
//            Button("Set Plant Reminder") {
//                viewModel.showSetReminderSheet()
//            }
//            .buttonStyle(.borderedProminent)
//            .tint(Color("g"))
//            .frame(width: 280, height: 44)
//            .font(.system(size: 17, weight: .semibold))
//            .foregroundColor(.white)
//            .frame(maxWidth: .infinity)
//            .padding(.bottom, 60)
//        }
//        .edgesIgnoringSafeArea(.bottom)
//    }
//}
//
//#Preview{
//    // عند المعاينة، يجب تمرير نسخة من ViewModel
//    MyPlantsView(plantListViewModel: PlantListViewModel())
//}
//


// MyPlantsView.swift

import SwiftUI

// View: مسؤولة فقط عن عرض واجهة "نباتاتي"
struct MyPlantsView: View {
    
    // نستقبل الـ ViewModel الرئيسي للتطبيق
    @ObservedObject var plantListViewModel: PlantListViewModel
    
    // ViewModel خاص بهذه الواجهة لإدارة الـ sheet
    @StateObject private var viewModel = MyPlantsViewModel()
    
    var body: some View {
        NavigationView {
            // ✅ --- التعديل الرئيسي هنا --- ✅
            Group {
                if plantListViewModel.plants.isEmpty {
                    // الحالة 1: إذا كانت القائمة فارغة، اعرض شاشة الترحيب
                    emptyStateView
                    
                } else if plantListViewModel.allPlantsSelected {
                    // الحالة 2: إذا كانت كل النباتات محددة، اعرض شاشة الاكتمال
                    AllRemindersCompletedView(viewModel: plantListViewModel)
                    
                } else {
                    // الحالة 3: وإلا، اعرض قائمة النباتات العادية
                    PlantListView(viewModel: plantListViewModel)
                }
            }
            // ---------------------------------
            .navigationBarHidden(true)
            .preferredColorScheme(.dark)
            .sheet(isPresented: $viewModel.isShowingSetReminderSheet) {
                SetReminderView(
                    plantListViewModel: plantListViewModel,
                    isPresented: $viewModel.isShowingSetReminderSheet
                )
            }
            // لإضافة تأثير انتقال ناعم بين الواجهات
            .animation(.easeInOut, value: plantListViewModel.plants.isEmpty)
            .animation(.easeInOut, value: plantListViewModel.allPlantsSelected)
        }
    }
    
    // (باقي الكود يبقى كما هو بدون أي تغيير)
    // ...
    // ...
    
    // فصل واجهة حالة القائمة الفارغة في متغير لسهولة القراءة
    private var emptyStateView: some View {
        VStack(alignment: .leading) {
            
            Text("My Plants 🌱")
                .font(.largeTitle).fontWeight(.bold).foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .padding(.leading, 16)
            
            Divider()
                .background(Color.white.opacity(0.5))
                .padding(.horizontal, 16)
            
            Spacer()
            
            HStack {
                Spacer()
                
                 Image("pp") // تأكد من وجود هذا الأصل (Asset) في المشروع
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(height: 200)
                     .padding(.top, 100)
                Spacer()
            }
            
            Spacer()
                .frame(height: 16)
            
            VStack(spacing: 8) {
                Text("Start your plant journey!")
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundColor(.white)
                
                Text("Now all your plants will be in one place and\nwe will help you take care of them :)🪴")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(red: 159/255, green: 159/255, blue: 145/255).opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
            
            Button("Set Plant Reminder") {
                viewModel.showSetReminderSheet()
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("g"))
            .frame(width: 280, height: 44)
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.bottom, 60)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview{
    MyPlantsView(plantListViewModel: PlantListViewModel())
}

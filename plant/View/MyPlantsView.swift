

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
                        .animation(.easeInOut, value: plantListViewModel.plants.isEmpty)
            .animation(.easeInOut, value: plantListViewModel.allPlantsSelected)
        }
    }
    
     
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
                
                 Image("pp")
                    .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(height: 200)
                     .padding(.top,-300)
                Spacer()
            }
            
            Spacer()
                .frame(height: 16)
            
            VStack(spacing: 8) {
                Text("Start your plant journey!")
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.top,-100)

                
                Text("Now all your plants will be in one place and\nwe will help you take care of them :)🪴")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(red: 159/255, green: 159/255, blue: 145/255).opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .padding(.top,-70)
            }
            .frame(maxWidth: .infinity)
            
            Spacer()

            
            Button(action: {
                viewModel.showSetReminderSheet()
            }) {
                Text("Set Plant Reminder")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
            }
            .frame(width: 280, height: 40)
            .background(Color(red: 102/255, green: 254/255, blue: 208/255))
            .clipShape(Capsule())
            .frame(maxWidth: .infinity)
            .padding(.bottom, 60)
            .padding(.top,-300)
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview{
    MyPlantsView(plantListViewModel: PlantListViewModel())
}


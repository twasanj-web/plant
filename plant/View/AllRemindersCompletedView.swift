

import SwiftUI

struct AllRemindersCompletedView: View {
    
    @ObservedObject var viewModel: PlantListViewModel
    
    var body: some View {
        ZStack {
            
             
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // ✅ العنوان في الأعلى
                HStack {
                    Text("My Plants")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("🌱")
                        .font(.largeTitle)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 60)
                
                // ✅ خط فاصل رفيع
                Divider()
                    .background(Color.gray.opacity(0.3))
                    .padding(.horizontal)
                    .padding(.top, 8)
                
                Spacer()
                
                // ✅ المحتوى الرئيسي في المنتصف
                VStack(spacing: 20) {
                    
                    // ✅ الصورة (نبات لطيف في أصيص)
                    Image("completedPlantsIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 280, height: 280)
                    
                    // ✅ النص الرئيسي مع الإيموجي
                    Text("All Done! 🎉")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                    
                    // ✅ النص الثانوي
                    Text("All Reminders Completed")
                        .font(.system(size: 17))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                // ✅ زر الإضافة في الأسفل على اليمين
                HStack {
                    Spacer()
                    
                    Button(action: {
                        // إضافة نبات جديد
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 28, weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                            .background(
                                Circle()
                                    .fill(Color(red: 0.2, green: 0.8, blue: 0.6))
                            )
                            .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4)
                    }
                    .padding(.trailing, 30)
                    .padding(.bottom, 40)
                }
            }
        }
    }
}

#Preview {
    AllRemindersCompletedView(viewModel: PlantListViewModel())
        .preferredColorScheme(.dark)
}

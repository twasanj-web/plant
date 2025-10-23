
import SwiftUI

// View: مسؤولة فقط عن عرض واجهة "نباتاتي"
struct MyPlantsView: View {
    
    // @StateObject لإنشاء وإدارة نسخة من الـ ViewModel
    @StateObject private var viewModel = MyPlantsViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("My Plants 🌱")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .padding(.leading, 16)
            
            Divider()
                .background(Color.white.opacity(0.5))
                .padding(.horizontal, 16)
            
            Spacer()
                .frame(height: 4)
            
            HStack {
                Spacer()
                Image("pp") // تأكد من وجود الصورة "pp" في Assets
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
            .buttonStyle(.glassProminent)
            .tint(.g)
            .frame(width: 280, height: 44)
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.bottom, 60)
        }
        .sheet(isPresented: $viewModel.isShowingSetReminderSheet) {
            // استدعاء الواجهة الثانية وتمرير الـ Binding
            SetReminderView(isPresented: $viewModel.isShowingSetReminderSheet)
        }
        .preferredColorScheme(.dark)
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    MyPlantsView()
}

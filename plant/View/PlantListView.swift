
import SwiftUI

struct PlantListView: View {
    @StateObject var viewModel = PlantListViewModel()
    @State private var progress: Double = 0.5 // قيمة افتراضية للتقدم

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("My Plants🌱")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.horizontal)

                // الخط الفاصل
                Rectangle()
                    .fill(Color.gray.opacity(0.5)) // لون رمادي فاتح للخط
                    .frame(height: 1) // ارتفاع صغير للخط
                    .padding(.horizontal) // مسافة أفقية للخط
                    .padding(.vertical, 10) // مسافة رأسية حول الخط

                Text("Your plants are waiting for a sip 💧")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center) // توسيط النص
                    .padding(.horizontal)
                    .padding(.bottom, 20)

                // Progress Bar
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 10)

                    Capsule()
                        .fill(Color("g")) // استخدام اللون 'g' من Assets
                        .frame(width: CGFloat(progress) * UIScreen.main.bounds.width * 0.9, height: 10)
                        .animation(.easeInOut, value: progress)
                }
                .padding(.horizontal)

                Spacer()

                // زر الإضافة العائم
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            // هنا يمكن إضافة منطق الانتقال لصفحة إضافة نبات جديد
                            print("Add Plant button tapped!")
                        }) {
                            Image(systemName: "plus")
                                .font(.title.weight(.semibold))
                                .padding()
                                .background(Color("g")) // استخدام اللون 'g' من Assets
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)
                    }
                }
            }
//            .background(Color.black.edgesIgnoringSafeArea(.all))
            
            .navigationBarHidden(true)
            .preferredColorScheme(.dark)
            
           
        }
    }
}

struct PlantListView_Previews: PreviewProvider {
    static var previews: some View {
        PlantListView()
    }
}

//
//import SwiftUI
//
//struct ContentView: View {
//@State private var showSheet = true
//    var body: some View {
//        VStack{
//            
//            
//        }
//        .sheet(isPresented: $showSheet){
//            ZStack{
//                
//                
//                
//            }
//            .navigationTitle("Set Reminder")  
//                          .navigationBarTitleDisplayMode(.inline)
//                          .toolbar {
//                              ToolbarItem(placement: .navigationBarLeading) {
//                                  Button {
//                                      showSheet = false
//                                  } label: {
//                                      Image(systemName: "xmark") // أيقونة X للإغلاق
//                                          .font(.headline) // حجم الخط للأيقونة
//                                          .padding(8) // مسافة داخلية لجعل الزر أكبر قابلية للضغط
//                                          .background(Color.gray.opacity(0.2)) // خلفية رمادية شفافة
//                                          .clipShape(Circle()) // شكل دائري للخلفية
//                                  }
//                                  .tint(.white) // لون الأيقونة (إذا كانت الخلفية داكنة)
//                              }
//                              ToolbarItem(placement: .navigationBarTrailing) {
//                                  Button {
//                                      showSheet = false
//                                  } label: {
//                                      Image(systemName: "checkmark.circle.fill") // أيقونة علامة الصح الدائرية
//                                          .font(.title2) // حجم أكبر للأيقونة
//                                          .foregroundColor(.green) // لون أخضر كما في الصورة
//                                  }
//                              }
//                          }
//            
//        }
//        
//    }
//       
//    
//}
//
//
//#Preview {
//    ContentView()
//}

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // 🔹 خلفية سوداء تغطي الشاشة بالكامل
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                // 🔹 Toolbar (شريط علوي)
                HStack {
                    Image(systemName: "xmark") // أيقونة إغلاق (بدون وظيفة)
                        .foregroundColor(.white)
                        .font(.title3)
                    
                    Spacer()
                    
                    Text("Set Reminder")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    Spacer()
                    
                    Image(systemName: "checkmark") // أيقونة تأكيد (بدون وظيفة)
                        .foregroundColor(.white)
                        .font(.title3)
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                // 🔹 حقل اسم النبتة
                TextField("Plant Name", text: .constant(""))
                    .padding()
                    .background(Color(.systemGray5).opacity(0.1))
                    .cornerRadius(25)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                // 🔹 بطاقة Room / Light
                VStack(spacing: 0) {
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(.white)
                        Text("Room")
                            .foregroundColor(.white)
                        Spacer()
                        Text("Bedroom")
                            .foregroundColor(.gray)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    
                    Divider().background(Color.gray)
                    
                    HStack {
                        Image(systemName: "sun.max.fill")
                            .foregroundColor(.white)
                        Text("Light")
                            .foregroundColor(.white)
                        Spacer()
                        Text("Full sun")
                            .foregroundColor(.gray)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
                .background(Color(.systemGray5).opacity(0.1))
                .cornerRadius(20)
                .padding(.horizontal)
                
                // 🔹 بطاقة Watering Days / Water
                VStack(spacing: 0) {
                    HStack {
                        Image(systemName: "drop.fill")
                            .foregroundColor(.white)
                        Text("Watering Days")
                            .foregroundColor(.white)
                        Spacer()
                        Text("Every day")
                            .foregroundColor(.gray)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    
                    Divider().background(Color.gray)
                    
                    HStack {
                        Image(systemName: "drop")
                            .foregroundColor(.white)
                        Text("Water")
                            .foregroundColor(.white)
                        Spacer()
                        Text("20–50 ml")
                            .foregroundColor(.gray)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
                .background(Color(.systemGray5).opacity(0.1))
                .cornerRadius(20)
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

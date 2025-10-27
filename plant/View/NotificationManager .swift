

import UserNotifications

class NotificationManager {
    
    static let shared = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            } else {
                print("SUCCESS: Notification permission granted.")
            }
        }
    }
    
    func scheduleSimpleTestNotification(plantName: String) {
        
        // --- المحتوى (تم التعديل هنا) ---
        let content = UNMutableNotificationContent()
        content.title = "Planto"
        // تم تغيير النص ليطابق الصورة
        content.body = "Hey! let's water your plant"
        content.sound = .default
        
        // --- المُحفّز (Trigger) ---
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // --- الطلب (Request) ---
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        // --- الإضافة إلى مركز الإشعارات ---
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling simple notification: \(error.localizedDescription)")
            } else {
                print("Simple notification scheduled successfully for \(plantName).")
            }
        }
    }
}

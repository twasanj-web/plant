
import Foundation
import Combine

class PlantListViewModel: ObservableObject {
    @Published var plants: [NewPlant] = []

    init() {
        // يمكن إضافة منطق تحميل البيانات هنا إذا كانت موجودة
    }

    func addPlant(name: String, location: String, wateringNeeds: String, sunExposure: String) {
        let newPlant = NewPlant(name: name, location: location, wateringNeeds: wateringNeeds, sunExposure: sunExposure)
        plants.append(newPlant)
    }
}

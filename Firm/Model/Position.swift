
import Foundation

//struct PositionX {
//    let positionName: PositionName
//    let id: String
//}

enum Position: String {
    case CEO
    case MANAGER
    case SENIOR_DEVELOPER
    case JUNIOR_DEVELOPER
    case INTERN

    var name: String {
        return self.rawValue
    }
}
enum CompassPoint: String {
    case north, south, east, west
}

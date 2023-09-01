import Foundation

protocol Device {
    
    var name: String { get }
    var manufacturer: String { get }
    var OS: String { get }
    var screenSize: Float { get }
    var screenSizeUnit: ScreenSizeUnit { get }
    
}

enum ScreenSizeUnit {
    case inch
    case milimeter
    
    func unitSize() -> String {
        switch self {
        case .inch:
            return "Inches"
        case .milimeter:
            return "milimeters"
        }
    }
}

protocol Generation {
    var generation: Int { get }
}

struct iPhone: Device {
    
    var name: String
    var manufacturer: String
    var OS: String
    var screenSize: Float
    var screenSizeUnit: ScreenSizeUnit
    
}

struct iPad: Device, Generation {
    
    var name: String
    var manufacturer: String
    var OS: String
    var screenSize: Float
    var generation: Int
    var screenSizeUnit: ScreenSizeUnit
    
}

let iphone14 = iPhone(name: "iPhone 14", manufacturer: "Apple", OS: "iOS", screenSize: 6.7, screenSizeUnit: .inch)
let iPadPro = iPad(name: "iPad Pro", manufacturer: "Apple", OS: "iPadOS", screenSize: 12.9, generation: 6, screenSizeUnit: .inch)

print("Device info: Name - \(iphone14.name)/ Manufacturer - \(iphone14.manufacturer)/ OS - \(iphone14.OS)/ Screen size - \(iphone14.screenSize)/ Screen size unit - \(iphone14.screenSizeUnit.unitSize())")
print("Device info: Name - \(iPadPro.name)/ Manufacturer - \(iPadPro.manufacturer)/ OS - \(iPadPro.OS)/ Screen size - \(iPadPro.screenSize)/ Screen size unit - \(iPadPro.screenSizeUnit.unitSize())")

extension Device {
    var hasGeneration: Bool { self is Generation }
}

struct Macbook: Device {
    
    var name: String
    var manufacturer: String
    var OS: String
    var screenSize: Float
    var screenSizeUnit: ScreenSizeUnit
    
}

struct Watch: Device, Generation {
    
    var name: String
    var manufacturer: String
    var OS: String
    var screenSize: Float
    var generation: Int
    var screenSizeUnit: ScreenSizeUnit
    
}

let macbookPro = Macbook(name: "Macbook Pro", manufacturer: "Apple", OS: "Mac OS", screenSize: 16, screenSizeUnit: .inch)
let watch = Watch(name: "Watch", manufacturer: "Apple", OS: "WatchOS", screenSize: 45, generation: 8, screenSizeUnit: .milimeter)

print("Device info: Name - \(macbookPro.name) / Has generation - \(macbookPro.hasGeneration ? "YES" : "NO") ")
print("Device info: Name - \(watch.name) / Has generation - \(watch.hasGeneration ? "YES" : "NO") / Generation - \(watch.generation) ")

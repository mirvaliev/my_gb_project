enum propertiesDoor: String {
    case openDoor = "Двери открыты"
    case closeDoor = "Двери закрыты"
}

enum propertiesWindow: String {
    case openWindow = "Окна открыты"
    case closeWindow = "Окна закрыты"
}

enum propertiesEngin: String {
    case enginEnable = "Включенно. Поехали"
    case enginDisable = "Выключенно. Движения нет"
}

enum truckProperties {
    case truckDoor (truckDoor: propertiesDoor)
    case truckWindow (truckWindow: propertiesWindow)
    case truckEngin (truckEngin: propertiesEngin)
}

var truckDoor: Int = 0

struct TrackCar {
    var stampCar: String
    var yearOfReleaseCar: Int
    var trunkVolumeCar: Double
    var colorCar: String
    
    func propDoor (propDoor: truckProperties) {
        switch propDoor {
        case .truckDoor(let door) where door == .openDoor:
            truckDoor = 0
            print(door.rawValue)
        case .truckDoor(let door) where door == .closeDoor:
            truckDoor = 1
            print(door.rawValue)
        default:
            break
        }
    }
    
    func propWindow(propWindow: truckProperties) {
        switch propWindow {
        case .truckWindow(let window) where window == .openWindow:
            print(window.rawValue)
        case .truckWindow(let window) where window == .closeWindow:
            print(window.rawValue)
        default:
            break
        }
    }
    
    func propEngin (propEngin: truckProperties) {
        switch propEngin {
        case .truckEngin(let engen) where engen == .enginEnable:
            if (truckDoor != 0) {
                print(engen.rawValue)
            } else {
                print("!!! Вы неможите ехать! Закройте двери !!!")
            }
        case .truckEngin(let engen) where engen == .enginDisable:
            print(engen.rawValue)
        default:
            break
        }
    }
    
    func changingTheVolumeTrank (startVolume: Double, loadedVolume: Double, shippedVolume: Double) -> Double {
        var volume: Double = 0.0
        //Отгрузка или выгрузка
        if (shippedVolume != 0) {
            volume = startVolume - shippedVolume
            if (volume > trunkVolumeCar) {
                print("!!! Вы не можите выгрузить больше чем объём Вашего багажника !!!")
            } else {
                return volume
            }
        }
        
        //Загрузка
        if (loadedVolume != 0) {
            volume = startVolume + loadedVolume
            if (volume < trunkVolumeCar) {
                print("!!! Вы не можите загрузить больше объёма Вашего багажника !!!")
            } else {
                return volume
            }
        }
        
        //Отгрузка и загрузка
        if ((shippedVolume != 0) && (loadedVolume != 0)) {
            volume = startVolume - shippedVolume + loadedVolume
            if ((volume > trunkVolumeCar) && (volume < trunkVolumeCar)) {
                print("!!! Вы не можите это загрузить или выгрузить такого объёма нет !!!")
            } else {
                return volume
            }
        }
        return volume
    }
}

let myTruck = TrackCar(stampCar: "Catapiller", yearOfReleaseCar: 2010, trunkVolumeCar: 80000, colorCar: "Желто-черный")
print("Марка моего грузовика \(myTruck.stampCar) цвет \(myTruck.colorCar)")
myTruck.propWindow(propWindow: .truckWindow(truckWindow: .openWindow))
myTruck.propDoor(propDoor: .truckDoor(truckDoor: .openDoor))
myTruck.propEngin(propEngin: .truckEngin(truckEngin: .enginEnable))
myTruck.propDoor(propDoor: .truckDoor(truckDoor: .closeDoor))
myTruck.propEngin(propEngin: .truckEngin(truckEngin: .enginEnable))
myTruck.propEngin(propEngin: .truckEngin(truckEngin: .enginDisable))
print("На борту \(myTruck.changingTheVolumeTrank(startVolume: 4000.0, loadedVolume: 2000.0, shippedVolume: 1000.0)) кг груза")

/*
 Марка моего грузовика Catapiller цвет Желто-черный
 Окна открыты
 Двери открыты
 !!! Вы неможите ехать! Закройте двери !!!
 Двери закрыты
 Включенно. Поехали
 Выключенно. Движения нет
 На борту 3000.0 кг груза
 */

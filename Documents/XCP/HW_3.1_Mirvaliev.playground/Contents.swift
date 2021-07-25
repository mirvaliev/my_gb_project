// Домашнее задание №3

struct Car {
    //Определяем свойства моего автомобиля
    var stampCar: String
    var yearOfReleaseCar: Int
    var trunkVolumeCar: Double
    var windowCountCar: Int
    var dourCountCar: Int
    let stateNumber: String
    var colorCar: String
    
    
    //Методы описывающие мой автомобиль
    mutating func doorCar (doorCar: Bool) -> String {
        if (doorCar != true) {
            return "Двери закрыты"
        } else {
            return "Двери открыты"
        }
    }
    
    mutating func winCar (winCar: Bool) -> String {
        if (winCar != true) {
            return "Окна закрыты"
        } else {
            return "Окна открыты"
        }
    }
    
    mutating func enginCar (enginCar: Bool) -> String {
        if (enginCar != true) {
            return "Выключенно Движения нет"
        } else {
            return "Включенно Поехали"
        }
    }
    
    mutating func changingTheVolumeTrank (startVolume: Double, loadedVolume: Double, shippedVolume: Double) -> Double {
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

//Мои автомобили
var myPassengerCar = Car(stampCar: "Suzuki Jimny", yearOfReleaseCar: 2009, trunkVolumeCar: 10.0, windowCountCar: 4, dourCountCar: 4, stateNumber: "85 A348VBN", colorCar: "Салатовый")

print("Марка моего автомобиля \(myPassengerCar.stampCar) \(myPassengerCar.colorCar) цвета")
print(myPassengerCar.doorCar(doorCar: true))
print(myPassengerCar.doorCar(doorCar: false))
print(myPassengerCar.enginCar(enginCar: true))
print(myPassengerCar.enginCar(enginCar: false))
var volumeTrak = myPassengerCar.changingTheVolumeTrank(startVolume: 10.0, loadedVolume: 1.0, shippedVolume: 2.0)
print("В багажнике \(volumeTrak) вещей")

/*
 Марка моего автомобиля Suzuki Jimny Салатовый цвета
 Двери открыты
 Двери закрыты
 Включенно Поехали
 Выключенно Движения нет
 В багажнике 8.0 вещей
*/

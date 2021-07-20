// Домашнее задание 4.1

var doorCar = 1
var windowsCar = 1
var enginCar = 0
var conditionCar = 0

class Car {
    var brandCar: String
    var manufactureCar: String
    var stateNumber: String
    var colorCar: String
    var engineCarVolume: Int
    var countWinCar: Int
    var countDoorCar: Int
    var numberOfPassangerSeats: Int
    var volume: Double
    var carDoor: propertiesDoor
    var carWindow: propertiesWindow
    var carEngin: propertiesEngin
    var carGo: properСarGo

    enum propertiesDoor: String {
        case openDoor = "Двери открыты"
        case closeDoor = "Двери закрыты"
    }

    enum propertiesWindow: String {
        case openWindow = "Окна открыты"
        case closeWindow = "Окна закрыты"
    }

    enum propertiesEngin: String {
        case enginEnable = "Двигатель заведён"
        case enginDisable = "Двигатель не заведён"
    }
    
    enum properСarGo: String {
        case carGoEnable = "Поехали"
        case carGoDisable = "Стоим"
    }
        
    init (brandCar: String, manufactureCar: String, stateNumber: String, colorCar: String, engineCarVolume: Int, countWinCar: Int, countDoorCar: Int, numberOfPassangerSeats: Int, volume: Double, carDoor: propertiesDoor, carWindow: propertiesWindow, carEngin: propertiesEngin, properCarGo: properСarGo) {
        self.brandCar = brandCar
        self.colorCar = colorCar
        self.manufactureCar = manufactureCar
        self.stateNumber = stateNumber
        self.engineCarVolume = engineCarVolume
        self.countWinCar = countWinCar
        self.countDoorCar = countDoorCar
        self.numberOfPassangerSeats = numberOfPassangerSeats
        self.volume = volume
        self.carDoor = .closeDoor
        self.carWindow = .closeWindow
        self.carEngin = .enginDisable
        self.carGo = .carGoDisable
    }
    
    convenience init (brandCar: String, stateNumber: String, numberOfPassangerSeats: Int, colorCar: String) {
        self.init (brandCar: "", manufactureCar: "", stateNumber: "", colorCar: "", engineCarVolume: 0, countWinCar: 0, countDoorCar: 0, numberOfPassangerSeats: 0, volume: 0.0, carDoor: .closeDoor, carWindow: .closeWindow, carEngin: .enginDisable, properCarGo: .carGoDisable)
        self.brandCar = brandCar
        self.colorCar = colorCar
        self.stateNumber = stateNumber
        self.numberOfPassangerSeats = numberOfPassangerSeats
    }
    
    convenience init () {
        self.init (brandCar: "", manufactureCar: "", stateNumber: "", colorCar: "", engineCarVolume: 0, countWinCar: 0, countDoorCar: 0, numberOfPassangerSeats: 0, volume: 0.0, carDoor: .closeDoor, carWindow: .closeWindow, carEngin: .enginDisable, properCarGo: .carGoDisable)
    }
    
    func propDoor (propDoor: propertiesDoor) {
        switch propDoor {
        case .openDoor:
            if (doorCar == 1) {
                doorCar = 1
                print(propDoor.rawValue)
            } else if (doorCar == 0) {
                print("Двери были ранее закрыты я открываю двери")
                doorCar = 1
                print(Car.propertiesDoor.openDoor.rawValue)
            }
        case .closeDoor:
            if (doorCar == 0) {
                doorCar = 0
                print(propDoor.rawValue)
            } else if (doorCar == 1) {
                print("Двери были открыты ранее я закрываю двери")
                doorCar = 0
                print(Car.propertiesDoor.closeDoor.rawValue)
            }
        }
    }
        
    func propWindow(propWindow: propertiesWindow) {
        switch propWindow {
        case .openWindow:
            if (windowsCar == 1) {
                windowsCar = 1
                print(propWindow.rawValue)
            } else if (windowsCar == 0) {
                print("Окна были ранее закрыты я открываю окна")
                windowsCar = 1
                print(Car.propertiesWindow.openWindow.rawValue)
            }
        case .closeWindow:
            if (windowsCar == 0) {
                windowsCar = 0
                print(propWindow.rawValue)
            } else if (windowsCar == 1) {
                print("Окна были ранее открыты я закрываю окна")
                windowsCar = 0
                print(Car.propertiesWindow.closeWindow.rawValue)
            }
        }
    }
        
    func propEngin (propEngin: propertiesEngin) { // Доработать
        switch propEngin {
        case .enginDisable:
            if (enginCar == 0) {
                enginCar = 0
                print(propEngin.rawValue)
            }
            if (enginCar == 1) {
                print("Двигатель был ранее заведён я глушу двигатель")
                enginCar = 0
                print(Car.propertiesEngin.enginDisable.rawValue)
            }
        case .enginEnable:
            if (enginCar == 1) {
                enginCar = 1
                print(propEngin.rawValue)
            }
            if (enginCar == 0) {
                print("Двигатель был заглушон я завожу двигатель")
                enginCar = 1
                print(Car.propertiesEngin.enginEnable.rawValue)
            }
        }
    }
    
    func propGo (propGo: properСarGo) {
        switch propGo {
        case .carGoDisable:
            print(propGo.rawValue)
        case .carGoEnable:
            if ((doorCar == 1) && (enginCar == 0)) {
                print("!!! Для начала движения заведите двигатель и закройте двери !!!")
            } else if (enginCar == 0) {
                print("!!! Для начала движения заведите двигатель !!!")
            } else if (doorCar == 1) {
                print("!!! Для начала движения закройте двери !!!")
            } else {
                print(propGo.rawValue)
            }
        }
    }
    
    func changingTheVolumeTrank (startVolume: Double, loadedVolume: Double, shippedVolume: Double) -> Double {
            var volumeTemp: Double = 0.0
            //Отгрузка или выгрузка
            if (shippedVolume != 0) {
                volumeTemp = startVolume - shippedVolume
                if (volumeTemp > volume) {
                    print("!!! Вы не можите выгрузить больше чем объём Вашего багажника !!!")
                } else {
                    return volumeTemp
                }
            }
            
            //Загрузка
            if (loadedVolume != 0) {
                volumeTemp = startVolume + loadedVolume
                if (volumeTemp < volume) {
                    print("!!! Вы не можите загрузить больше объёма Вашего багажника !!!")
                } else {
                    return volumeTemp
                }
            }
            
            //Отгрузка и загрузка
            if ((shippedVolume != 0) && (loadedVolume != 0)) {
                volumeTemp = startVolume - shippedVolume + loadedVolume
                if ((volumeTemp > volume) && (volumeTemp < volume)) {
                    print("!!! Вы не можите это загрузить или выгрузить такого объёма нет !!!")
                } else {
                    return volumeTemp
                }
            }
        return volumeTemp
    }
}


class TrunkCar: Car {
    var trunkVolumeCar: Double
    
    init(trunkVolume: Double, brandCar: String, manufactureCar: String, stateNumber: String, colorCar: String, engineCarVolume: Int, countWinCar: Int, countDoorCar: Int, numberOfPassangerSeats: Int) {
        self.trunkVolumeCar = trunkVolume
        super.init(brandCar: "", manufactureCar: "", stateNumber: "", colorCar: "", engineCarVolume: 0, countWinCar: 0, countDoorCar: 0, numberOfPassangerSeats: 0, volume: 0.0, carDoor: .closeDoor, carWindow: .closeWindow, carEngin: .enginDisable, properCarGo: .carGoDisable)
        self.brandCar = brandCar
        self.colorCar = colorCar
        self.manufactureCar = manufactureCar
        self.stateNumber = stateNumber
        self.engineCarVolume = engineCarVolume
        self.countWinCar = countWinCar
        self.countDoorCar = countDoorCar
        self.numberOfPassangerSeats = numberOfPassangerSeats
        self.carDoor = .closeDoor
        self.carWindow = .closeWindow
        self.carEngin = .enginDisable
        self.trunkVolumeCar = volume
    }
    
    convenience init (brandCar: String, stateNumber: String, colorCar: String, trunkVolume: Double) {
        self.init (trunkVolume: 0, brandCar: "", manufactureCar: "", stateNumber: "", colorCar: "", engineCarVolume: 0, countWinCar: 0, countDoorCar: 0, numberOfPassangerSeats: 0)
        self.brandCar = brandCar
        self.colorCar = colorCar
        self.stateNumber = stateNumber
        self.trunkVolumeCar = volume
    }
    
    convenience init () {
        self.init (trunkVolume: 0.0, brandCar: "", manufactureCar: "", stateNumber: "", colorCar: "", engineCarVolume: 0, countWinCar: 0, countDoorCar: 0, numberOfPassangerSeats: 0)
    }
}

class PassanerCar: Car {
    var airConditiongCar: propAirCondition
    
    enum propAirCondition: String {
        case airConditionEnable = "Кондиионер включён"
        case airConditionDisable = "Кондиионер выключен"
    }
    
    init (brandCar: String, stateNumber: String, numberOfPassangerSeats: Int, colorCar: String) {
        self.airConditiongCar = .airConditionDisable
        super.init(brandCar: "", manufactureCar: "", stateNumber: "", colorCar: "", engineCarVolume: 0, countWinCar: 0, countDoorCar: 0, numberOfPassangerSeats: 0, volume: 0.0, carDoor: .closeDoor, carWindow: .closeWindow, carEngin: .enginDisable, properCarGo: .carGoDisable)
        self.brandCar = brandCar
        self.colorCar = colorCar
        self.stateNumber = stateNumber
        self.numberOfPassangerSeats = numberOfPassangerSeats
    }
    
    private func enableConditionCar () {
        if ((enginCar == 1) && (doorCar == 1) && (windowsCar == 1)) {
            print("!!! Перед включением кондиционера я закрываю окна и двери !!!")
            propWindow(propWindow: .closeWindow)
            windowsCar = 0
            propDoor(propDoor: .closeDoor)
            doorCar = 0
            conditionCar = 1
            PassanerCar.propAirCondition.airConditionEnable.rawValue
        } else if ((enginCar == 1) && (doorCar == 0) && (windowsCar == 1)) {
            print("!!! Перед включением кондиционера я закрываю двери !!!")
            propDoor(propDoor: .closeDoor)
            doorCar = 0
            conditionCar = 1
            PassanerCar.propAirCondition.airConditionEnable.rawValue
        }  else if ((enginCar == 1) && (doorCar == 1) && (windowsCar == 0)) {
            print("!!! Перед включение кондиционера я закрываю окна !!!")
            propWindow(propWindow: .closeWindow)
            windowsCar = 0
            conditionCar = 1
            PassanerCar.propAirCondition.airConditionEnable.rawValue
        } else if (enginCar == 0) {
            print("!!! Для того что бы включить кондиционер заведите двигатель !!!")
        }
    }
    
    func propAirCondition (propAirCondition: propAirCondition) { // Доработать
        switch propAirCondition {
        case .airConditionDisable:
            if (conditionCar == 0) {
                enableConditionCar ()
            }
            if (conditionCar == 1) {
                conditionCar = 0
                print("Кондиционер был ранее включен я выключаю кондиционер")
                PassanerCar.propAirCondition.airConditionDisable.rawValue
            }
        case .airConditionEnable:
            if (conditionCar == 0) {
                enableConditionCar ()
            }
            if (conditionCar == 1) {
                conditionCar = 0
                print("Кондиционер был ранее включен я выключаю кондиционер")
                PassanerCar.propAirCondition.airConditionDisable.rawValue
            }
        }
    }
    
    override func propWindow(propWindow: propertiesWindow) { // Доработать
        switch propWindow {
        case .openWindow:
            if (conditionCar == 0) {
                windowsCar = 1
                print(propWindow.rawValue)
            }
            if (conditionCar == 1) {
                print("!! Перед тем как открыть окна я выключу кондиционер !!!")
                self.propAirCondition(propAirCondition: .airConditionDisable)
                conditionCar = 0
                print(PassanerCar.propAirCondition.airConditionDisable.rawValue)
                print(propWindow.rawValue)
            }
        case .closeWindow:
            windowsCar = 0
            print(propWindow.rawValue)
        }
    }
}

var myCarEmpty = Car()
myCarEmpty.propDoor(propDoor: .openDoor)
myCarEmpty.propEngin(propEngin: .enginDisable)
myCarEmpty.propGo(propGo: .carGoEnable)
myCarEmpty.propEngin(propEngin: .enginEnable)
myCarEmpty.propDoor(propDoor: .closeDoor)
myCarEmpty.propGo(propGo: .carGoEnable)

/*
 Двери были ранее закрыты я открываю двери
 Двери открыты
 Двигатель не заведён
 !!! Для начала движения заведите двигатель и закройте двери !!!
 Двигатель был заглушон я завожу двигатель
 Двигатель заведён
 Двери были открыты ранее я закрываю двери
 Двери закрыты
 Поехали
 */

var myPassangerCar = PassanerCar(brandCar: "SUZUKI Jimni", stateNumber: "85/A 432 BNM", numberOfPassangerSeats: 4, colorCar: "Желтый")

print("Моя машина марки  \(myPassangerCar.brandCar)")
myPassangerCar.propGo(propGo: .carGoEnable)
myPassangerCar.propEngin(propEngin: .enginEnable)
myPassangerCar.propDoor(propDoor: .openDoor)
myPassangerCar.propAirCondition(propAirCondition: .airConditionEnable)
myPassangerCar.propGo(propGo: .carGoEnable)

/*
 Моя машина марки  SUZUKI Jimni
 !!! Для начала движения заведите двигатель и закройте двери !!!
 Двигатель был заглушон я завожу двигатель
 Двигатель заведён
 Двери открыты
 !!! Перед включение кондиционера я закрываю окна и двери !!!
 Окна закрыты
 Двери были открыты ранее я закрываю двери
 Двери закрыты
 Кондиионер включён
 Поехали
 */

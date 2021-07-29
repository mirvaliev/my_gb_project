// Домашнее задание 5.1

var volumeTemp: Double = 0.0

protocol CarProtocol {
    var brandCar: String { get }
    var stateNumber: String { get }
    var colorCar: String { get }
    var propertyCar: String { get }
    var volume: Double { get }
    
    init(brandCar: String, stateNumber: String, colorCar: String, volume: Double)
}

class Car: CarProtocol {
    var brandCar: String
    var stateNumber: String
    var colorCar: String
    var volume: Double {
        didSet {
            if (volume < 0.0) {
                print("!!! Объём багажника не может быть отрицательным !!!")
                volume = 0.0
            }
        }
    }
    var propertyCar: String {
        get { return ("Мой автомобиль марки \(brandCar) с гос номером \(stateNumber) цвета \(colorCar) с объёмом багажа в \(volume) кг") }
    }
    
    var doorCar: Int = 1
    var windowsCar: Int = 0
    var enginCar: Int = 0
    
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
    
    required init(brandCar: String, stateNumber: String, colorCar: String, volume: Double) {
        self.brandCar = brandCar
        self.stateNumber = stateNumber
        self.colorCar = colorCar
        self.volume = volume
        self.carDoor = .closeDoor
        self.carWindow = .closeWindow
        self.carEngin = .enginDisable
        self.carGo = .carGoDisable
    }
}

class PassangerCar: Car {
    var conditionCar: Int = 0
    var airConditiongCar: propAirCondition
    
    enum propAirCondition: String {
        case airConditionEnable = "Кондиионер включён"
        case airConditionDisable = "Кондиионер выключен"
    }
    
    required init (brandCar: String, stateNumber: String, colorCar: String, volume: Double) {
        self.airConditiongCar = .airConditionDisable
        super.init(brandCar: "", stateNumber: "", colorCar: "", volume: 0.0)
        self.brandCar = brandCar
        self.stateNumber = stateNumber
        self.colorCar = colorCar
        self.volume = volume
    }
}

extension CarProtocol {
    var propertyCarVol: String {
        get { return ( "У автомобиля с гос номером \(stateNumber) багаж загружен на \(volumeTemp)") }
    }
    func changingTheVolume (startVolume: Double, loadedVolume: Double, shippedVolume: Double) -> Double {
        
        //Отгрузка или выгрузка
            if (shippedVolume != 0) {
                volumeTemp = startVolume - shippedVolume
                if (volumeTemp < volume) {
                    print("!!! Вы не можите выгрузить больше чем объём Вашего багажника !!!")
                } else {
                    return volumeTemp
                }
            }
            
            //Загрузка
            if (loadedVolume != 0) {
                volumeTemp = startVolume + loadedVolume
                if (volumeTemp > volume) {
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

extension Car {
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
}

extension PassangerCar {
    private func enableConditionCar () {
        if ((enginCar == 1) && (doorCar == 1) && (windowsCar == 1)) {
            print("!!! Перед включением кондиционера я закрываю окна и двери !!!")
            propWindow(propWindow: .closeWindow)
            windowsCar = 0
            propDoor(propDoor: .closeDoor)
            doorCar = 0
            conditionCar = 1
            PassangerCar.propAirCondition.airConditionEnable.rawValue
        } else if ((enginCar == 1) && (doorCar == 0) && (windowsCar == 1)) {
            print("!!! Перед включением кондиционера я закрываю двери !!!")
            propDoor(propDoor: .closeDoor)
            doorCar = 0
            conditionCar = 1
            PassangerCar.propAirCondition.airConditionEnable.rawValue
        }  else if ((enginCar == 1) && (doorCar == 1) && (windowsCar == 0)) {
            print("!!! Перед включение кондиционера я закрываю окна !!!")
            propWindow(propWindow: .closeWindow)
            windowsCar = 0
            conditionCar = 1
            PassangerCar.propAirCondition.airConditionEnable.rawValue
        } else if (enginCar == 0) {
            print("!!! Для того что бы включить кондиционер заведите двигатель !!!")
        }
    }
    
    func propAirCondition (propAirCondition: propAirCondition) {
        switch propAirCondition {
        case .airConditionDisable:
            if (conditionCar == 0) {
                enableConditionCar ()
            }
            if (conditionCar == 1) {
                conditionCar = 0
                print("Кондиционер был ранее включен я выключаю кондиционер")
                PassangerCar.propAirCondition.airConditionDisable.rawValue
            }
        case .airConditionEnable:
            if (conditionCar == 0) {
                enableConditionCar ()
            }
            if (conditionCar == 1) {
                conditionCar = 0
                print("Кондиционер был ранее включен я выключаю кондиционер")
                PassangerCar.propAirCondition.airConditionDisable.rawValue
            }
        }
    }
}

var a = Car(brandCar: "Jimni", stateNumber: "85 / A 234 VC", colorCar: "Y", volume: 100)
print(a.propertyCar)
a.changingTheVolume(startVolume: 0.0, loadedVolume: 80.0, shippedVolume: 0.0)
print(a.propertyCarVol)
var b = PassangerCar(brandCar: "BMV X5", stateNumber: "10 / S 777 AA", colorCar: "W", volume: 70)
print(b.propertyCar)
b.changingTheVolume(startVolume: 0, loadedVolume: 30, shippedVolume: 0)
print(b.propertyCarVol)
a.propGo(propGo: .carGoEnable)
a.propEngin(propEngin: .enginEnable)
a.propDoor(propDoor: .closeDoor)
a.propGo(propGo: .carGoEnable)

/*
 Сначало решил поехать на легковой в соседний город, потом решил взять друзей и поехать на внедорожники в Альпы
 Мой автомобиль марки Jimni с гос номером 85 / A 234 VC цвета Y с объёмом багажа в 100.0 кг
 У автомобиля с гос номером 85 / A 234 VC багаж загружен на 80.0
 Мой автомобиль марки BMV X5 с гос номером 10 / S 777 AA цвета W с объёмом багажа в 70.0 кг
 У автомобиля с гос номером 10 / S 777 AA багаж загружен на 30.0
 !!! Для начала движения заведите двигатель и закройте двери !!!
 Двигатель был заглушон я завожу двигатель
 Двигатель заведён
 Двери были открыты ранее я закрываю двери
 Двери закрыты
 Поехали
 */

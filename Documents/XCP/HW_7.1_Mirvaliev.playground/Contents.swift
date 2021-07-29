// Домашнее задание 7.1

import Foundation

// Простой эксперемент на матиматикe
func ditNum (a: Int, b: Int) throws -> Int {
    guard b != 0 else { throw NSError(domain: "Делить на нуль нельзя", code: 0) }
    return a / b
}

let result1 = try? ditNum(a: 2, b: 0) // return nil
let result2 = try? ditNum(a: 4, b: 2) // return 2

// Более сложный вариант
// Нам в армию необходимо набрать людей из предложенного cписка которые
// 1 не моложе 16 не старше 40 лет
// 2 не потребляют спиртных напитков
// 3 не употребляют курительные смеси
// 4 не употребляют наркотики в любом их виде

struct Piple {
    let namePiple: String
}

struct PipleParam {
    let  pipleAge: Int
    let pipleSpirt: Bool
    let pipleSmoke: Bool
    let pipleDrugs: Bool
    let pipleFIO: Piple
}

enum ResonseNotArmy: Error {
    case age
    case smok
    case drugs
    case alhakol
    case notIsList
}

class OurArmy {
    var listPiple = [
        "Bob Millow": PipleParam(pipleAge: 20, pipleSpirt: true, pipleSmoke: false, pipleDrugs: false, pipleFIO: Piple(namePiple: "Bob Millow")),
        "Petya Pertov": PipleParam(pipleAge: 12, pipleSpirt: false, pipleSmoke: false, pipleDrugs: false, pipleFIO: Piple(namePiple: "Petya Pertov")),
        "Oleg Olegov": PipleParam(pipleAge: 60, pipleSpirt: true, pipleSmoke: true, pipleDrugs: false, pipleFIO: Piple(namePiple: "Oleg Olegov")),
        "Smaler Siple HJ": PipleParam(pipleAge: 27, pipleSpirt: true, pipleSmoke: true, pipleDrugs: true, pipleFIO: Piple(namePiple: "Smaler Siple HJ")),
        "Snower Power": PipleParam(pipleAge: 35, pipleSpirt: false, pipleSmoke: false, pipleDrugs: false, pipleFIO: Piple(namePiple: "Snower Power")),
        "Tas Taras": PipleParam(pipleAge: 10, pipleSpirt: false, pipleSmoke: false, pipleDrugs: false, pipleFIO: Piple(namePiple: "Tas Taras")),
        "Nurik Varujobek bobo": PipleParam(pipleAge: 58, pipleSpirt: false, pipleSmoke: true, pipleDrugs: false, pipleFIO: Piple(namePiple: "Nurik Varujobek bobo")),
        "Serik Berik ugli": PipleParam(pipleAge: 30, pipleSpirt: false, pipleSmoke: true, pipleDrugs: false, pipleFIO: Piple(namePiple: "Serik Berik ugli")),
        "David Bavid": PipleParam(pipleAge: 29, pipleSpirt: true, pipleSmoke: false, pipleDrugs: true, pipleFIO: Piple(namePiple: "David Bavid")),
        "Stasik Fashri": PipleParam(pipleAge: 19, pipleSpirt: false, pipleSmoke: false, pipleDrugs: false, pipleFIO: Piple(namePiple: "Stasik Fashri")),
    ]
    
    func selectionForTheArmy (fio pipName: String) -> (Piple?, ResonseNotArmy?) {
        guard let name = listPiple[pipName] else { return (nil, ResonseNotArmy.notIsList) }
        guard name.pipleAge < 40 && name.pipleAge > 16 else { return (nil, ResonseNotArmy.age) }
        guard name.pipleDrugs != true else { return (nil, ResonseNotArmy.drugs) }
        guard name.pipleSmoke != true else { return (nil, ResonseNotArmy.smok) }
        guard name.pipleSpirt != true else { return (nil, ResonseNotArmy.alhakol) }
        
        let ourPiple = name
        listPiple[pipName] = ourPiple
        print("Це наша людина! \(name.pipleFIO.namePiple), ласкаво просимо в елітні війська твоєї улюблений і дорогоцінної батьківщини !!!")
        return (ourPiple.pipleFIO, nil)
    }
}

let armyElite = OurArmy()
armyElite.selectionForTheArmy(fio: "Nurik Varujobek bobo") // return age
armyElite.selectionForTheArmy(fio: "Smaler Siple HJ") // return drugs
armyElite.selectionForTheArmy(fio: "Sagit Mirvaliev") // return notIsList
armyElite.selectionForTheArmy(fio: "Snower Power") // return in console (Це наша людина! Snower Power, ласкаво просимо в елітні війська твоєї улюблений і дорогоцінної батьківщини !!!)

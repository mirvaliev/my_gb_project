// Домашнее задание №2

func myNumber (_ number: Int, _ divisionNum: Int) -> Int {
    if (number % divisionNum == 0) {
        //print("Число \(number) делится на цело на число \(divisionNum)")
        return 0
    } else {
        //print("Число \(number) не делится на цело на число \(divisionNum)")
        return 1
    }
}

func myArrayGo (_ start: Int, _ finish: Int) -> Int {
    var randArray: [Int] = []
    for _ in 0 ... 10 {
        randArray.append(Int.random(in: start ... finish))
    }
    
    let uniqueArray = Set(randArray)
    var randArray2 = Array(uniqueArray)
    randArray2.sort()

    for q in randArray2 {
        if (myNumber(q, 2) == 0 ) {
            randArray2.remove(at: randArray2.firstIndex(of: q)!)
        }
    }
    for h in randArray2 {
        if (myNumber(h, 3) == 0) {
            randArray2.remove(at: randArray2.firstIndex(of: h)!)
        }
    }
    print(randArray2)
    return 0
}

print("Метод который заполняет массив выборочными числами, удаляет из него все одинаковые числа, числа чётные и все числа которые делятся на 3, сортирует")
var a = myArrayGo(0, 100)

/*
 
 */





func febNum (_ febStart: Int, _ febLast: Int) -> Int {
    var k = 0
    var v = 1
    var febArrey: [Int] = []
    
    for _ in febStart ... febLast {
        k += v
        v = k - v
        febArrey.append(k)
    }
    print(febArrey)
    return 0
}

/*
 
 */




print("Метод который заполняет массив числами Фибаначи")
var b = febNum(0, 49)



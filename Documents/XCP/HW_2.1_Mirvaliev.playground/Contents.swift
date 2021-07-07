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
 Метод который заполняет массив выборочными числами, удаляет из него все одинаковые числа, числа чётные и все числа которые делятся на 3, сортирует
 [37, 47, 77]
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


print("Метод который заполняет массив числами Фибаначи")
var b = febNum(0, 49)

/*
 Метод который заполняет массив числами Фибаначи
 [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229, 832040, 1346269, 2178309, 3524578, 5702887, 9227465, 14930352, 24157817, 39088169, 63245986, 102334155, 165580141, 267914296, 433494437, 701408733, 1134903170, 1836311903, 2971215073, 4807526976, 7778742049, 12586269025]
 */

func primeNumbers (pNum: Int) -> Bool {
    if pNum <= 1 {
        return false
    }
    if pNum <= 3 {
        return true
    }
    var i = 2
    while i*i <= pNum {
        if pNum % i == 0 {
            return false
        }
        i = i + 1
    }
    return true
}

func primeArray (myNum: Int) {
    var primeArray: [Int] = []
    for f in 0 ... myNum {
        if (primeNumbers(pNum: f) != false) {
            primeArray.append(f)
        }
    }
    print(primeArray)
}

print("Метод который выводит на экран массив простых чисел ")
var gg: () = primeArray(myNum: 100)

/*
 Метод который выводит на экран массив простых чисел
 [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
 */

// for me

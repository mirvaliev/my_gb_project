// Домашнее задание 6.1

var myIntArray = [Int]()
for _ in 0 ... 5 {
    myIntArray.append(Int.random(in: 0 ... 10))
}

struct Queue<T> {
    var myArray = [T]()
    
    mutating func pushAllArray (array: [T], f: (T) -> Bool) -> [T] {
        for i in array {
            if (f(i)) {
                myArray.append(i)
            }
        }
        return myArray
    }
    
    mutating func push (items: T)  {
        myArray.append(items)
    }
    
    mutating func popFirst () -> T {
        return myArray.removeFirst()
    }
    
    mutating func popLast () -> T {
        return myArray.removeLast()
    }
    
    func printArray<T> (array: T) {
        print(myArray)
    }
}


var a = Queue(myArray: myIntArray)
a.pushAllArray(array: myIntArray, f: { (i: Int) -> Bool in i % 4 == 0 } )
a.printArray(array: myIntArray)
a.popFirst()
a.printArray(array: myIntArray)
myIntArray.sort()
print(myIntArray)


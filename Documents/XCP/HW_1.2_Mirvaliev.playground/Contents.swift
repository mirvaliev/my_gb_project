// Возведение в степень
func pow (_ x: Double, _ n: Double) -> Double {
    if (n == 1) {
        return x
    } else {
        return x * pow(x, n - 1)
    }
}

func rightTriangle (_ legA: Double, _ legB: Double) -> Double {
    let legC = ((pow(legA, 2) + pow(legB, 2)).squareRoot()).rounded()
    print("Гипотинуза триугольника С = \(legC)")

    let areaTriangle = ((legA * legB) / 2).rounded()
    print("Площадь триугольника равна S = \(areaTriangle)")

    let perimeterTriangle = (legA + legB + legC).rounded()
    print("Периметр триугольника P = \(perimeterTriangle)")
    
    return 0
}

var a = rightTriangle(56, 24)

/*
 Гипотинуза триугольника С = 61.0
 Площадь триугольника равна S = 672.0
 Периметр триугольника P = 141.0
 */

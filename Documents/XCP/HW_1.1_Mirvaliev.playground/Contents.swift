
// Решить квадратное уравнение ax^2 +- bx +- c = 0

// метод возведения числа в степень
func pow (_ x: Double, _ n: Int) -> Double {
    if (n == 1) {
        return x
    } else {
        return x * pow(x, n - 1)
    }
}

func quadricEquation (_ a: Double, _ b: Double, _ c: Double) -> Double {
    var result1: Double = 0.0
    var result2: Double = 0.0
    let disc = pow(b, 2) - 4 * a * c
    print("Дискрименант уравнения D = \(disc)")
    if (disc == 0) {
        result1 = -b / 2 * a
        print(result1)
    } else if (disc < 0) {
        print("У данного уровнения нет корней ")
    } else {
        result1 = (-b + Double(disc)) / 2 * a
        print("Первый корень уравнения х1 = \(result1)")
        result2 = (-b - Double(disc)) / 2 * a
        print("Второй корень уравнения х2 = \(result2)")
    }
    return 0
}

var a = quadricEquation(2.0, 8.0, 0.0)


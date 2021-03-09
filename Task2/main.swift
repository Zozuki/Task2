//
//  main.swift
//  Task2
//
//  Created by user on 07.03.2021.
//

import Foundation


//1) Напишем функцию, которая определяет, четное число или нет.
func evenNum(num: Int) -> Bool{
    // проверяем число на нулевой остаток при делении на 2
    if num % 2 == 0 {
        print("\(num) - четное число")
        return true
    } else {
        print("\(num) - нечетное число")
        return false
    }
}


// 2) Напишем функцию, которая определяет, делится ли число без остатка на 3.
func divideOnTriple(num: Int) -> Bool {
    if num % 3 == 0 {
        print("\(num) - делится на 3 без остатка")
        return true
    } else {
        print("\(num) - не делится на 3 без остатка")
        return false
    }
}


// 3) Создадим возрастающий массив из 100 чисел
var nums = Array(1...100)


// 4) Удалим из этого массива все четные числа и все числа, которые НЕ делятся на 3
for num in nums {
    // определяем индекс элемента
    let index = nums.firstIndex(of: num)
    // проверяем элемент с помощью функции из 1 задания
    if evenNum(num: num) == true {
        nums.remove(at: index!)
    // проверяем элемент с помощью функции из 2 задания
    } else if !divideOnTriple(num: num) {
        nums.remove(at: index!)
    }
}

// 5) Напишем функцию, которая добавляет в массив новое число Фибоначчи, и добавим при помощи нее 50 элементов

// Данная функция добавляет в полученный массив указанное количество чисел фибоначи - (amount), а также проверяет каждый полученный массив по всем правилам чисел фибоначи, которые гласят, что последовательность чисел должна начинаться с [0, 1] или [1, 1] и каждый последующий элемент должен быть равен сумме двух предыдущих чисел, если полученный массив не соответствует правилам, то пользователь получает соответсвующее сообщение об ошибке
func addfibNum(to array: inout Array<Int>, amount: Int) {
    // проверка массивов из 2 или 3 элементов
    if array.count == 2 || array.count == 3 {
        if array == [0,1,1] || array == [1,1,2] || array == [0,1] || array == [1,1] {
            for _ in 1...amount {
                array.append(array[array.endIndex - 2] + array.last!)
            }
        } else {
            print("Error: Числа Фибоначчи могут быть добавлены лишь к той последовательности чисел, которая начинается с [0, 1] или [1, 1] и каждый последующий элемент должен быть равен сумме двух предыдущих чисел")
        }
    } else {
        // проверка массивов, состоящих из 4 и более элементов
        // сначала проверяем начальные элементы
        if array[1] == 1 && array.first! == 0 || array.first! == 1  {
            var firstNums = 0
            var countOfArrayNums = 0
            for num in array {
                // пропускаем первые 3 элемента, так как они уже были проверены выше
                firstNums += 1
                if firstNums > 3 {
                    let fibonacciRule = array[array.firstIndex(of: num)! - 1] + array[array.firstIndex(of: num)! - 2]
                    // проверяем каждый элемент на то, что он равен сумме 2 предыдущих элементов, чтобы не пропустить массивы подобных типов : [0, 1, 1, 2, 3, 6, 9] - в которых один из элементов не соответствует правилу
                    if num == fibonacciRule {
                        countOfArrayNums += 1
                        if countOfArrayNums == array.count - 3 {
                            for _ in 1...amount {
                                array.append(array[array.endIndex - 2] + array.last!)
                            }
                            firstNums = 0
                        }
                    } else {
                        print("Error: Числа Фибоначчи могут быть добавлены лишь к той последовательности чисел, где каждое число равно сумме двух предыдущих чисел")
                    }
                }
            }
        } else {
            print("Error: Числа Фибоначчи могут быть добавлены лишь к той последовательности чисел, которая начинается с [0, 1] или [1, 1]")
        }
    }
}

var fibArray = [0, 1, 1, 2, 3, 5, 8]
addfibNum(to: &fibArray, amount: 50)
print(fibArray)

//6) Заполним массив из 100 элементов различными простыми числами.
// данная функция получает на вход массив и оставляет в нем только простые числа 
func primeNumbers(arrayPassed: inout Array<Int>) {
    let primes = arrayPassed
    arrayPassed.removeAll()
    var devisors = 0
    for num in primes {
        for del in 2...10 {
            if num % del == 0 {
                devisors += 1
            }
            if del == num {
                if devisors == 1 {
                    arrayPassed.append(num)
                    devisors = 0
                } else {
                    devisors = 0
                }
            }
        }
    }
}
var array = Array(2...100)
print(array)
primeNumbers(arrayPassed: &array)
print(array)



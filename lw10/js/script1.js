function getResult(n) {
    let isPrime
    for (let i = 2; i <= n; i++) {
        isPrime = true
        for (let j = 2; j < i; j++) {
            if (i % j === 0) {
                isPrime = false
                break
            }
        }
    }
    if (isPrime) {
        return console.log('простое число: ' + n)
    } else {
        return console.log('не простое число: ' + n)
    }
}

function isPrimeNumber(value) {
    if (typeof (value) === 'number') {
        getResult(value)
    } else if (value instanceof Array) {

        let checkArray = true
        if (value.length !== 0) {
            for (let i = 0; i < value.length; i++) {
                if (typeof (value[i]) !== 'number') {
                    checkArray = false
                    return console.log('в массив надо положить только числа, а то не по кайфу')
                }
            }
            for (let i = 0; i < value.length; i++) {
                getResult(value[i])
            }
        } else {
            return console.log('пустой массив, серьезно?')
        }

    } else {
        return console.log('ты по-моему перепутал')
    }
}

console.log('Введите число либо массив чисел, для того чтобы проверить является ли число простым')
console.log('Для проверки используйте функцию isPrimeNumber(value)')
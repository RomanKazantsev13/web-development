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
        return 'Результат: ' + n + ' is prime number'
    } else {
        return 'Результат: ' + n + ' is not prime number'
    }
}

function isPrimeNumber(value) {
    if (typeof (value) === 'number') {
        return getResult(value)
    } else if (value instanceof Array) {

        let resultArray = '\n'
        if (value.length !== 0) {
            for (let i = 0; i < value.length; i++) {
                if (typeof (value[i]) !== 'number') {
                    return 'Массив содержит элементы, которые не являются числом'
                }
            }
            for (let i = 0; i < value.length; i++) {
                resultArray += (getResult(value[i]) + '\n')
            }
            return resultArray
        } else {
            return 'Массив пуст'
        }

    } else {
        return 'Непподерживаемый тип данных'
    }
}
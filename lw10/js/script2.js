function simpleCalculate(value) {

    let result

    value = value.split(' ')
    let operation = value[0]
    let firstTerm = Number(value[1]) // на этом этапе можно выводить ошибки
    let secondTerm = Number(value[2])

    console.log(firstTerm + " " + operation + " " + secondTerm)

    switch (operation) {
        case '+':
            result = firstTerm + secondTerm
            break
        case '-':
            result = firstTerm - secondTerm
            break
        case '*':
            result = firstTerm * secondTerm
            break
        case '/':
            result = firstTerm / secondTerm
    }
    return result
}

function calc(value) {

    let stringReplaced
    let contentString
    let i1 = value.indexOf ('(')
    let i2 = value.lastIndexOf (')')

    if (i1 === -1 && i2 === -1) { //скобок больше нет, сделать замену в будущем
       return simpleCalculate(value)
    }

    stringReplaced = value.slice(i1, i2 + 1)
    contentString = value.slice(i1 + 1, i2)

    console.log("stringBeforeReplace " + value)

    value = value.replace(stringReplaced, "" + calc(contentString))

    console.log("replace again " + calc(value))

    console.log("what is here " + value)
}
// includes
// Проверяет, содержит ли строка указанную подстроку.
// Возвращает значение true или false.
// Вторым параметром можно указать позицию в строке, с которой следует начать поиск.

если indexOf !== lastIndexOf
тогда надо днлпть рекусрию для обоих слагаемых
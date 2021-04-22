function simpleCalculate(value) {

    value = value.replace(/^\s*(.*)\s*$/, '$1')
    value = value.replace(/ +/g, ' ').trim()
    value = value.split(' ')

    let result
    let operation = value[0]
    let firstTerm = Number(value[1])
    let secondTerm = Number(value[2])

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
    let i1 = value.indexOf('(')
    let i2 = value.lastIndexOf(')')

    if (i1 === -1 && i2 === -1) {
        return simpleCalculate(value)
    }

    stringReplaced = value.slice(i1, i2 + 1) // '( ... )'
    contentString = value.slice(i1 + 1, i2)  // '  ...  '

    value = value.replace(stringReplaced, " " + calc(contentString))

    return calc(value)
}
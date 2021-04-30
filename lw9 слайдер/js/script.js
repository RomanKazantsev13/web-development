let button_left   = document.getElementById('arrow_left')
let button_right  = document.getElementById('arrow_right')
let background    = document.getElementById('home')
let sliderElements = document.querySelectorAll('.slide')

let countSlide = sliderElements.length
let position = 0

function moveSlide(value) {
    sliderElements[position].hidden = true
    background.classList.remove('header_wrapper-' + position)

    switch (value) {
        case 'L':
            position--
            break
        case 'R':
            position++
    }
    if (position === countSlide) {
        position = 0
    }
    if (position === -1) {
        position = countSlide - 1
    }

    sliderElements[position].hidden = false
    background.classList.add('header_wrapper-' + position)
}

for (let i = 0; i < countSlide; i++) {
    sliderElements[i].hidden = true
}
sliderElements[0].hidden = false
button_left.onclick = () => moveSlide('L')
button_right.onclick = () => moveSlide('R')
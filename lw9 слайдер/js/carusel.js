let sliderElements = document.querySelectorAll('.slide')
let button_left   = document.getElementById('arrow_left')
let button_right  = document.getElementById('arrow_right')

button_left.onclick = () => elemPrev()
button_right.onclick = () => elemNext()

function elemPrev() {
    //transition: margin '+ options.speed+'ms ease
}

function elemNext() {

}

let elm, buf;
elm = crslList.lastElementChild
buf = elm.cloneNode(true)
crslList.insertBefore(buf, crslList.firstElementChild)
crslList.removeChild(elm)
crslList.style.marginLeft = '-' + elemWidth + 'px'
window.getComputedStyle(crslList).marginLeft
crslList.style.cssText = 'transition: margin '+options.speed+'ms ease;'
crslList.style.marginLeft = '0px'
setTimeout(function() {
    crslList.style.cssText = 'transition: none;'
}, options.speed)
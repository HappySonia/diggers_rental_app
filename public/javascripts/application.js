var order = document.querySelector(".order_button")

order.addEventListener('click', function() {

    var orderConfirmation = document.querySelector('.order_confirmation')
    orderConfirmation.textContent = "Your order has been submitted sucessfully!thank you"
    orderConfirmation.style.fontSize = "1.3em"
    orderConfirmation.style.textAlign = "center"
    orderConfirmation.style.color = "blue"
})
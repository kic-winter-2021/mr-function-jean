/**
 * 
 */
function updateAll() {
    var n1 = document.getElementById("jean1").value;
    var n2 = document.getElementById("jean2").value;
    var n3 = document.getElementById("jean3").value;

    var p1 = 25000 * n1;
    var p2 = 27000 * n2;
    var p3 = 25000 * n3;

    document.getElementById("jean1Total").value = p1
    document.getElementById("jean2Total").value = p2
    document.getElementById("jean3Total").value = p3

    var shipping = 2500 + 3000 + 2500;
    document.getElementById("shipping").value = shipping;

    var totalNumber = parseInt(n1) + parseInt(n2) + parseInt(n3);
    document.getElementById("totalNumber").value = totalNumber;

    var totalPrice = p1 + p2 + p3 + shipping;
    document.getElementById("totalPrice").value = totalPrice;

}
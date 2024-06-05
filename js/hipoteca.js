function calcularhipoteca(e){
    e.preventDefault();

let calculo = document.forms["hipoteca"]["cuota"].value; 
let calculoTotal = document.forms["hipoteca"]["valortotal"].value; 
let calculoInteres = document.forms["hipoteca"]["interes"].value; 
let calculoPlazos = document.forms["hipoteca"]["plazo"].value; 
const MESES_AÑO = 12;

const hipo = {
    totalPrestamo : 0, 
    totalInteres : 0,
    cuotaMensual : 0,

}

hipo.totalPrestamo = calculoTotal - calculo;
hipo.totalInteres = hipo.totalPrestamo * calculoInteres / 100;
hipo.cuotaMensual = (hipo.totalPrestamo + hipo.totalInteres) / (calculoPlazos * MESES_AÑO); 

hipo.cuotaMensual = hipo.cuotaMensual.toFixed(2);

ouputHipoteca(hipo);
}


function ouputHipoteca(hipotecaFinal){
    document.getElementById("tprestamo").innerHTML = hipotecaFinal.totalPrestamo;
    document.getElementById("tmensual").innerHTML = hipotecaFinal.cuotaMensual;

}

function resetform (){
    document.forms["hipoteca"].reset();
    document.getElementById("tprestamo").innerHTML = "";
    document.getElementById("tmensual").innerHTML = "";
}
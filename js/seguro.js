function calcularSeguroVida(e) {
    e.preventDefault();
    const edad = document.getElementById("edad").value;
    const genero = document.getElementById("genero").value;
    const sumaAsegurada = document.getElementById("sumaAsegurada").value;
    const plazo = document.getElementById("plazo").value;

    let tasaPrima = 0.005; 

    
    if (edad > 50) {
        tasaPrima += 0.002; 
    }

    // A ver esto es simplemente una tasa basada en el genero
    //porque hemos visto que si eres hombre pagas un 0.001 más 
    if (genero === "male") {
        tasaPrima += 0.001; 
    }

    const primaAnual = sumaAsegurada * tasaPrima;
    document.getElementById("primaAnual").innerText = primaAnual.toFixed(2);
}

function resetformSeguro (){
    document.forms["seguroVidaForm"].reset();
    document.getElementById("primaAnual").innerHTML = "";
}
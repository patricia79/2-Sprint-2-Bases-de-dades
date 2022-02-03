
let arrayCust = [];

let contar = _ => {
    for (let i = 1; i < 11; i++) {
        console.log(`cliente ${i}`);
    }
    console.log("final")
}


while (arrayCust.length < 11) {
    arrayCust.push(contar);

}


for (let i = 1; i < 11; i++) {
    (arrayCust[i])();
}


let arrayDirec = [];

let contarj = _ => {
    for (let j = 1; j < 11; j++) {
        console.log(`direccion ${j}`);
    }
    console.log("final")
}


while (arrayDirec.length < 11) {
    arrayDirec.push(contarj);

}


for (let j = 1; j < 11; j++) {
    (arrayDirec[j])();
}

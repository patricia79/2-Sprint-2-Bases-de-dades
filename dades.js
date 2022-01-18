
let arrayFunc = [];

let contar = _ => {
    for (let i = 0; i < 10; i++) {
        console.log(i);
    }
    console.log("final")
}


while (arrayFunc.length < 10) {
    arrayFunc.push(contar);

}

for (let i = 0; i < 10; i++) {
    (arrayFunc[i])();
}

console.log(arrayFunc);

/*

let arrayFunc = new Array(10); //crea array buida q tindrà 10 posicions

let contar = _ => {
    for (let i = 0; i < arrayFunc.length; i++) {
        console.log(i);
    }
    console.log("fin")
}

for (let i = 0; i < arrayFunc.length; i++) {
    arrayFunc[i] = contar;
}

for (let i = 0; i < 10; i++) {
    (arrayFunc[i])();
}

console.log(arrayFunc);*/

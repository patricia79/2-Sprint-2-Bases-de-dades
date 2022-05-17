
db.comandes.insertMany([
  {
    client:
    {
        nom: 'client1',
        cognom: 'cognom1',
        address: 'adress_1',
        codipostal: '08100',
        localitat: 'localitat1',
        provincia: 'prov1',
        telefon: 123456789
    },
    dataHora: new Date('2022-05-21 17:56:45'),
    tipus_lliurament: 'per emportar',
    productes: [
      {
        nom: 'pizza',
        categoria: 'categoria1',
        descripcio: 'descripcio1',
        imatge: 'imatge1',
        preu: 10
      },
      {
        nom: 'beguda',
        descripcio: 'descripcio2',
        imatge: 'imatge2',
        preu: 2.50
      }
    ],
   preuTotal: 12.50,
    botiga: 
    {
      id: 1,
      address: 'adress2',
      postcode: '08100',
      localitat: 'localitat1',
      provincia: 'provincia1'
    }
  },
  {
    client:  
    {
      nom: 'client2',
      cognom: 'cognom2',
      address: 'adress_2',
      codipostal: '08200',
      localitat: 'localitat2',
      provincia: 'prov2',
      telefon: 222222222
    },
    dataHora: new Date('2022-09-04 12:35:05'),
    tipus_lliurament: 'take away',
    productes: [
      {
        nom: 'burger',
        descripcio: 'descripcio3',
        imatge: 'imatge3',
        preu: 7.50
      },
      {
        nom: 'beguda',
        descripcio: 'descripcio2',
        imatge: 'imatge2',
        preu: 2.50
      }
    ],
  preuTotal: 10,
    botiga: 
    {
      id: 1,
      address: 'adress2',
      postcode: '08100',
      localitat: 'localitat1',
      provincia: 'provincia1'
    }
  }
  
    ])
   
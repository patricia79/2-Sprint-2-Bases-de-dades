
db.comanda.insertMany([
  {
    client:
    {
        nom_client: 'client1',
        cognom: 'cognom1',
        address: 'adress 1',
        codiPostal: '08100',
        localitat: 'loc1',
        provincia: 'prov1',
        telefon: 111111111
    },
    datahora: new Date('2021-01-30 20:00:00'),
    tipus_entrega: 'recollir',
    productes: [
      {
        nom_producte: 'pizza',
        categoria: 'cat1',
        descripcio: 'descripcio1',
        imatge: 'img.com',
        preu: 9.40
      },
      {
        nom_producte: 'beguda',
        descripcio: 'descripcio2',
        imatge: 'img.com',
        preu: 2.50
             }
    ],
    totalPrice: 11.90,
    botiga: 
    {
      id: 1,
      address: 'botiga adress1',
      postcode: '08012',
      localitat: 'loc1',
      provincia: 'prov1'
    }
  },
  {
    client:  
    {
      nom_client: 'client2',
      cognom: 'cognom2',
      address: 'adress 2',
      codiPostal: '08200',
      localitat: 'loc2',
      provincia: 'prov2',
      telefon: 222222222
    },
    dateAndTime: new Date('2021-02-28 20:00:00'),
    type: 'domicili',
    products: [
      {
        name: 'burger',
        description: 'descripcio3 ipsum dolor sit amet',
        img: 'img.com',
        price: 5.50
      },
      {
        name: 'beguda',
        description: 'descripcio4',
        img: 'img.com',
        price: 2.50
      }
    ],
    totalPrice: 8,
    botiga: {
      id: 2,
      address: 'botiga adress2',
      postcode: '08200',
      localitat: 'loc2',
      provincia: 'prov2'
    }
  },
  {
    client:  
    {
        name: 'Chandler',
        surname: 'Bing',
        address: 'somewhere 123',
        postcode: '08012',
        localidad: 'loc1',
        provincia: 'prov2',
        phoneNumber: 123456789
    },
    dateAndTime: new Date('2021-08-25 18:38:45'),
    type: 'take away',
    products: [
      {
        name: 'burger1',
        description: 'Lorem ipsum dolor sit amet',
        img: 'img.com',
        price: 6.50
      },
      {
        name: 'burger2',
        description: 'Lorem ipsum dolor sit amet',
        img: 'img.com',
        price: 8.50
      },
      {
        name: 'beguda',
        description: 'descripcio4',
        img: 'img.com',
        price: 2.50
      },
      {
        name: 'beguda',
        description: 'descripcio5',
        img: 'img.com',
        price: 2.50
      },
      {
        name: 'beguda',
        description: 'descripcio6',
        img: 'img.com',
        price: 2.50
      }
    ],
    totalPrice: 17.50,
    shop: 
    {
      id: 2,
      address: 'botiga adress2',
      postcode: '08200',
      localitat: 'loc2',
      provincia: 'prov2'
    }
  }
])
  

id_treballador INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(40) NOT NULL,
  cognom VARCHAR(40) NOT NULL,
  nif VARCHAR(100) NOT NULL,
  telefon INT NOT NULL,
  carrec enum ('cuinera', 'repartidora'),
  idbotiga INT NOT NULL,
  FOREIGN KEY (idbotiga) REFERENCES botigues (idbotiga)